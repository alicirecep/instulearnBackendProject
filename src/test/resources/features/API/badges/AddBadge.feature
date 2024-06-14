Feature: As an administrator, I want to create a new badge record via an API connection.

  Scenario Outline: Verify that when a POST body with valid authorization credentials and correct data (title, description,
  type, from, to, score) is sent to the /api/addBadge endpoint, the returned status code is 200. Ensure that the remark field
  in the response body is "success" and the Message field is "Successfully Added." Additionally, to verify the newly created
  badge record through the API, use the Added Badge ID returned in the response body to send a GET request to the /api/badge/{id}
  endpoint and confirm that the record has been created.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addBadge" path parameters.
    * The api user prepares a POST request to send to the api addBadge endpoint with the following information "<title>", "<description>", "<type>", <from>, <to> and <score>.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "badge" endpoint with the "Added Badge ID" returned in the response body.

    Examples:
      | title      | description           | type         | from | to | score |
      | Test Badge | Test Badge Descriptio | course_count | 25   | 50 | 50    |


  Scenario Outline: Verify that when a POST body with valid authorization credentials and an invalid type is sent to the
  /api/addBadge endpoint including (title, description, type, from, to, score), the returned status code is 422. Confirm that the
  message field in the response body states "The selected type is invalid."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addBadge" path parameters.
    * The api user prepares a POST request to send to the api addBadge endpoint with the following information "<title>", "<description>", "<type>", <from>, <to> and <score>.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 422.
    * The api user verifies that the "message" information in the response body is "The selected type is invalid.".

    Examples:
      | title      | description           | type | from | to | score |
      | Test Badge | Test Badge Descriptio | xyz  | 25   | 50 | 50    |


  Scenario: Verify that when a POST request without data and with valid authorization credentials is sent to the /api/addBadge
  endpoint, the returned status code is 422. Confirm that the message field in the response body states
  "The title field is required. (and 4 more errors)"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addBadge" path parameters.
    * The api user prepares a POST request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 422.
    * The api user verifies that the "message" information in the response body is "The title field is required. (and 4 more errors)".


  Scenario Outline: Verify that when a POST body with valid data (title, description, type, from, to, score) and invalid
  (student or teacher) authorization credentials is sent to the /api/addBadge endpoint, the returned status code is 203.
  Confirm that the remark field in the response body is "failed" and the message field states
  "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/addBadge" path parameters.
    * The api user prepares a POST request to send to the api addBadge endpoint with the following information "<title>", "<description>", "<type>", <from>, <to> and <score>.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | title      | description           | type         | from | to | score |
      | Test Badge | Test Badge Descriptio | course_count | 25   | 50 | 50    |


  Scenario Outline: Verify that when a POST request with invalid (invalid token) authorization credentials and correct data
  (title, description, type, from, to, score) is sent to the /api/addBadge endpoint, the returned status code is 401.
  Confirm that the message field in the response body states "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/addBadge" path parameters.
    * The api user prepares a POST request to send to the api addBadge endpoint with the following information "<title>", "<description>", "<type>", <from>, <to> and <score>.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | title      | description           | type         | from | to | score |
      | Test Badge | Test Badge Descriptio | course_count | 25   | 50 | 50    |

