from extensions import db

class registro(db.Model):
    _tablename_ = 'registro'
    id_registro = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(50))
    correo = db.Column(db.String(50))
    telefono = db.Column(db.String(20))
    contrasena = db.Column(db.String(100))

class usuario(db.Model):
    _tablename_ = 'usuario'
    id_usuario = db.Column(db.Integer, primary_key=True)
    id_registro = db.Column(db.Integer, db.ForeignKey('registro.id_registro'))
    cuenta = db.relationship('cuenta', backref='usuario', uselist=False)

class cuenta(db.Model):
    _tablename_ = 'cuenta'
    id_cuenta = db.Column(db.Integer, primary_key=True)
    rol = db.Column(db.Enum('admin', 'usuario'))
    id_usuario = db.Column(db.Integer, db.ForeignKey('usuario.id_usuario'))

class empleador(db.Model):
    _tablename_ = 'empleador'
    id_empleador = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100))
    documento = db.Column(db.String(20))
    email = db.Column(db.String(100))
    direccion = db.Column(db.String(100))
    telefono = db.Column(db.String(20))
    acciones = db.relationship('accion', backref='empleador')

class ubicacion(db.Model):
    _tablename_ = 'ubicacion'
    id_ubicacion = db.Column(db.Integer, primary_key=True)
    barrio = db.Column(db.String(100))
    localidad = db.Column(db.String(100))
    latitud = db.Column(db.Numeric(10,7))
    longitud = db.Column(db.Numeric(10,7))
    reportes = db.relationship('reporte', backref='ubicacion')

class estado_prueba(db.Model):
    _tablename_ = 'estado_prueba'
    id_estado = db.Column(db.Integer, primary_key=True)
    estado = db.Column(db.Enum('activo', 'inactivo', 'en proceso'))
    fecha = db.Column(db.DateTime)
    id_reporte = db.Column(db.Integer, db.ForeignKey('reporte.id_reporte'))

class reporte(db.Model):
    _tablename_ = 'reporte'
    id_reporte = db.Column(db.Integer, primary_key=True)
    zona_reporte = db.Column(db.String(100))
    hora_reporte = db.Column(db.Time)
    descripcion = db.Column(db.Text)
    id_usuario = db.Column(db.Integer)
    id_estado = db.Column(db.Integer)
    id_ubicacion = db.Column(db.Integer, db.ForeignKey('ubicacion.id_ubicacion'))
    id_tipo = db.Column(db.Integer, db.ForeignKey('tipo_hurto.id_tipo'))
    acciones = db.relationship('accion', backref='reporte')
    estado_pruebas = db.relationship('estado_prueba', backref='reporte')

class accion(db.Model):
    _tablename_ = 'accion'
    id_accion = db.Column(db.Integer, primary_key=True)
    tipo_accion = db.Column(db.Enum('agregar', 'modificar', 'eliminar'))
    comentario = db.Column(db.Text)
    fecha_hora = db.Column(db.DateTime)
    id_empleador = db.Column(db.Integer, db.ForeignKey('empleador.id_empleador'))
    id_reporte = db.Column(db.Integer, db.ForeignKey('reporte.id_reporte'))

class tipo_hurto(db.Model):
    _tablename_ = 'tipo_hurto'
    id_tipo = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100))
    descripcion = db.Column(db.String(100))
    reportes = db.relationship('reporte', backref='tipo_hurto')

class contacto(db.Model):
    _tablename_ = 'contacto'
    id_contacto = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(50))
    email = db.Column(db.String(50))
    mensaje = db.Column(db.Text)