from flask import Flask, render_template, redirect, request, url_for, flash
from conexion import Config
from extensions import db
from models import registro, tipo_hurto, usuario, cuenta, empleador, ubicacion, estado_prueba, reporte, accion, contacto

app = Flask(__name__)
app.secret_key = "mi_clave_secreta_segura"  # Agrega esta línea
app.config.from_object(Config)
db.init_app(app)

# Blueprints
from routes.Dashboard_routes import dashboard_rm
from routes.DashboardCliente_routes import dashboard_cli
from routes.DashboardAdmin_routes import dashboard_admin

app.register_blueprint(dashboard_rm)
app.register_blueprint(dashboard_cli)
app.register_blueprint(dashboard_admin)

@app.route("/")
def home():
    return render_template("paginas_web/principal.html")

@app.route("/MAPABOGOTÁ")
def mapa_bogota():
    return render_template("paginas_web/mapa.html")

@app.route("/PRINCIPAL_ADMIN")
def principal_admin():
    registros = registro.query.all()
    tipos_hurto = tipo_hurto.query.all()
    usuarios = usuario.query.all()
    cuentas = cuenta.query.all()
    empleadores = empleador.query.all()
    ubicaciones = ubicacion.query.all()
    estados_prueba = estado_prueba.query.all()
    reportes = reporte.query.all()
    acciones = accion.query.all()

    return render_template(
        "paginas_web/zona_admin/principal_admin.html",
        registros=registros,
        tipos_hurto=tipos_hurto,usuarios=usuarios,
         cuentas=cuentas,empleadores=empleadores,
         ubicaciones=ubicaciones, estados_prueba=estados_prueba, reportes=reportes, acciones=acciones )

@app.route("/PRINCIPAL_CLIENTE")
def principal_cliente():
    return render_template("paginas_web/zona_cliente/principal_cliente.html")

@app.route("/FRM_REPORTE", methods=["GET", "POST"])
def formulario_reporte():
    if request.method == "POST":
        zona_reporte = request.form.get("zona_reporte")
        hora_reporte = request.form.get("hora_reporte")
        descripcion = request.form.get("descripcion")
        id_tipo = int(request.form.get("tipo")) 

        id_usuario = None  
        id_estado = 1      
        id_ubicacion = None  

        nuevo_reporte = reporte(
            zona_reporte=zona_reporte,
            hora_reporte=hora_reporte,
            descripcion=descripcion,
            id_usuario=id_usuario,
            id_estado=id_estado,
            id_ubicacion=id_ubicacion,
            id_tipo=id_tipo
        )
        db.session.add(nuevo_reporte)
        db.session.commit()
        flash("Reporte enviado correctamente.", "success")
        return redirect(url_for("formulario_reporte"))
    return render_template("formularios/Frm_reporte.html")

@app.route("/FRM_CONTACTO2", methods=["GET", "POST"])
def formulario_contacto2():
    if request.method == "POST":
        nombre = request.form.get("nombre")
        email = request.form.get("email")
        mensaje = request.form.get("mensaje")
        nuevoformulario = contacto(nombre=nombre, email=email, mensaje=mensaje)
        db.session.add(nuevoformulario)
        db.session.commit()
        return redirect(url_for("formulario_contacto2"))
    return render_template("formularios/Frm_contacto2.html")

@app.route("/FORMULARIO_LOGIN_ADMIN")
def formulario_login_admin():
    return render_template("formularios/Frm_login_admin.html")

