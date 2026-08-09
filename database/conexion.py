import pyodbc
from config import *

def conectar(): # funcion del tipo conectar a la base de datos

    conexion = pyodbc.connect(

        f"DRIVER={{{DRIVER}}};"
        f"SERVER={SERVER};"
        f"DATABASE={DATABASE};"
        f"UID={USERNAME};"
        f"PWD={PASSWORD};"
        "Encrypt=yes;"
        "TrustServerCertificate=yes;"

    )

    return conexion
