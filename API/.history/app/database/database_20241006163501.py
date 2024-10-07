from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

DATABASE_URL = 'sqlite:///dfcu_hr.db'  # SQLite for demo; use a more robust DB in production

engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)
db_session = Session()

Base = declarative_base()

def init_db():
    import models
    Base.metadata.create_all(bind=engine)