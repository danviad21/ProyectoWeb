#!/usr/bin/python
import sys
import logging
logging.basicConfig(stream=sys.stderr)
sys.path.insert(0,"/home/oem/Documentos/ProyectoWeb/")

from appPy import app as application
application.secret_key = 'odavid'
