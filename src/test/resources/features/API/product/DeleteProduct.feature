Feature: As an administrator, I want to delete the product information with the specified ID via an API connection.

  Scenario: When a valid DELETE request with proper authorization and a valid (id) is sent to the /api/deleteProduct/{id}
  endpoint, the expected results are obtained: a status code of 200, a "success" remark in the response body, and a message stating
  "Successfully Deleted." Additionally, within the response body of the same request, the id of the deleted product should match the
  id parameter specified in the endpoint. This way, it verifies that the product record intended to be deleted has indeed been
  removed via the API.

    * The api user sends a POST request to the api "addProduct" endpoint to create a new "product" record and records the "Added Product ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteProduct" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    * The api user verifies that the "Deleted Product Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.message" is "There is not product for this id." by sending a GET request to the "api" "product" endpoint with the "Deleted Product Id" returned in the response body.


  Scenario Outline: When a valid DELETE request with authorization credentials and a non-existing (id) is sent to the
  /api/deleteProduct/{id} endpoint, the status code returned should be 203, the remark field in the response body should be "failed",
  and the message field should be "There is not product for this id." This should be verified.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteProduct/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not product for this id.".

    Examples:
      | id   |
      | 5241 |


  Scenario: When a DELETE request without an (id) but with valid authorization credentials is sent to the /api/deleteProduct/{id}
  endpoint, the status code returned should be 203, the remark field in the response body should be "failed", and the message field
  should be "No id". This should be verified.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteProduct" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".


  Scenario: When a DELETE request with invalid (student or teacher) authorization credentials but with correct (id)
  is sent to the /api/deleteProduct/{id} endpoint, the returned status code should be 203, the remark field in the response
  body should be "failed", and the message field should be "To access this data, you must log in as a admin."
  This should be verified.

    * The api user sends a POST request to the api "addProduct" endpoint to create a new "product" record and records the "Added Product ID" information.
    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/deleteProduct" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".



  Scenario: When a DELETE request with invalid (invalid token) authorization credentials but with correct (id) is sent to the
  /api/deleteProduct/{id} endpoint, the returned status code should be 401, and the message field in the response body should be
  "Unauthenticated." This should be verified.

    * The api user sends a POST request to the api "addProduct" endpoint to create a new "product" record and records the "Added Product ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/deleteProduct" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


