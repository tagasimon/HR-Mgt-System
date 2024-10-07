class APIRequest:
    def __init__(self, name, status, message, date):
        self.name = name
        self.status = status
        self.message = message
        self.date = date

    def serialize(self):
        """
        Serializes the API request object into a dictionary format.

        Returns:
            dict: A dictionary containing the API request's name, status, and message.
        """
        return {
            'name': self.name,
            'status': self.status,
            'message': self.message,
            'date': self.date
        }