#python lib
import os
#flask lib
from flaskext.enterprise import Enterprise
from flask import Flask, render_template

#config Flask
app = Flask(__name__)

#config Flask Enterprise
enterprise = Enterprise(app)
#String = enterprise._sp.String
Integer = enterprise._sp.Integer
#Boolean = enterprise._sp.Boolean
#Array = enterprise._scls.Array

class Service(enterprise.SOAPService):
    """Soap Service Class
    
    Attributes:
        __soap_target_namespace__ : namespace for soap service
        __soap_server_address__ : address of soap service
    """
    __soap_target_namespace__ = 'MyNS'
    __soap_server_address__ = '/soap'

    

    @enterprise.soap(Integer, Integer, _returns=Integer)
    def sum(self, x, y):
        """ Function to sum two integer
        
        Args:
            x : int
            y : int
            
        Returns:
            return an int
        """
        return x+y

if __name__ == '__main__':
    app.run()