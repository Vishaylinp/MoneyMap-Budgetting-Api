# MoneyMap Budget Tracking Api

MoneyMap is a Flask-based API designed to track personal finances by managing transactions and categories. It provides users with features to add, update, delete, and retrieve financial transactions reports, create budgets based on income, and organize expenditures into categories, allowing for seamless integration into web applications or apps.

### Setup Instructions
  In deployment all API routes will be accesible with HTTP request but for review and production the setup instructions are as follow:

  #### 1. Create a virtual enviroment in python and activate it

    ```bash
    python -m venv venv

    venv\Scripts\activate
    ```

  #### 2. install requirements
    ```bash
    pip install -r requirements.txt
    ```

### Usage guidelines

  #### 1. Start flask instance
    ```bash
    cd Moneymap/
    flask=app.py
    flask run
    ```

  #### 2. Accessing Routes
  To access routes in production make use of the curl command to send HTTTP requests with needed parameters and headers to API
  (refer to API Documentation bellow for more information)

---

# API Documentation
  ### Notes
  - Replace `<your_api_url>` with the actual URL of your API.
  - Replace `<your_jwt_token>` with the JWT token obtained during login.
  - Replace `<transaction_id>`, `<user_id>`, and `<category_id>` with actual IDs as necessary.
  - Replace `YYYY-MM-DD` with the desired start date to view previous reports.

  # Moneymap API Documentation - User Endpoints
  All routes related to user

    ## User Registration
    ### POST /register
    Register a new user to Moneymap.

    #### Request Body
      ```json
      {
          "username": "your_username",
          "password": "your_password"
      }
      ```

    #### Response
      - **201 Created:** User is registered successfully.
      - **400 Bad Request:** Username already exists.
      - **500 Internal Server Error:** An error occurred during registration.

    #### Curl Command
      ```bash
      curl -X POST http://<your_api_url>/register \
      -H "Content-Type: application/json" \
      -d '{"username": "your_username", "password": "your_password"}'
      ```

    ---

    ## User Login
    ### POST /login
    Login to Moneymap.

    #### Request Body
    ```json
    {
        "username": "your_username",
        "password": "your_password"
    }
    ```

    #### Response
    - **200 OK:** Login successful, returns a JWT access token.
    - **401 Unauthorized:** Incorrect username or password.

    #### Curl Command
    ```bash
    curl -X POST http://<your_api_url>/login \
    -H "Content-Type: application/json" \
    -d '{"username": "your_username", "password": "your_password"}'
    ```

    ---

    ## User Logout
    ### POST /logout
    Logout of Moneymap.

    #### Authentication
    - Requires a valid JWT access token in the Authorization header.

    #### Response
    - **200 OK:** Logout successful.

    #### Curl Command
    ```bash
    curl -X POST http://<your_api_url>/logout \
    -H "Authorization: Bearer <your_jwt_token>"
    ```
