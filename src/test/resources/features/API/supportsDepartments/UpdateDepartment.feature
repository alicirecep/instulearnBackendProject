Feature: As an administrator, I want to update the information of the support department with the specified ID via an API connection.

  Scenario Outline: When a PATCH request containing correct data (title) along with valid authorization credentials and the
  correct ID is sent to the /api/updateDepartment/{id} endpoint, the returned status code is verified to be 200. Furthermore,
  the remark field in the response body is "success", and the Message field is "Successfully Updated." Additionally, it is
  confirmed that the Updated Support Department ID returned from the response body matches the id path parameter specified in the
  /api/updateDepartment/{id} endpoint, and the updated support department record is validated through an API GET request sent to
  the /api/department/{id} endpoint.

    * The api user sends a POST request to the api "addDepartment" endpoint to create a new "department" record and records the "Added Support Department ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateDepartment" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateDepartment endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    * The api user verifies that the "Updated Support Department ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.translations[0].title" is "Technical Service" by sending a GET request to the "api" "department" endpoint with the "Updated Support Department ID" returned in the response body.

    Examples:
      | title             |
      | Technical Service |


  Scenario: When a PATCH request without data is sent to the /api/updateDepartment/{id} endpoint with valid authorization
  credentials and the correct ID, the returned status code is verified to be 203. Additionally, the remark field in the response
  body is "failed", and the message field is "There is no information to update."

    * The api user sends a POST request to the api "addDepartment" endpoint to create a new "department" record and records the "Added Support Department ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateDepartment" path parameters.
    * The api user prepares a PATCH request without containing any data.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "message" information in the response body is "There is no information to update.".


  Scenario Outline: When a PATCH request containing correct data (title) and a non-existing ID is sent to the
  /api/updateDepartment/{id} endpoint with valid authorization credentials, the returned status code is verified to be 203.
  Additionally, the remark field in the response body is "failed", and the message field is
  "There is not support department for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateDepartment/<id>" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateDepartment endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not support department for this id.".

    Examples:
      | id    | title             |
      | 85647 | Technical Service |


  Scenario Outline: When a PATCH request containing correct data (title) but without an ID is sent to the
  /api/updateDepartment/{id} endpoint with valid authorization credentials, the returned status code is verified to be 203.
  Additionally, the remark field in the response body is "failed", and the message field is "No id"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateDepartment" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateDepartment endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".

    Examples:
      | title             |
      | Technical Service |


  Scenario Outline: When a PATCH request containing correct data (title) and a correct ID is sent to the
  /api/updateDepartment/{id} endpoint with invalid (student or teacher) authorization credentials, the returned status code is
  verified to be 203. Additionally, the remark field in the response body is "failed", and the message field is
  "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addDepartment" endpoint to create a new "department" record and records the "Added Support Department ID" information.
    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/updateDepartment" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateDepartment endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | title             |
      | Technical Service |


  Scenario Outline: When a PATCH request containing correct data (title) and a correct ID is sent to the
  /api/updateDepartment/{id} endpoint with invalid (invalid token) authorization credentials, the returned status code is
  verified to be 401. Furthermore, the message field in the response body is confirmed to be "Unauthenticated."

    * The api user sends a POST request to the api "addDepartment" endpoint to create a new "department" record and records the "Added Support Department ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/updateDepartment" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateDepartment endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | title             |
      | Technical Service |


