Feature: As an administrator, I want to access badges via an API connection.

  Scenario Outline: Verify that when a GET request with valid authorization credentials is sent to the /api/badges endpoint,
  the returned status code is 200 and the remark field in the response body is "success". Additionally, ensure that the
  information in the response body for the badge with id(x) including (image, type, from, to, score, created_at, id, badge_id,
  locale, title, description) is correct.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/badges" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies the information for the entry with the <dataIndex> index in the response body, including "<image>", "<type>", "<from>", "<to>", <score>, <created_at>, <id>, <badge_id>, "<locale>", "<title>", and "<description>".

    Examples:
      | dataIndex | image                                         | type          | from | to  | score | created_at | id | badge_id | locale | title      | description          |
      | 0         | /store/1/default_images/badges/loyal_user.png | register_date | 31   | 365 | 10    | 1625554171 | 2  | 22       | en     | Loyal User | 1 year of Membership |


  Scenario:Verify that when a GET request is sent to the /api/badges endpoint with invalid (student or teacher) authorization
  credentials, the returned status code is 203. Ensure that the remark field in the response body is "failed" and the message
  field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    * The api user sets "api/badges" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


  Scenario: Verify that when a GET request is sent to the /api/badges endpoint with invalid (invalid token) authorization
  credentials, the returned status code is 401, and the message field in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/badges" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

