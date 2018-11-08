#python lib
import os
#flask lib
from flaskext.enterprise import Enterprise
from flask import Flask, render_template
from transdb import ServiciosDisp

app = Flask(__name__)           #config Flask
enterprise = Enterprise(app)    #config Flask Enterprise

class Service(enterprise.SOAPService):
    Servicio = ServiciosDisp()
    String = enterprise._sp.String
    Integer = enterprise._sp.Integer
    Boolean = enterprise._sp.Boolean
    Array = enterprise._scls.Array

    """
    Attributes:
        __soap_target_namespace__ : namespace for soap service
        __soap_server_address__ : address of soap service
    """
    __soap_target_namespace__ = 'MyNS'
    __soap_server_address__ = '/soap'

    @enterprise.soap(Integer,_returns=Array(String))
    def consultaId(self,parametro):
        return Servicio.consProdPorId(parametro)
    
    @enterprise.soap(String,_returns=Array(String))
    def consultaDesc(self,parametro):
        return Servicio.consProdPorNombre(parametro)

#if __name__ == '__main__':
 #   app.run()