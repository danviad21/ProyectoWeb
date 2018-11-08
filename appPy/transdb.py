from cdb import cnxdb

class ServiciosDisp():

	def __init__(self):
		self.__conexion = cnxdb()

	def consProdPorId(self,parametro):
		resultado=[]
	
		query = """SELECT descripcion_prod,stock,precio_stock FROM Producto WHERE id_producto = %s"""
		self.__conexion._conectar()
		cursor = self.__conexion._consulta1(query,int(parametro))
	
		for row in cursor:
			tupla = row[0],row[1],row[2]
			resultado.append(tupla)
		cursor.close();
		self.__conexion._desconectar()
		return resultado


	def consProdPorNombre(self,parametro):
		resultado=[]
		query = """SELECT descripcion_prod,stock,precio_stock FROM Producto WHERE UPPER(descripcion_prod) LIKE UPPER(%s)"""
		self.__conexion._conectar()
		cursor = self.__conexion._abrirCursor()
		cursor.execute(query, ('%'+parametro+'%',))		
		for row in cursor:
			tupla = row[0],row[1],row[2]
			resultado.append(tupla)
			print resultado
		cursor.close()
		self.__conexion._desconectar()
		return resultadoe