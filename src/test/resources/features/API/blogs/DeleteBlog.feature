Feature: As an administrator or teacher, I want to delete the blog information with the specified ID via an API connection.

  Scenario: Verify that a DELETE request to the /api/deleteBlog/{id} endpoint with valid authorization credentials and a correct (id)
  returns a status code of 200. The response body should have the remark field as "success" and the Message field as
  "Successfully Deleted." Additionally, the Deleted Blog Id in the response body should match the id specified in the request,
  confirming that the blog record intended for deletion has been successfully removed. To confirm the deletion of the blog record,
  a GET request can be made to the /api/blog/{id} endpoint with the Deleted Blog Id specified in the response.

    * The api user sends a POST request to the api "addBlog" endpoint to create a new "blog" record and records the "Added Blog ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteBlog" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    * The api user verifies that the "Deleted Blog Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.message" is "There is not blog for this id." by sending a GET request to the "api" "blog" endpoint with the "Deleted Blog Id" returned in the response body.


  Scenario Outline: When a DELETE request is made to the /api/deleteBlog/{id} endpoint with valid authorization credentials but a
  non-existent (id), the returned status code should be 203. The response body should contain remark as "failed" and message as
  "There is not blog for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteBlog/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not blog for this id.".

    Examples:
      | id   |
      | 5568 |


  Scenario: When a DELETE request is sent to the /api/deleteBlog/{id} endpoint with valid authorization credentials but without an
  (id), the returned status code should be 203. The response body should contain remark as "failed" and message as "No id"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteBlog" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".


  Scenario: When a DELETE request is sent to the /api/deleteBlog/{id} endpoint with invalid (student) authorization credentials
  but a correct (id), the returned status code should be 203. The response body should contain remark as "failed" and message
  as "To access this data, you must log in as a teacher or admin."

    * The api user sends a POST request to the api "addBlog" endpoint to create a new "blog" record and records the "Added Blog ID" information.
    * The api user constructs the base url with the "student" token.
    * The api user sets "api/deleteBlog" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a teacher or admin.".


  Scenario: When a DELETE request is sent to the /api/deleteBlog/{id} endpoint with invalid (invalid token) authorization
  credentials but a correct (id), the returned status code should be 401. The response body should contain message as
  "Unauthenticated."

    * The api user sends a POST request to the api "addBlog" endpoint to create a new "blog" record and records the "Added Blog ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/deleteBlog" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.



