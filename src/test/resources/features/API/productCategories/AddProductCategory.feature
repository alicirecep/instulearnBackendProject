Feature: As an administrator, I want to create a new product category record via an API connection.

  Scenario Outline: When a valid authorization and correct data (title) are sent in the POST body to the /Api/addProductCategory
  endpoint, the expected outcomes are: a status code of 200, a "success" remark in the response body, and a "Successfully Added."
  message in the Message field. It should be confirmed by sending a GET request to the /api/productCategory/{id} endpoint with
  the Added Category ID returned in the response, verifying that the record is created.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addProductCategory" path parameters.
    * The api user prepares a POST request containing the "<title>" information to send to the api addProductCategory endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "productCategory" endpoint with the "Added Category ID" returned in the response body.

    Examples:
      | title                 |
      | Educational Equipment |


  Scenario: When a POST request with valid authentication credentials but no data is sent to the /api/addProductCategory endpoint,
  verify that the status code returned is 422, and the message in the response body is "The title field is required."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addProductCategory" path parameters.
    * The api user prepares a POST request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 422.
    * The api user verifies that the "message" information in the response body is "The title field is required.".


  Scenario Outline: When a POST request with invalid (student or teacher) authentication credentials but correct data (title)
  is sent to the /api/addProductCategory endpoint, verify that the returned status code is 203, the remark in the response body
  is "failed", and the message is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    * The api user sets "api/addProductCategory" path parameters.
    * The api user prepares a POST request containing the "<title>" information to send to the api addProductCategory endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


    Examples:
      | title                 |
      | Educational Equipment |


  Scenario Outline: When a POST request with invalid (invalid token) authentication credentials but correct data (title) is sent
  to the /api/addProductCategory endpoint, verify that the returned status code is 401, and the message in the response body is
  "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/addProductCategory" path parameters.
    * The api user prepares a POST request containing the "<title>" information to send to the api addProductCategory endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | title                 |
      | Educational Equipment |




