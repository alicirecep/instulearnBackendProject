Feature: As an administrator, I want to delete the course FAQ information with the specified ID via an API connection.

  Scenario: When a DELETE request with valid authorization and correct (id) is sent to the /api/deleteCoursefaq/{id}
  endpoint, the expected result should be a status code of 200, with the remark "success" and the Message "Successfully Deleted."
  The returned Deleted Course Faq ID should match the id parameter specified in the endpoint. This confirms that the course
  FAQ record intended to be deleted has been successfully deleted via the API. (The deletion of the record can be verified by
  sending a GET request to the /api/coursefaq/{id} endpoint using the Deleted Course Faq ID returned in the response body.)

    * The api user sends a POST request to the api "addCoursefaq" endpoint to create a new "coursefaq" record and records the "Added Course Faq ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteCoursefaq" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    * The api user verifies that the "Deleted Course Faq ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.message" is "There is not course faq for this id." by sending a GET request to the "api" "coursefaq" endpoint with the "Deleted Course Faq ID" returned in the response body.


  Scenario Outline: When a DELETE request with valid authorization and a non-existing (id) is sent to the /api/deleteCoursefaq/{id}
  endpoint, the returned status code should be 203, the remark in the response body should be "failed," and the message should be
  "There is not course faq for this id." This should be verified.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteCoursefaq/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not course faq for this id.".

    Examples:
      | id   |
      | 2145 |


  Scenario: When a DELETE request without an (id) is sent to the /api/deleteCoursefaq/{id} endpoint with valid authorization
  credentials, the returned status code should be 203, the remark in the response body should be "failed," and the message should
  be "No id" This should be verified.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteCoursefaq" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".


  Scenario: When a DELETE request with invalid (student or teacher) authorization credentials and correct (id) is sent to the
  /api/deleteCoursefaq/{id} endpoint, the returned status code should be 203, the remark in the response body should be "failed,"
  and the message should be "To access this data, you must log in as a admin." This should be verified.

    * The api user sends a POST request to the api "addCoursefaq" endpoint to create a new "coursefaq" record and records the "Added Course Faq ID" information.
    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/deleteCoursefaq" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


  Scenario: When a DELETE request with invalid token authorization credentials and correct (id) is sent to the
  /api/deleteCoursefaq/{id} endpoint, the returned status code should be 401, and the message in the response body should be
  "Unauthenticated." This should be verified.

    * The api user sends a POST request to the api "addCoursefaq" endpoint to create a new "coursefaq" record and records the "Added Course Faq ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/deleteCoursefaq" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


