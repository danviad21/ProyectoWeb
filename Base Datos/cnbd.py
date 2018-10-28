from mysql.connector import (connection)

mydb = connection.MySQLConnection(
  host="localhost",
  user="root",
  passwd="odavid1990",
  database="Inventario"
)
cursor = mydb.cursor()

insert_empresa = "INSERT INTO Inventario.Proveedor(razon_social_prov) values(%s)"
data_empresa = ('EMPRESA 3')
#query = "SELECT * FROM Inventario.Empresa"
#cursor.execute(query)
#records = cursor.fetchall()
#print "Total number of rows in python_developers is - ", cursor.rowcount
#print "Printing each row's column values i.e.  developer record"
#for row in records:
 #  print "Id_Empresa = ", row[0]
  # print "Empresa = ", row[1]
cursor.execute(insert_empresa,data_empresa)
mydb.commit()
cursor.close()
mydb.close()

