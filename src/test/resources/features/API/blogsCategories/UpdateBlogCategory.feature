Feature: As an administrator, I want to update the information of the blog category with the specified ID via an API connection.

  Scenario Outline: When a PATCH request with valid authorization and correct data (title) is sent to the /api/updateBlogCategory/{id}
  endpoint with the correct (id), the returned status code should be 200. The remark field in the response body should be verified as
  "success", and the Message field should be "Successfully Updated." It should be confirmed that the Updated Blog Category ID in the
  response body matches the id path parameter specified in the /api/updateBlogCategory/{id} endpoint. Additionally, the update of
  the record can be verified by sending a GET request to the /api/blogCategory/{id} endpoint with the Updated Blog Category ID.

    * The api user sends a POST request to the api "addBlogCategory" endpoint to create a new "blogCategory" record and records the "Added Blog Category ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateBlogCategory" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateBlogCategory endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    * The api user verifies that the "Updated Blog Category ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.title" is "Education and Training" by sending a GET request to the "api" "blogCategory" endpoint with the "Updated Blog Category ID" returned in the response body.

    Examples:
      | title                  |
      | Education and Training |


  Scenario: When a PATCH request with valid authorization credentials and a correct (id) but no data is sent to the
  /api/updateBlogCategory/{id} endpoint, the returned status code should be 203. The remark field in the response body should
  be verified as "failed", and the message field should be "There is no information to update."

    * The api user sends a POST request to the api "addBlogCategory" endpoint to create a new "blogCategory" record and records the "Added Blog Category ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateBlogCategory" path parameters.
    * The api user prepares a PATCH request without containing any data.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "message" information in the response body is "There is no information to update.".


  Scenario Outline: When a PATCH request with valid authorization credentials, a non-existent (id), and correct data (title) is sent
  to the /api/updateBlogCategory/{id} endpoint, the returned status code should be 203. The remark field in the response body should
  be verified as "failed", and the message field should be "There is not category for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateBlogCategory/<id>" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateBlogCategory endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not category for this id.".

    Examples:
      | id    | title                  |
      | 32145 | Education and Training |


  Scenario Outline: When a PATCH request is sent to the /api/updateBlogCategory/{id} endpoint with valid authorization credentials
  but without the (id) parameter and with correct data (title), the returned status code should be 203. The remark field in the
  response body should be verified as "failed", and the message field should be "No id"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateBlogCategory" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateBlogCategory endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".

    Examples:
      | title                  |
      | Education and Training |


  Scenario Outline: When a PATCH request with invalid (student or teacher) authorization credentials, correct (id) parameter,
  and correct data (title) is sent to the /api/updateBlogCategory/{id} endpoint, the returned status code should be 203. The remark
  field in the response body should be verified as "failed", and the message field should be
  "To access this data, you must log in as admin."

    * The api user sends a POST request to the api "addBlogCategory" endpoint to create a new "blogCategory" record and records the "Added Blog Category ID" information.
    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/updateBlogCategory" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateBlogCategory endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as admin.".

    Examples:
      | title                  |
      | Education and Training |


  Scenario Outline: When a PATCH request is sent to the /api/updateBlogCategory/{id} endpoint with invalid (invalid token)
  authorization credentials, correct (id) parameter, and correct data (title), the returned status code should be 401.
  The message field in the response body should be verified as "Unauthenticated."

    * The api user sends a POST request to the api "addBlogCategory" endpoint to create a new "blogCategory" record and records the "Added Blog Category ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/updateBlogCategory" path parameters.
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateBlogCategory endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | title                  |
      | Education and Training |


