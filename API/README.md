# DFCU HR Management API

This API allows you to manage staff members in the DFCU HR system. It supports registering new staff, retrieving staff data, and updating staff details, all stored in a Firestore database.

The API is already deployed and available for use. You can access it using the following link:

**[Start Using the DFCU HR Management API](https://hr-mgt-system.onrender.com/)**

## Endpoints

### 1. Register Staff

- **Endpoint:** `/api/register`
- **Method:** `POST`
- **Description:** Registers a new staff member by processing form data, validating required fields, encoding an optional ID photo, generating an employee number, and saving the employee information to a Firestore database.

#### Form Fields:
- `surname` (str): The surname of the staff member.
- `other_names` (str): The other names of the staff member.
- `date_of_birth` (str): The date of birth of the staff member.
- `unique_code` (str): A unique code for the staff member.
- `id_photo` (str, optional): A base64 encoded image string or a file representing the ID photo.

#### Possible Responses:
- **201:** Staff registration successful with the generated employee number.
- **400:** Missing required fields, invalid unique code, or error processing the ID photo.
- **500:** Error saving the employee to the database.

---

### 2. Get Staff

- **Endpoint:** `/api/staff`
- **Method:** `GET`
- **Description:** Retrieves employee data from the Firestore database. If an employee number is provided as a query parameter, it retrieves the specific employee's data; otherwise, it retrieves data for all employees.

#### Query Parameters:
- `employee_number` (str, optional): The employee number to retrieve specific employee data.

#### Possible Responses:
- **200:** Employee data retrieved successfully.
- **404:** Employee not found if a specific ID is requested but not found.

---

### 3. Update Staff

- **Endpoint:** `/api/staff/<employee_number>`
- **Method:** `PUT`
- **Description:** Updates the details of an employee in the Firestore database. The function expects form data to be available in the request context.

#### Path Parameters:
- `employee_number` (str): The unique identifier of the employee to update.

#### Form Fields:
- `date_of_birth` (str, optional): The updated date of birth of the staff member.
- `id_photo` (str, optional): A base64 encoded image string or a file representing the updated ID photo.

#### Possible Responses:
- **200:** Employee updated successfully.
- **400:** No fields to update or error processing the image.
- **404:** Employee not found.
- **500:** Error updating employee in Firestore.

---

## Getting Started

1. **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/dfcu-hr-management-api.git
    ```
2. **Install the required dependencies:**
    ```bash
    pip install -r requirements.txt
    ```
3. **Set up your environment variables:**
    - Ensure you have a `key.json` for Firestore access.
    - Define `UNIQUE_CODE` for validating the staff registration.
4. **Run the application:**
    ```bash
    flask run
    ```

### Deployment on Render.com

1. **Create a new Web Service on Render.com:**
   - Go to your [Render dashboard](https://dashboard.render.com/) and create a new Web Service.
   - Link your GitHub repository containing this project.

2. **Configure environment variables:**
   - Add the required environment variables such as `UNIQUE_CODE`.
   - Upload your `key.json` file securely:
     - In the **Environment** tab, click on **Add Secret File** and upload the `key.json`.

3. **Set the Start Command:**
   - Use the following command to start your Flask application:
     ```bash
     gunicorn main:app
     ```
   - Make sure your `main.py` file has the `app` instance defined.

4. **Deploy:**
   - Render will automatically build and deploy your application based on the repository.
   - After deployment, your API will be available at the generated Render URL.

5. **Test the Deployment:**
   - Use tools like Postman or cURL to test your API endpoints at the deployed URL:
     ```bash
     https://your-app-name.onrender.com/api/register
     ```
   - Replace `your-app-name` with the actual name given by Render.com.



---