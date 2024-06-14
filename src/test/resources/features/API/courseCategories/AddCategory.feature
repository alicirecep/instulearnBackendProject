Feature: As an administrator, I want to create a new course category record via an API connection.

  Scenario Outline: When a valid POST request with proper authorization and correct data (title) is sent to the /api/addCategory
  endpoint, it should be verified that the status code is 200, and the response body contains the messages "success" and
  "Successfully Added." To confirm the creation of the record, a GET request should be sent to the /api/category/{id} endpoint
  using the returned Added Category ID.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addCategory" path parameters.
    * The api user prepares a POST request to send to the API addCategory endpoint containing the "<title>" information.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "category" endpoint with the "Added Category ID" returned in the response body.

    Examples:
      | title            |
      | Online Education |


  Scenario: When a POST request with valid authorization credentials but no data in the body is sent to the /api/addCategory
  endpoint, it should be verified that the status code returned is 422 and the message field in the response body is
  "The title field is required."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addCategory" path parameters.
    * The api user prepares a POST request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 422.
    * The api user verifies that the "message" information in the response body is "The title field is required.".


  Scenario Outline: When a POST request with invalid (student or teacher) authorization credentials and correct data (title)
  is sent to the /api/addCategory endpoint, it should be verified that the status code returned is 203 and the remark field in
  the response body is "failed" and the message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    * The api user sets "api/addCategory" path parameters.
    * The api user prepares a POST request to send to the API addCategory endpoint containing the "<title>" information.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | title            |
      | Online Education |


  Scenario Outline: When a POST request with invalid (invalid token) authorization credentials and correct data (title) is sent
  to the /api/addCategory endpoint, it should be verified that the status code returned is 401 and the message field in the
  response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/addCategory" path parameters.
    * The api user prepares a POST request to send to the API addCategory endpoint containing the "<title>" information.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | title            |
      | Online Education |


