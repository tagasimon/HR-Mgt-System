class Employee:
    """
    A class to represent an employee.
    """
    def __init__(self, surname, other_names, date_of_birth, employee_number, id_photo):
        self.surname = surname
        self.other_names = other_names
        self.date_of_birth = date_of_birth
        self.employee_number = employee_number
        self.id_photo = id_photo

    def serialize(self):
        """
        Serializes the employee object into a dictionary format.

        Returns:
            dict: A dictionary containing the employee's surname, other names, date of birth,
                  employee number, and ID photo.
        """
        return {
            'surname': self.surname,
            'other_names': self.other_names,
            'date_of_birth': self.date_of_birth,
            'employee_number': self.employee_number,
            'id_photo': self.id_photo
        }
