from sqlalchemy import Column, String, Date, Integer
from app.database import  Base

class Employee(Base):
    __tablename__ = 'employees'

    id = Column(Integer, primary_key=True)
    surname = Column(String(50), nullable=False)
    other_names = Column(String(100), nullable=False)
    date_of_birth = Column(Date, nullable=False)
    employee_number = Column(String(10), unique=True, nullable=False)
    id_photo = Column(String, nullable=True)  # Store Base64-encoded string

    def serialize(self):
        return {
            'surname': self.surname,
            'other_names': self.other_names,
            'date_of_birth': self.date_of_birth.isoformat(),
            'employee_number': self.employee_number,
            'id_photo': self.id_photo
        }