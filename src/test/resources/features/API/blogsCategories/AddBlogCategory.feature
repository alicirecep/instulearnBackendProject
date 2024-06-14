Feature: As an administrator, I want to create a new blog category record via an API connection.

  Scenario Outline: When a POST request is sent to the /api/addBlogCategory endpoint with correct authorization and data, the
  returned status code should be 200. The remark field in the response body should be "success", and the Message field should be
  "Successfully Added." The addition of a new blog category record can be verified by making a GET request to the
  /api/blogCategory/{id} endpoint.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addBlogCategory" path parameters.
    * The api user prepares a POST request containing the "<title>" information to send to the api addBlogCategory endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "blogCategory" endpoint with the "Added Blog Category ID" returned in the response body.

    Examples:
      | title           |
      | OnlineEducation |


  Scenario: When a POST request is sent to the /api/addBlogCategory endpoint with valid authorization credentials but no data,
  the returned status code should be 422, and the message field in the response body should be verified as
  "The title field is required."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addBlogCategory" path parameters.
    * The api user prepares a POST request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 422.
    * The api user verifies that the "message" information in the response body is "The title field is required.".


  Scenario Outline: When a POST request is sent to the /api/addBlogCategory endpoint with invalid (student or teacher)
  authorization credentials but correct data (title), the returned status code should be 203. The remark field in the response
  body should be verified as "failed", and the message field should be "To access this data, you must log in as admin."

    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/addBlogCategory" path parameters.
    * The api user prepares a POST request containing the "<title>" information to send to the api addBlogCategory endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as admin.".

    Examples:
      | title           |
      | OnlineEducation |


  Scenario Outline: When a POST request is sent to the /api/addBlogCategory endpoint with invalid (invalid token) authorization
  credentials but correct data (title), the returned status code should be 401. The message field in the response body should be
  verified as "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/addBlogCategory" path parameters.
    * The api user prepares a POST request containing the "<title>" information to send to the api addBlogCategory endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | title           |
      | OnlineEducation |



