Feature: As an administrator, I want to delete the support information with the specified ID via an API connection.

  Scenario: When a DELETE request is sent to the “/api/deleteSupport/{id}” endpoint with valid authorization information
  and the correct (id), the status code returned is 200, the remark field in the response body is "success" and the Message field
  is "Successfully Deleted.", and the returned Deleted Support Id is the same as the id path parameter specified in the
  /api/deleteSupport/{id} endpoint, the successful deletion of the record is verified by sending a GET request to the
  /api/support/{id} endpoint.

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteSupport" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    * The api user verifies that the "Deleted Support Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.message" is "There is not support message for this id." by sending a GET request to the "api" "support" endpoint with the "Deleted Support Id" returned in the response body.


  Scenario Outline: When a DELETE request is sent to the /api/deleteSupport/{id} endpoint with valid authorization information and
  an unregistered (id), it should be verified that the status code returned is 203, the remark in the response body is "failed"
  and the message is "There is not support message for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteSupport/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not support message for this id.".

    Examples:
      | id     |
      | 825147 |


  Scenario: When a DELETE request is sent to the /api/deleteSupport/{id} endpoint with valid authorization information and (id),
  it should be verified that the status code returned is 203, the remark in the response body is "failed" and the message is "No id".

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteSupport" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".


  Scenario: When a DELETE request is sent to the /api/deleteSupport/{id} endpoint with invalid (student or teacher)
  authorization information and correct (id), it should be verified that the status code returned is 203, the remark in the
  response body is "failed" and the message is "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    * The api user constructs the base url with the "student" token.
    * The api user sets "api/deleteSupport" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


  Scenario: When a DELETE request is sent to the /api/deleteSupport/{id} endpoint with invalid token authorization information
  and an id, it should be verified that the status code returned is 401 and the message in the response body is "Unauthenticated."

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/deleteSupport" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


