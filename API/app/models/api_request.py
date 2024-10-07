class APIRequest:
    def __init__(self, name, status, message):
        self.name = name
        self.status = status
        self.message = message

    def serialize(self):
        """
        Serializes the API request object into a dictionary format.

        Returns:
            dict: A dictionary containing the API request's name, status, and message.
        """
        return {
            'name': self.name,
            'status': self.status,
            'message': self.message
        }