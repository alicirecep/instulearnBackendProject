Feature: As an administrator, I want to access coupons via an API connection.

  Scenario Outline: When a GET request is sent to the /api/coupons endpoint with valid authorization credentials, the
  returned status code should be 200, and the remark field in the response body should be verified as "success" Additionally,
  the information for the entry with id(x) in the response body (creator_id, title, discount_type, source, code, percent, amount,
  max_amount, minimum_order, count, user_type, product_type, for_first_purchase, status, expired_at, created_at) should be verified.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/coupons" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies the <creator_id>, "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<user_type>", "<product_type>", <for_first_purchase>, "<status>", <expired_at> and <created_at> information of the entry at the <dataIndex> index in the response body.

    Examples:
      | dataIndex | creator_id | title       | discount_type | source | code       | percent | amount | max_amount | minimum_order | count | user_type | product_type | for_first_purchase | status | expired_at | created_at |
      | 0         | 1332       | Test Coupon | percentage    | course | B000CR7COI | 15      | 10     | 200        | 1             | 50    | all_users | all          | 0                  | active | 1717646400 | 1718059306 |


  Scenario: When a GET request is sent to the /api/coupons endpoint with invalid (student or teacher) authorization credentials,
  the returned status code should be 203, the remark field in the response body should be verified as "failed," and the message
  field should be "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/coupons" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


  Scenario: When a GET request is sent to the /api/coupons endpoint with invalid (invalid token) authorization credentials,
  the returned status code should be 401, and the message field in the response body should be verified as "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/coupons" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


