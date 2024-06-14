Feature: As an administrator, I want to access support resources via an API connection.

  Scenario Outline: When a GET request is sent to the /api/supports endpoint with valid authorization information, it should be
  verified that the status code returned is 200 and the remark in the response body is "success". Also, when a GET request is
  sent to the /api/supports endpoint with valid authorization information, if a record containing an id (x) is returned,
  the information in the response body (user_id, webinar_id, department_id, title, status, created_at, updated_at, status_order,
  id, full_name, role_name) should be verified.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/supports" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user validates the <user_id>, <department_id>, "<title>", "<status>", <created_at>, <updated_at>, "<status_order>", <id>, "<full_name>" and "<role_name>" of the response body with index <dataIndex>.

    Examples:
      | dataIndex | user_id | department_id | title           | status | created_at | updated_at | status_order | id  | full_name      | role_name |
      | 8         | 923     | 3             | Commission Rate | open   | 1625892221 | 1717974773 | a            | 923 | Sawyer Emerson | teacher   |


  Scenario: When a GET request is sent to the /api/supports endpoint with invalid (student or teacher) authorization information,
  it should be verified that the status code returned is 203 and the remark in the response body is "failed" and the message is
  "To access this data, you must log in as a admin.".

    * The api user constructs the base url with the "student" token.
    * The api user sets "api/supports" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


  Scenario: When a GET request is sent to the /api/supports endpoint with an invalid token, it should be verified that the status
  code returned is 401 and the message in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/supports" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

