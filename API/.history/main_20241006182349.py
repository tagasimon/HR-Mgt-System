from app import create_app
import gunicorn
from flask_sqlalchemy import SQLAlchemy

app = create_app()

if __name__ == '__main__':
    app.run(debug=True)
    # gunicorn.main(bind='0.0.0.0:8000', workers=1)