---

  # Moneymap API Documentation - Budget Endpoints
  All routes related to budget and transactions

  ## Insert Transaction
  ### POST /transactions
  Insert a new transaction for the user.

  #### Request Body
  ```json
  {
      "amount": float_vale,
      "category": "category_name"
  }
  ```

  #### Response
  - **201 Created:** Transaction inserted successfully.
  - **400 Bad Request:** Category is required.
  - **500 Internal Server Error:** An error occurred while inserting transaction.

  #### Curl Command
  ```bash
  curl -X POST http://<your_api_url>/transactions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <your_jwt_token>" \
  -d '{"amount": 100.00, "category": "Food"}'
  ```

  ## Delete Transaction
  ### DELETE /transactions/<int:id>
  Delete a transaction from the user's transactions.

  #### Parameters
  - **id**: The ID of the transaction to be deleted.

  #### Response
  - **200 OK:** Transaction successfully deleted.
  - **404 Not Found:** Transaction not found.
  - **500 Internal Server Error:** An error occurred while deleting transaction.

  #### Curl Command
  ```bash
  curl -X DELETE http://<your_api_url>/transactions/<transaction_id> \
  -H "Authorization: Bearer <your_jwt_token>"
  ```

  ## Fetch Transactions
  ### GET /transactions/<int:user_id>
  Fetch all transactions for a given user ID.

  #### Parameters
  - **user_id**: The ID of the user whose transactions are to be fetched.

  #### Response
  - **200 OK:** Returns a list of all transactions.
  - **404 Not Found:** No transaction found for this user ID.

  #### Curl Command
  ```bash
  curl -X GET http://<your_api_url>/transactions/<user_id> \
  -H "Authorization: Bearer <your_jwt_token>"
  ```

  ## Update Transaction
  ### PUT /transactions/<int:id>
  Update a transaction from the user's transactions.

  #### Parameters
  - **id**: The ID of the transaction to be updated.

  #### Request Body
  ```json
  {
      "amount": 150.00,
      "category": "Entertainment"
  }
  ```

  #### Response
  - **200 OK:** Transaction successfully updated.
  - **404 Not Found:** Transaction not found.
  - **500 Internal Server Error:** An error occurred while updating transaction.

  #### Curl Command
  ```bash
  curl -X PUT http://<your_api_url>/transactions/<transaction_id> \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <your_jwt_token>" \
  -d '{"amount": 150.00, "category": "Entertainment"}'
  ```


  ## Insert Category
  ### POST /categories
  Insert a new category.

  #### Request Body
  ```json
  {
      "category_name": "Savings"
  }
  ```

  #### Response
  - **201 Created:** Category inserted successfully.
  - **404 Not Found:** Category name is required.
  - **409 Conflict:** Category already exists.
  - **500 Internal Server Error:** An error occurred while inserting the category.

  #### Curl Command
  ```bash
  curl -X POST http://<your_api_url>/categories \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <your_jwt_token>" \
  -d '{"category_name": "Savings"}'
  ```

  ## Fetch Categories
  ### GET /categories
  Fetches all categories from the database.

  #### Response
  - **200 OK:** Returns a list of categories.
  - **404 Not Found:** No category found.

  #### Curl Command
  ```bash
  curl -X GET http://<your_api_url>/categories \
  -H "Authorization: Bearer <your_jwt_token>"
  ```

  ## Update Category
  ### PUT /categories/<int:id>
  Updates a category from the user's categories.

  #### Parameters
  - **id**: The ID of the category to be updated.

  #### Request Body
  ```json
  {
      "category_name": "Updated Category"
  }
  ```

  #### Response
  - **200 OK:** Category updated successfully.
  - **400 Bad Request:** Category name is required.
  - **404 Not Found:** Category not found.
  - **500 Internal Server Error:** An error occurred while updating the category.

  #### Curl Command
  ```bash
  curl -X PUT http://<your_api_url>/categories/<category_id> \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <your_jwt_token>" \
  -d '{"category_name": "Updated Category"}'
  ```

  ## Delete Category
  ### DELETE /categories/<int:id>
  Deletes a category and updates associated transactions.

  #### Parameters
  - **id**: The ID of the category to be deleted.

  #### Response
  - **200 OK:** Category deleted successfully.
  - **404 Not Found:** Category not found.

  #### Curl Command
  ```bash
  curl -X DELETE http://<your_api_url>/categories/<category_id> \
  -H "Authorization: Bearer <your_jwt_token>"
  ```


  ## Create Wealth Budget
  ### POST /wealth-budget
  Creates a wealth budget split based on the 50/30/20 principle.

  #### Request Body
  ```json
  {
      "income": 5000.00
  }
  ```

  #### Response
  - **200 OK:** Returns the budget split.
  - **400 Bad Request:** Please enter a valid income.

  #### Curl Command
  ```bash
  curl -X POST http://<your_api_url>/wealth-budget \
  -H "Content-Type: application/json" \
  -d '{"income": 5000.00}'
  ```
