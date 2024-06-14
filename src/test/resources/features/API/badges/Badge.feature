Feature: As an administrator, I want to access detailed information about the badge with the specified ID via an API connection.

  Scenario Outline: When a GET request with valid authorization credentials and correct data (id) is sent to the /api/badge/{id}
  endpoint, verify that the returned status code is 200 and the remark field in the response body is "success". Additionally,
  when a GET request with valid authorization credentials and correct data (id) is sent to the /api/badge/{id` endpoint,
  verify the data in the response body, including  id, image, type, from, to, score, created_at, id, badge_id, locale, title, description.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/badge/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The API user verifies the contents of <data_id>, "<image>", "<type>", "<from>", "<to>", <score>, <created_at>, <translations_id>, <badge_id>, "<locale>", "<title>" and "<description>" in the response body data.

    Examples:
      | id | data_id | image                                            | type         | from | to | score | created_at | translations_id | badge_id | locale | title         | description |
      | 24 | 24      | /store/1/default_images/badges/junior_vendor.png | course_count | 1    | 1  | 10    | 1625554772 | 4               | 24       | en     | Junior Vendor | Has 1 Class |


  Scenario Outline: When a GET request with valid authorization credentials and a non-existent {id} is sent to the /api/badge/{id}
  endpoint, verify that the returned status code is 203. Ensure that the remark field in the response body is "failed" and the
  message field is "There is not badge for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/badge/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not badge for this id.".

    Examples:
      | id    |
      | 32515 |


  Scenario: When a GET request without an {id} and with valid authorization credentials is sent to the /api/badge/{id} endpoint,
  verify that the returned status code is 203. Ensure that the remark field in the response body is "failed" and the message
  field is "No id"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/badge" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".


  Scenario Outline: Verify that when a GET request with invalid (student or teacher) authorization credentials and correct data
  (id) is sent to the /api/badge/{id} endpoint, the returned status code is 203. Confirm that the remark field in the response
  body is "failed" and the message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    * The api user sets "api/badge/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | id |
      | 24 |


  Scenario Outline: When a GET request with invalid (invalid token) authorization credentials and correct data (id) is sent to the
  /api/badge/{id} endpoint, verify that the returned status code is 401, and ensure that the message field in the response
  body states "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/badge/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id |
      | 24 |


