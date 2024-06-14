Feature: As an administrator, I want to update the information of the support resource with the specified ID via an API connection.

  Scenario Outline: When a PATCH request is sent to the /api/updateSupport/{id} endpoint with valid authorization information
  and correct data, it is verified that the status code returned is 200, the remark field in the response body is "success" and
  the Message field is "Updated Successfully", and the Updated Support ID returned is the same as the id path parameter
  specified in the /api/updateSupport/{id} endpoint. Also, to verify the updated record, a GET request is sent to the
  /api/support/{id} endpoint with the returned Updated Support ID to verify that the record has been updated.

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateSupport" path parameters.
    * The api user prepares a patch request with "<title>", <department_id> and "<message>" to send to the api updateSupport endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Updated Succesfully".
    * The api user verifies that the "Updated Support ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.title" is "Cancelled order not been refunded." by sending a GET request to the "api" "support" endpoint with the "Updated Support ID" returned in the response body.

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


  Scenario:  When a PATCH request is sent to the /api/updateSupport/{id} endpoint with valid authorization information, it
  should be verified that the status code returned is 203, the remark in the response body is "failed" and the message is
  "There is no information to update."

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateSupport" path parameters.
    * The api user prepares a PATCH request without containing any data.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "message" information in the response body is "There is no information to update.".


  Scenario Outline: When a PATCH body is sent to /api/updateSupport/{id} endpoint containing an unregistered (id) and correct data
  (title, department_id, message) with valid authorization information, it should be verified that the status code returned is 203,
  the remark in the response body is "failed" and the message is "There is not support message for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateSupport/<id>" path parameters.
    * The api user prepares a patch request with "<title>", <department_id> and "<message>" to send to the api updateSupport endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not support message for this id.".

    Examples:
      | id       | title                              | department_id | message                                                    |
      | 88954121 | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


  Scenario Outline: When a PATCH body is sent to /api/updateSupport/{id} endpoint with valid authorization information (id) and
  correct data (title, department_id, message), it should be verified that the status code returned is 203, the remark in the
  response body is "failed" and the message is "No id".

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateSupport" path parameters.
    * The api user prepares a patch request with "<title>", <department_id> and "<message>" to send to the api updateSupport endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


  Scenario Outline: When a PATCH body is sent to /api/updateSupport/{id} endpoint with invalid (student or teacher) authorization
  information and correct (id) and correct data (title, department_id, message), it should be verified that the status code
  returned is 203, the remark in the response body is "failed" and the message is
  "To access this data, you must log in as a  admin."

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    * The api user constructs the base url with the "student" token.
    * The api user sets "api/updateSupport" path parameters.
    * The api user prepares a patch request with "<title>", <department_id> and "<message>" to send to the api updateSupport endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a  admin.".

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


  Scenario Outline: When a PATCH body is sent to /api/updateSupport/{id} endpoint with invalid token authorization information
  and correct (id) and correct data (title, department_id, message), it should be verified that the status code returned is 401
  and the message information in the response body is "Unauthenticated."

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/updateSupport" path parameters.
    * The api user prepares a patch request with "<title>", <department_id> and "<message>" to send to the api updateSupport endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


