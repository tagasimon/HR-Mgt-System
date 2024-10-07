import base64
import random
import string

def generate_employee_number():
    """Generate a unique 10-digit employee number."""
    return ''.join(random.choices(string.digits, k=10))

def encode_image(image_data):
    """Encode image file as Base64 string."""
    return base64.b64encode(image_data.encode('utf-8')).decode('utf-8')