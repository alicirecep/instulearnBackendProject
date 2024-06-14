Feature: As an administrator, I want to access support departments via an API connection.

  Scenario Outline: When a GET request is sent to the /api/departments endpoint with valid authorization information, it is
  verified that the status code returned is 200 and the remark field in the response body is "success". Also, when a GET request
  is sent to the /api/departments endpoint with valid authorization information for a department with a specific id, the
  information returned (created_at, supports_count, title, id, support_department_id, locale, title) is checked for correctness

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/departments" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The API user validates the <created_at>, <supports_count>, <id>, <support_department_id>, "<locale>" and "<title>" of the response body with index <dataIndex>.

    Examples:
      | dataIndex | created_at | supports_count | id | support_department_id | locale | title            |
      | 0         | 1716130129 | 0              | 16 | 14                    | en     | Technical Office |


  Scenario: When a GET request is sent to the /api/departments endpoint with invalid (student or teacher) authorization
  information, it is verified that the status code returned is 203, the remark field in the response body is "failed" and the
  message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    * The api user sets "api/departments" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


  Scenario: When a GET request is sent to the /api/departments endpoint with invalid token authorization information, it is
  verified that the status code returned is 401 and the message field in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/departments" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

