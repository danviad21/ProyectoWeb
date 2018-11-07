from cdb import cnxdb

class crud(object):

	def __init__(self):
		self.__CONEXION = cnxdb()
		self.__CURSOR = None

	def _insertar_producto(self):
		script = """INSERT INTO Empresa VALUES(%s,%s)""";
		values = (1,'Empresa 1')
		self.__CONEXION._conectar()
		self.__CONEXION._insertar(script,values)


primer = crud()
primer._insertar_producto()

