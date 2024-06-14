Feature: As an administrator, I want to update the information of the course category with the specified ID via an API connection.

  Scenario Outline: When a PATCH request with valid authorization and correct data is sent to the /api/updateCategory/{id} endpoint,
  it should be verified that the status code is 200 and the response body contains the messages "success" and
  "Successfully Updated." Additionally, it should be checked that the returned Updated Category ID matches the id path parameter
  specified in the /api/updateCategory/{id} endpoint. This confirms that the course category record intended to be updated
  has been successfully updated via the API.

    * The api user sends a POST request to the api "addCategory" endpoint to create a new "category" record and records the "Added Category ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateCategory" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    * The api user verifies that the "Updated Category Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.translations[0].title" is "Education and Training" by sending a GET request to the "api" "category" endpoint with the "Updated Category Id" returned in the response body.

    Examples:
      | title                  |
      | Education and Training |


  Scenario: When a PATCH request with valid authorization credentials, the correct (id), and no data is sent to the
  /api/updateCategory/{id} endpoint, it should be verified that the returned status code is 203, the remark information in the
  response body is "failed", and the message information is "There is no information to update."

    * The api user sends a POST request to the api "addCategory" endpoint to create a new "category" record and records the "Added Category ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateCategory" path parameters.
    * The api user prepares a PATCH request without containing any data.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "message" information in the response body is "There is no information to update.".


  Scenario Outline: When a PATCH request with valid authorization credentials and correct data (title) but a non-existent
  id is sent to the /api/updateCategory/{id} endpoint, it should be verified that the status code returned is 203 and the
  remark field in the response body is "failed" and the message field is "There is not category for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateCategory/<id>" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not category for this id.".

    Examples:
      | id    | title                  |
      | 25416 | Education and Training |


  Scenario Outline: When a PATCH request with valid authorization credentials but no id and correct data (title) is sent to the
  /api/updateCategory/{id} endpoint, it should be verified that the status code returned is 203 and the remark field in the
  response body is "failed" and the message field is "No id"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateCategory" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".

    Examples:
      | title                  |
      | Education and Training |


  Scenario Outline: When a PATCH request with invalid authorization credentials and correct id and data (title) is sent to the
  /api/updateCategory/{id} endpoint, it should be verified that the status code returned is 203 and the remark field in the
  response body is "failed" and the message field is "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addCategory" endpoint to create a new "category" record and records the "Added Category ID" information.
    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/updateCategory" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | title                  |
      | Education and Training |


  Scenario Outline: When a PATCH request with invalid authorization credentials (invalid token) and correct id and data (title)
  is sent to the /api/updateCategory/{id} endpoint, it should be verified that the status code returned is 401 and the message
  field in the response body is "Unauthenticated."

    * The api user sends a POST request to the api "addCategory" endpoint to create a new "category" record and records the "Added Category ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/updateCategory" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | title                  |
      | Education and Training |

