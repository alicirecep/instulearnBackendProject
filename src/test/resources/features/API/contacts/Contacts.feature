Feature: As an administrator, I want to access contacts via an API connection.

  Scenario Outline: When a GET request is sent to the /api/contacts endpoint with valid authorization credentials, the returned
  status code is verified to be 200. Additionally, the remark field in the response body is confirmed to be "success". Furthermore,
  for a specific contact ID, the accuracy of the information returned in the response body (name, email, phone, subject, message,
  reply, status, created_at) is checked.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/contacts" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies the "<name>", "<email>", "<phone>", "<subject>", "<message>", "<status>", and <created_at> information for the item at the <dataIndex> index in the response body.

    Examples:
      | dataIndex | name          | email            | phone       | subject              | message              | status  | created_at |
      | 0         | John Brown    | jbrown@gmail.com | 12024569875 | Test Contact Subject | Test Contact Message | pending | 1717851128 |
      | 2         | Alice William | jbrown@gmail.com | 12035269752 | Test Contact Subject | Test Contact Message | pending | 1717850741 |


  Scenario: When a GET request is sent to the /api/contacts endpoint with invalid (student or teacher) authorization credentials,
  the returned status code is verified to be 203. Additionally, the remark field in the response body is "failed", and the
  message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    * The api user sets "api/contacts" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


  Scenario: Verify that when a GET request is sent to the /api/contacts endpoint with invalid (invalid token) credentials,
  the status code is 401 and the message field in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/contacts" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

