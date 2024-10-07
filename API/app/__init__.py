import os
from flask import Flask
from google.cloud import firestore
from .routes.home import home_bp
from .routes.employees import employees_bp
from flask_cors import CORS

def create_app():
    app = Flask(__name__)
    CORS(app) 

    # Set up Firestore client
    os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "key.json"
    app.db = firestore.Client()

    # Register Blueprints
    app.register_blueprint(home_bp)
    app.register_blueprint(employees_bp)
    return app