Feature: As an administrator, I want to create a new product FAQ record via an API connection.

  Scenario Outline: When a POST request is sent with valid credentials and correct data, it verifies that the returned status code is
  200, the remark field in the response body is "success" and the Message field is "Successfully Added." Additionally, to verify the
  created product FAQ record, a GET request is sent to the /api/productfaq/{id} endpoint for confirmation."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addProductfaq" path parameters.
    * The api user prepares a POST request to send to the api addProductfaq endpoint with the information "<title>", "<answer>" and <product_id>
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "productfaq" endpoint with the "Added Product Faq ID" returned in the response body.

    Examples:
      | title                                                    | answer                                                   | product_id |
      | What payment methods do you accept for online purchases? | What payment methods do you accept for online purchases? | 10         |


  Scenario: When a POST request is sent to the /api/addProductfaq endpoint with valid credentials but no data, verify that the
  status code returned is 422 and the message in the response body is "The product id field is required. (and 2 more errors)"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addProductfaq" path parameters.
    * The api user prepares a POST request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 422.
    * The api user verifies that the "message" information in the response body is "The product id field is required. (and 2 more errors)".


  Scenario Outline: When a POST request with valid data (title, answer, product_id) is sent to the endpoint with invalid
  (student or teacher) authentication credentials, verify that the status code returned is 203, and the remark in the response
  body is "failed", and the message is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    * The api user sets "api/addProductfaq" path parameters.
    * The api user prepares a POST request to send to the api addProductfaq endpoint with the information "<title>", "<answer>" and <product_id>
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | title                                                    | answer                                                   | product_id |
      | What payment methods do you accept for online purchases? | What payment methods do you accept for online purchases? | 10         |


  Scenario Outline: When a POST request with valid data (title, answer, product_id) is sent to the endpoint with invalid
  (invalid token) authentication credentials, verify that the status code returned is 401, and the message in the response body
  is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/addProductfaq" path parameters.
    * The api user prepares a POST request to send to the api addProductfaq endpoint with the information "<title>", "<answer>" and <product_id>
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | title                                                    | answer                                                   | product_id |
      | What payment methods do you accept for online purchases? | What payment methods do you accept for online purchases? | 10         |


