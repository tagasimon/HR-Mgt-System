from app import create_app
import gunicorn

app = create_app()

if __name__ == '__main__':
    # app.run(debug=True)
    gunicorn.main(bind='0.0.0.0:8000', workers=1)
