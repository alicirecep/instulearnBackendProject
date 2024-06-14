Feature: As an administrator, I want to delete the blog category information with the specified ID via an API connection.

  Scenario: When a DELETE request with valid authorization and correct (id) is sent to the /api/deleteBlogCategory/{id} endpoint,
  the returned status code should be 200. The remark field in the response body should be verified as "success", and the Message
  field should be "Successfully Deleted." Additionally, it should be confirmed that the Deleted Blog Category Id in the response
  body matches the id path parameter specified in the /api/deleteBlogCategory/{id} endpoint. Finally, the deletion of the desired
  blog category record should be verified through the API.

    * The api user sends a POST request to the api "addBlogCategory" endpoint to create a new "blogCategory" record and records the "Added Blog Category ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteBlogCategory" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    * The api user verifies that the "Deleted Blog Category Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.message" is "There is not category for this id." by sending a GET request to the "api" "blogCategory" endpoint with the "Deleted Blog Category Id" returned in the response body.


  Scenario Outline: When a DELETE request with valid authorization credentials and a non-existent (id) is sent to the
  /api/deleteBlogCategory/{id} endpoint, the returned status code should be 203. The remark field in the response body should be
  verified as "failed", and the message field should be "There is not category for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteBlogCategory/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not category for this id.".

    Examples:
      | id     |
      | 521478 |


  Scenario: When a DELETE request without an (id) is sent with valid authorization credentials to the /api/deleteBlogCategory/{id}
  endpoint, the returned status code should be 203. The remark field in the response body should be verified as "failed", and the
  message field should be "No id"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteBlogCategory" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".


  Scenario: When a DELETE request with invalid (student or teacher) authorization credentials but correct (id) is sent to the
  /api/deleteBlogCategory/{id} endpoint, the returned status code should be 203. The remark field in the response body should be
  verified as "failed", and the message field should be "To access this data, you must log in as admin."

    * The api user sends a POST request to the api "addBlogCategory" endpoint to create a new "blogCategory" record and records the "Added Blog Category ID" information.
    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/deleteBlogCategory" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as admin.".


  Scenario: When a DELETE request with invalid (invalid token) authorization credentials but correct (id) is sent to the
  /api/deleteBlogCategory/{id} endpoint, the returned status code should be 401. The message field in the response body
  should be verified as "Unauthenticated."

    * The api user sends a POST request to the api "addBlogCategory" endpoint to create a new "blogCategory" record and records the "Added Blog Category ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/deleteBlogCategory" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

