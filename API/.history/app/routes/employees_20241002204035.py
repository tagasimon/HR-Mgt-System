# users Blueprint

from flask import Blueprint, request, jsonify, current_app

employees_bp = Blueprint('employees', __name__)


@employees_bp.route('/employees/<employee_number>', methods=['GET'])
def get_employees():
    db = current_app.db
    try:
        region = request.args.get('region')
        if not region:
            # Reference to the Firestore collection
            collection_ref = db.collection('NICE_TWO_USERS').where('company_name', '==', 'NICE')
            docs = collection_ref.stream()

            data = []
            for doc in docs:
                data.append(doc.to_dict())

            return jsonify(data), 200

        if region:
            # Reference to the Firestore collection
            collection_ref = db.collection('NICE_TWO_USERS').where('region', '==', region).where('company_name', '==', 'NICE')
            docs = collection_ref.stream()

            data = []
            for doc in docs:
                data.append(doc.to_dict())

            return jsonify(data), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
