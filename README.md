<<<<<<< HEAD
#  RiskMap — Plataforma web de reporte de hurtos en Bogotá

RiskMap es una aplicación web desarrollada en **Python con Flask** que permite a ciudadanos reportar incidentes de hurto en Bogotá, y a administradores gestionar y visualizar esos reportes desde un panel de control.

---

##  Descripción

El sistema cuenta con tres roles diferenciados:

- **Visitante**: puede ver el mapa de riesgo, consultar el FAQ y enviar mensajes de contacto.
- **Cliente (usuario registrado)**: puede iniciar sesión y reportar hurtos.
- **Administrador**: accede a un panel con reportes de clientes y tipos de hurto registrados.

---

##  Tecnologías usadas

|    Tecnología     | Versión |
|-------------------|---------|
| Python / Flask    | 3.1.0   |
| Flask-SQLAlchemy  | 3.1.1   |
| SQLAlchemy        | 2.0.40  |
| PyMySQL           | 1.1.1   |
| MySQL (MariaDB)   | 10.4.32 |
| Bootstrap         | 5.3.5   |

---

## Estructura del proyecto

```
riskmap/
├── app.py                  # Aplicación principal y rutas generales
├── conexion.py             # Configuración de conexión a la BD
├── extensions.py           # Inicialización de extensiones (SQLAlchemy)
├── models.py               # Modelos de la base de datos (ORM)
├── requirements.txt        # Dependencias del proyecto
├── .gitignore
├── README.md
├── routes/
│   ├── Dashboard_routes.py
│   ├── DashboardAdmin_routes.py
│   └── DashboardCliente_routes.py
├── templates/              # HTML con Jinja2
├── static/                 # CSS, imágenes, Bootstrap
├── database/
│   └── riskmap.sql         # Script de creación e inserción de la BD
└── docs/
    └── DocumentacionProyectoFinal.pdf
```

---

## Cómo ejecutar el proyecto

### 1. Clona el repositorio
```bash
git clone https://github.com/tu-usuario/riskmap.git
cd riskmap
```

### 2. Instala las dependencias
```bash
pip install -r requirements.txt
```

### 3. Configura la base de datos
- Abre MySQL/phpMyAdmin
- Crea una base de datos llamada `riskmap`
- Importa el archivo `database/riskmap.sql`

### 4. Configura la conexión en `conexion.py`
```python
SQLALCHEMY_DATABASE_URI = "mysql://tu_usuario:tu_contraseña@localhost/riskmap"
```

### 5. Ejecuta la aplicación
```bash
python app.py
```

Abre tu navegador en `http://localhost:5000`

---

##  Credenciales de prueba

|      Rol      |   Usuario   | Contraseña  |
|---------------|-------------|-------------|
| Administrador | Juan Pérez  | password123 |
| Cliente       | María García| securepass  |

>  Estas credenciales son solo para entorno local de prueba.

---

## Funcionalidades

- Registro e inicio de sesión con roles (admin / usuario)
- Reporte de hurtos con zona, hora y descripción
- Panel administrativo con listado de clientes y reportes
- Mapa de Bogotá integrado
- Formulario de contacto
- Sección de preguntas frecuentes (FAQ)

---

## Contexto académico

Proyecto desarrollado como parte del curso de **Programación Web / Bases de Datos** en [Tu universidad]. Incluye diseño de BD relacional, integración con Flask y manejo de sesiones por roles.

---

## Autor

**Alejandro Cruz Castañeda**  
Estudiante de Ingenieria De Sistemas — Minuto de Dios 
github.com/alejocrus 
=======
# riskmap-crime-reporting-system
Aplicación web en Python/Flask para reportar y visualizar zonas de hurto en Bogotá, con panel administrativo, autenticación por roles y base de datos MySQL.
>>>>>>> 7678ddd727db2218082bb780ac2da2a11ed1e267
