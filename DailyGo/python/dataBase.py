import mysql.connector
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="dailyGo",
  port=3306
)

# Crear un cursor
mycursor = mydb.cursor()

# Ejecutar una consulta
mycursor.execute("SELECT * FROM clientes")

# Obtener los resultados
resultados = mycursor.fetchall()

# Mostrar los resultados
for resultado in resultados:
  print(resultado)