---

  # Moneymap API Documentation - Report Endpoints
  All routes related to reports

  ## Monthly Report Generation
  ### GET /report/monthly
  Generate a monthly report for the authenticated user.

  #### Authentication
    - Requires a valid JWT access token in the Authorization header.

  #### Response
    - **200 OK:** Monthly report updated, returns the updated report data.
    - **201 Created:** Monthly report created, returns the newly created report data.
    - **404 Not Found:** User not found.

  #### Curl Command
    ```bash
    curl -X GET http://<your_api_url>/report/monthly \
    -H "Authorization: Bearer <your_jwt_token>"
    ```

  ## View Previous Monthly Reports
  ### GET /report/monthly/view
  View previous monthly reports for the authenticated user based on the specified start date.

  #### Query Parameters
    - **start_date** (required): The start date in the format `YYYY-MM-DD`.

  #### Authentication
    - Requires a valid JWT access token in the Authorization header.

  #### Response
    - **200 OK:** Returns a list of previous monthly reports.
    - **400 Bad Request:** Start date is required or invalid date format.
    - **404 Not Found:** User not found.

  #### Curl Command
    ```bash
    curl -X GET "http://<your_api_url>/report/monthly/view?start_date=YYYY-MM-DD" \
    -H "Authorization: Bearer <your_jwt_token>"
    ```

### Notes
- Replace `<your_api_url>` with the actual URL of your API.
- Replace `<your_jwt_token>` with the JWT token obtained during login.
- Replace `<transaction_id>`, `<user_id>`, and `<category_id>` with actual IDs as necessary.
- Replace `YYYY-MM-DD` with the desired start date to view previous reports.

---


# Moneymap Project Architecture Overview
  ## Architecture Overview
  Moneymap is a personal finance tracker designed to help users manage their income, expenses, and generate financial reports. The project follows a modular architecture that separates concerns and enhances maintainability. Below is an overview of the key components of the architecture.

  ### 1. **Backend**
  - **Framework:** Developed using Flask, a lightweight web framework for Python that facilitates the creation of RESTful APIs.
  - **Blueprints:** The application is organized into blueprints to modularize features, such as:
    - **Authentication Blueprint (`authen_bp`)**: Handles user registration, login, and logout functionalities.
    - **Report Blueprint (`report_bp`)**: Manages the generation and retrieval of monthly financial reports.

  ### 2. **Database**
  - **Database Management System:** Uses SQLAlchemy as the ORM (Object Relational Mapper) to interact with a relational database (e.g. SQLlite) to allow for easy database technology swapping.
  - **Models:** Defines models for core entities, including:
    - **User**: Represents a user in the system with attributes like username and password.
    - **Category**: Represents different spending categories (e.g., income, food, entertainment).
    - **MonthlyReport**: Stores generated reports for users, containing budget split data.

  ### 3. **Authentication and Security**
  - **JWT (JSON Web Tokens):** Utilizes JWT for secure user authentication. Tokens are issued upon successful login and are required for accessing protected routes.
  - **Password Hashing:** User passwords are securely hashed using `bcrypt` to ensure sensitive information is protected.

  ### 4. **API Layer**
  - **RESTful API:** Provides endpoints for frontend interactions, allowing users to perform CRUD operations on their data.
  - **Documentation:** API routes are documented for easy integration and usage by frontend developers.

  ### 6. **Deployment**
  - **Environment:** The application is configured to run in a production environment using Gunicorn as the WSGI server and Nginx as a reverse proxy.
  - **Containerization:** Consider using Docker for containerization to ensure consistency across different environments.

  ### 7. **Testing**
  - **Unit Testing:** The application includes unit tests to validate the functionality of core features using the `unittest` framework.
  - **Integration Testing:** Ensures that different components of the application work together as expected.

  ### 8. **Future Enhancements**
  - **Implementing a frontend** Potential to build a front end using HTML, CSS, JavaScript and technology like Chart.js to visualize data
  - **Additional Features:** Potential for adding features like budgeting tools, data visualization, and integrations with banking APIs.
  - **Performance Optimization:** Plans for implementing caching mechanisms and optimizing database queries to improve performance.

  ## Conclusion
  Moneymap's architecture promotes a clean separation of concerns and scalability, making it easy to extend and maintain as user needs evolve. The modular design also allows for collaborative development, ensuring that multiple developers can work on different components simultaneously without conflicts and allow for easy and seemless expansion on features.

---
