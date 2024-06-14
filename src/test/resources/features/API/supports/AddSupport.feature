Feature: As an administrator, I want to create a new support record via an API connection.

  Scenario Outline: When a POST request is sent with valid authorization information and correct data (title, department_id,
  message), the status code returned is 200, the remark field in the response body is "success" and the Message field is "
  Successfully Added." and a GET request is sent to the /api/support/{id} endpoint with the returned Added Support ID
  to verify the support record created.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addSupport" path parameters.
    * The api user prepares a post request with "<title>", <department_id> and "<message>" to send to the api addSupport endpoint
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "support" endpoint with the "Added Support ID" returned in the response body.

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


  Scenario: When a POST request is sent to /api/addSupport endpoint with valid authorization information and data, it should be
  verified that the status code returned is 422 and the message information in the response body is
  "The title field is required. (and 2 more errors)"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addSupport" path parameters.
    * The api user prepares a POST request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 422.
    * The api user verifies that the "message" information in the response body is "The title field is required. (and 2 more errors)".


  Scenario Outline: When a POST body containing correct data (title, department_id, message) with invalid (student or teacher)
  authorization information is sent to /api/addSupport endpoint, it should be verified that the status code returned is 203,
  the remark in the response body is "failed" and the message is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/addSupport" path parameters.
    * The api user prepares a post request with "<title>", <department_id> and "<message>" to send to the api addSupport endpoint
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


  Scenario Outline: When sending a POST body with invalid authorization information (invalid token) and correct data (title,
  department_id, message) to /api/addSupport endpoint, it should be verified that the status code returned is 401 and the
  message information in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/addSupport" path parameters.
    * The api user prepares a post request with "<title>", <department_id> and "<message>" to send to the api addSupport endpoint
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


