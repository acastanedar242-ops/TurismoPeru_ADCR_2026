from dotenv import load_dotenv
import os #acceder a las carpetas SO

load_dotenv(override=True) #cargar variables de entorno desde .env

SERVER = os.getenv("SERVER")
DATABASE = os.getenv("DATABASE")
USERNAME = os.getenv("USERNAME")
PASSWORD = os.getenv("PASSWORD")
DRIVER = os.getenv("DRIVER")


