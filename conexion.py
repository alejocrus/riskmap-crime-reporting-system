import os

class Config:
    SQLALCHEMY_DATABASE_URI = "mysql://root:@localhost/riskmap"
    SQLALCHEMY_TRACK_MODIFICATIONS = False

SECRET_KEY = "mi_clave_secreta_segura"


# Conexión a la base de datos

