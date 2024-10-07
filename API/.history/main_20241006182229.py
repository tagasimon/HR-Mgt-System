from app import create_app
import gunicorn
from flask_sqlalchemy import SQLAlchemy

app = create_app()

# Database configuration
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///dfcu_hr.db'  # Change for production
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)  # Initialize SQLAlchemy with the Flask app

if __name__ == '__main__':
    app.run(debug=True)
    # gunicorn.main(bind='0.0.0.0:8000', workers=1)
