class APIRequest:
    """
    APIRequest class to represent an API request object.
    """
    def __init__(self, name, status, message, date, method):
        self.name = name
        self.status = status
        self.message = message
        self.date = date
        self.method = method

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
            'date': self.date,
            'method': self.method
        }