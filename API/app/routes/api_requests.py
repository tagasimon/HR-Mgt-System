from flask import Blueprint,  jsonify, current_app

api_requests_bp = Blueprint('API_REQUESTS', __name__)

# Staff Retrieval API
@api_requests_bp.route('/api/requests', methods=['GET'])
def get_requests():
    """
    Fetches all documents from the 'API_REQUESTS' collection in the database and returns them as a JSON response.
    """
    db = current_app.db
    collection_ref = db.collection('API_REQUESTS')
    docs = collection_ref.stream()
    data = []
    for doc in docs:
        data.append(doc.to_dict())
    return jsonify(data), 200