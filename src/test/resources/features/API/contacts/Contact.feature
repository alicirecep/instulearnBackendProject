Feature: As an administrator, I want to access detailed information about the contact with the specified ID via an API connection.

  Scenario Outline: Verify that when a GET request containing valid authorization credentials and correct data (id) is sent to the
  /api/contact/{id} endpoint, the status code is 200 and the remark field in the response body is "success". Additionally,
  confirm the accuracy of the data in the response body (id, name, email, phone, subject, message, reply, status, created_at).

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/contact/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies the content of <data_id>, "<name>", "<email>", "<phone>", "<subject>", "<message>", "<status>", and <created_at> in the response body.

    Examples:
      | id | data_id | name       | email            | phone       | subject              | message              | status  | created_at |
      | 15 | 15      | John Brown | jbrown@gmail.com | 12024569875 | Test Contact Subject | Test Contact Message | pending | 1717850955 |


  Scenario Outline: When a GET request containing valid authorization credentials and a non-existing ID is sent to the
  /api/contact/{id} endpoint, the returned status code is verified to be 203. Additionally, the remark field in the response
  body is "failed", and the message field is "There is not contact message for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/contact/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not contact message for this id.".

    Examples:
      | id   |
      | 4127 |


  Scenario: When a GET request without an ID is sent to the /api/contact/{id} endpoint with valid authorization credentials,
  the returned status code is verified to be 203. Furthermore, the remark field in the response body is "failed", and the
  message field is "No id"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/contact" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".


  Scenario Outline: When a GET request containing valid data (id) is sent to the /api/contact/{id} endpoint with invalid
  (student or teacher) authorization credentials, the returned status code is verified to be 203. Additionally, the remark
  field in the response body is "failed", and the message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    * The api user sets "api/contact/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | id |
      | 15 |


  Scenario Outline: When a GET request containing valid data (id) is sent to the /api/contact/{id} endpoint with invalid
  (invalid token) authorization credentials, the returned status code is verified to be 401, and the message field in the
  response body is confirmed to be "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/contact/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id |
      | 15 |
