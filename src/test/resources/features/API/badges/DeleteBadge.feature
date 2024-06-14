Feature: As an administrator, I want to delete the badge information with the specified ID via an API connection.

  Scenario: When a DELETE request with valid authorization information and correct (id) is sent to the /api/deleteBadge/{id}
  endpoint, it should be verified that the status code returned is 200, the remark in the response body is "success" and the
  Message is "Successfully Deleted.". Also, it should be verified via API that the Deleted Badge ID in the response body is
  the same as the id path parameter in the /api/deleteBadge/{id} endpoint and that the badge record was deleted.

    * The api user sends a POST request to the api "addBadge" endpoint to create a new "badge" record and records the "Added Badge ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteBadge" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    * The api user verifies that the "Deleted Badge ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.message" is "There is not badge for this id." by sending a GET request to the "api" "badge" endpoint with the "Deleted Badge ID" returned in the response body.


  Scenario Outline: When a DELETE request with valid authorization information and an unregistered (id) is sent to the
  /api/deleteBadge/{id} endpoint, it should be verified that the status code returned is 203, the remark in the response body
  is "failed" and the message is "There is not badge for this id.".

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteBadge/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not badge for this id.".

    Examples:
      | id   |
      | 2415 |


  Scenario: When a DELETE request is sent to the /api/deleteBadge/{id} endpoint without valid authorization information and (id),
  it should be verified that the status code returned is 203, the remark in the response body is "failed" and the message is "No id".

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteBadge" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".


  Scenario: When a DELETE request with invalid (student or teacher) authorization information and correct (id) is sent to the
  /api/deleteBadge/{id} endpoint, it should be verified that the status code returned is 203, the remark in the response body is
  "failed" and the message is "To access this data, you must log in as a admin.".

    * The api user sends a POST request to the api "addBadge" endpoint to create a new "badge" record and records the "Added Badge ID" information.
    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/deleteBadge" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


  Scenario: When a DELETE request is sent to the /api/deleteBadge/{id} endpoint with invalid token authorization information
  and true (id), it should be verified that the status code returned is 401 and the message in the response body is "Unauthenticated.".

    * The api user sends a POST request to the api "addBadge" endpoint to create a new "badge" record and records the "Added Badge ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/deleteBadge" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

