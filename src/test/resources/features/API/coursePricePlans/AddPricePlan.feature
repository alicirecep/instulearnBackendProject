Feature: As an administrator, I want to create a new course price plan record via an API connection.

  Scenario Outline: When a valid POST request with proper authorization and correct data (title, dateRange, discount, capacity,
  webinar_id) is sent to the "/api/addPricePlan" endpoint, it should be verified that the status code is 200, and the response
  body contains the messages "success" and "Successfully Added." To confirm the creation of the record, a GET request should
  be sent to the /api/pricePlan/{id} endpoint using the returned Added Price Plans ID.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addPricePlan" path parameters.
    * The api user prepares a POST request to send to the api addPricePlan endpoint, containing the information "<title>", "<dateRange>", <discount>, <capacity> and <webinar_id>.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "pricePlan" endpoint with the "Added Price Plans ID" returned in the response body.

    Examples:
      | title            | dateRange               | discount | capacity | webinar_id |
      | Test Price Plans | 2024-06-01 - 2024-06-30 | 20       | 50       | 2002       |


  Scenario: When a POST request with valid authorization credentials but no data is sent to the /api/addPricePlan endpoint, it
  should be verified that the status code is 422 and the message in the response body is
  "The title field is required. (and 3 more errors)"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addPricePlan" path parameters.
    * The api user prepares a POST request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 422.
    * The api user verifies that the "message" information in the response body is "The title field is required. (and 3 more errors)".


  Scenario Outline: When a POST request with invalid (student or teacher) authorization credentials but with the correct data
  (title, dateRange, discount, capacity, webinar_id) is sent to the /api/addPricePlan endpoint, it should be verified that the
  status code is 203, the remark information in the response body is "failed", and the message information is
  "To access this data, you must log in as admin."

    * The api user constructs the base url with the "student" token.
    * The api user sets "api/addPricePlan" path parameters.
    * The api user prepares a POST request to send to the api addPricePlan endpoint, containing the information "<title>", "<dateRange>", <discount>, <capacity> and <webinar_id>.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as admin.".

    Examples:
      | title            | dateRange               | discount | capacity | webinar_id |
      | Test Price Plans | 2024-06-01 - 2024-06-30 | 20       | 50       | 2002       |


  Scenario Outline: When a POST request with invalid (invalid token) authorization credentials but with the correct data
  (title, dateRange, discount, capacity, webinar_id) is sent to the /api/addPricePlan endpoint, it should be verified
  that the status code returned is 401 and the message in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/addPricePlan" path parameters.
    * The api user prepares a POST request to send to the api addPricePlan endpoint, containing the information "<title>", "<dateRange>", <discount>, <capacity> and <webinar_id>.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | title            | dateRange               | discount | capacity | webinar_id |
      | Test Price Plans | 2024-06-01 - 2024-06-30 | 20       | 50       | 2002       |