@app.route("/LOGIN_ADMIN", methods=["POST"])
def login_admin():
    nombre = request.form.get("usuario")
    contrasena = request.form.get("clave")

    # Buscar en registro por nombre y contraseña
    reg = registro.query.filter_by(nombre=nombre, contrasena=contrasena).first()
    if not reg:
        flash("Contraseña o usuario invalido", "danger")
        return redirect(url_for("formulario_login_admin"))

    # Buscar en usuario
    usu = usuario.query.filter_by(id_registro=reg.id_registro).first()
    if not usu:
        flash("Usuario no encontrado.", "danger")
        return redirect(url_for("formulario_login_admin"))

    # Buscar en cuenta y verificar rol admin
    cta = cuenta.query.filter_by(id_usuario=usu.id_usuario, rol='admin').first()
    if not cta:
        flash("No tienes permisos de administrador.", "danger")
        return redirect(url_for("formulario_login_admin"))

    flash("Bienvenido, administrador.", "success")
    return redirect(url_for("principal_admin"))

@app.route("/FORMULARIO_LOGIN_CLIENTE")
def formulario_login_cliente():
    return render_template("formularios/Frm_login_cliente.html")

@app.route("/LOGIN_CLIENTE", methods=["POST"])
def login_cliente():
    nombre = request.form.get("usuario")
    contrasena = request.form.get("clave")

    # Buscar en registro por nombre y contraseña
    reg = registro.query.filter_by(nombre=nombre, contrasena=contrasena).first()
    if not reg:
        flash("Contraseña o usuario invalido", "danger")
        return redirect(url_for("formulario_login_cliente"))

    # Buscar en usuario
    usu = usuario.query.filter_by(id_registro=reg.id_registro).first()
    if not usu:
        flash("Usuario no encontrado.", "danger")
        return redirect(url_for("formulario_login_cliente"))

    # Buscar en cuenta y verificar rol
    cta = cuenta.query.filter_by(id_usuario=usu.id_usuario, rol='usuario').first()
    if not cta:
        flash("No tienes permisos de cliente.", "danger")
        return redirect(url_for("formulario_login_cliente"))

    flash("Bienvenido, cliente.", "success")
    return redirect(url_for("principal_cliente"))

@app.route("/FRM_REGISTRO", methods=["GET", "POST"])
def formulario_registro():
    if request.method == "POST":
        nombre = request.form.get("nombre")
        correo = request.form.get("correo")
        telefono = request.form.get("telefono")
        contrasena = request.form.get("clave")
        confirmar_clave = request.form.get("confirmar_clave")

        if contrasena != confirmar_clave:
            flash("Las contraseñas no coinciden.", "danger")
            return render_template("formularios/Frm_registro.html")

        # 1. Guardar en registro
        nuevo_registro = registro(
            nombre=nombre,
            correo=correo,
            telefono=telefono,
            contrasena=contrasena
        )
        db.session.add(nuevo_registro)
        db.session.commit()

        # 2. Guardar en usuario (usando el id_registro recién creado)
        nuevo_usuario = usuario(id_registro=nuevo_registro.id_registro)
        db.session.add(nuevo_usuario)
        db.session.commit()

        # 3. Guardar en cuenta (usando el id_usuario recién creado)
        nueva_cuenta = cuenta(rol='usuario', id_usuario=nuevo_usuario.id_usuario)
        db.session.add(nueva_cuenta)
        db.session.commit()

        flash("Registro exitoso.", "success")
        return redirect(url_for("formulario_login_cliente"))

    return render_template("formularios/Frm_registro.html")

@app.route("/REPORTE_CLIENTES")
def reporte_clientes():
    clientes = registro.query.all()
    print(f"DEBUG - Clientes encontrados: {clientes}")  
    return render_template("paginas_web/zona_admin/ReporteClientes.html", reportes=clientes)

@app.route("/REPORTE_HURTOS")
def reporte_hurtos():
    hurtos = tipo_hurto.query.all()
    print(f"DEBUG - Hurtos encontrados: {hurtos}")  
    return render_template("paginas_web/zona_admin/ReporteHurtos.html", reportes=hurtos)



if __name__ == "__main__":
    with app.app_context():
        db.create_all()
        print("Tablas creadas/existentes:")
        print(f"- Registro: {registro.query.count()} registros")
        print(f"- Tipo Hurto: {tipo_hurto.query.count()} registros")

    app.run(debug=True)
