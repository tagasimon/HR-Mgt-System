from flask import Flask
import os

def create_app():
    app = Flask(__name__)

    # Register Blueprints
    from .routes.home import home_bp
    app.register_blueprint(home_bp)
    from .routes.employees import employees_bp
    app.register_blueprint(employees_bp)

    return app