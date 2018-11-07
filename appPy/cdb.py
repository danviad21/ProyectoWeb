from mysql.connector import connection as cn
from mysql.connector.errors import Error

class cnxdb(object):

	def __init__(self):
		self.__HOST="localhost"
		self.__USER="root"
		self.__PASS="odavid"
		self.__DB="Inventario"
		self.__cnx=None
	
	def __conexion(self):
		try:
			self.__cnx = cn.MySQLConnection(host=self.__HOST,user=self.__USER,passwd=self.__PASS,database=self.__DB,auth_plugin='mysql_native_password')
			print "conectado a la base de datos"
		except Error as er: 
			print "ESTE ES UN GRAN ERROR",er.sqlstate,er.msg

	def _conectar(self):
		self.__conexion()
		return self.__cnx

	def _desconectar(self):
		if self.__cnx!= None:
			print "desconectado"
			self.__cnx.close()
		else:
			print "no estaba conectado"

	def _insertar(self,script,tupla):
		if self.__cnx != None:
			cursor = self.__cnx.cursor(prepared=True)
			cursor.execute(script,tupla)
			self.__cnx.commit()
			cursor.close()
			self._desconectar()