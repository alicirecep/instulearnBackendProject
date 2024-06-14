Feature: As an administrator, I want to create a new coupon record via an API connection.

  Scenario Outline: When a POST request with valid authorization credentials and correct data is sent to the /api/addCoupon endpoint,
  the returned status code should be 200. Additionally, the remark field in the response body should be verified as "success",
  and the Message field should be "Successfully Added." The creation of a new coupon record can be verified by sending a GET
  request to the /api/coupon/{id} endpoint with the Added Coupon ID returned in the response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addCoupon" path parameters.
    * The api user prepares a POST request to send to the api addCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>", <for_first_purchase> and "<expired_at>".
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "coupon" endpoint with the "Added Coupon ID" returned in the response body.

    Examples:
      | title       | discount_type | source | code     | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase | expired_at |
      | Test Coupon | percentage    | course | TST78945 | 115     | 10     | 200        | 1             | 50    | all          | 0                  | 2024-06-06 |


  Scenario Outline: When a POST request with valid authorization credentials and a duplicate code is sent to the /api/addCoupon
  endpoint, the status code should be 422, and the message field in the response body should be verified as
  "The code has already been taken."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addCoupon" path parameters.
    * The api user prepares a POST request to send to the api addCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>", <for_first_purchase> and "<expired_at>".
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 422.
    * The api user verifies that the "message" information in the response body is "The code has already been taken.".

    Examples:
      | title       | discount_type | source | code     | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase | expired_at |
      | Test Coupon | percentage    | course | TST78945 | 115     | 10     | 200        | 1             | 50    | all          | 0                  | 2024-06-06 |


  Scenario: When a POST request with valid authorization credentials and no data is sent to the /api/addCoupon endpoint,
  the status code should be 422, and the message field in the response body should be verified as
  "The title field is required. (and 4 more errors)"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addCoupon" path parameters.
    * The api user prepares a POST request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 422.
    * The api user verifies that the "message" information in the response body is "The title field is required. (and 4 more errors)".


  Scenario Outline: When a POST request with invalid (student or teacher) authorization credentials and correct data is sent to the
  /api/addCoupon endpoint, the status code should be 203, and the remark field in the response body should be verified as "failed".
  Additionally, the message field should be "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    * The api user sets "api/addCoupon" path parameters.
    * The api user prepares a POST request to send to the api addCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>", <for_first_purchase> and "<expired_at>".
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


    Examples:
      | title       | discount_type | source | code     | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase | expired_at |
      | Test Coupon | percentage    | course | TST78945 | 115     | 10     | 200        | 1             | 50    | all          | 0                  | 2024-06-06 |


  Scenario Outline: When a POST request with invalid (invalid token) authorization credentials and correct data is sent to the
  /api/addCoupon endpoint, the status code should be 401, and the message field in the response body should be verified as
  "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/addCoupon" path parameters.
    * The api user prepares a POST request to send to the api addCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>", <for_first_purchase> and "<expired_at>".
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | title       | discount_type | source | code     | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase | expired_at |
      | Test Coupon | percentage    | course | TST78945 | 115     | 10     | 200        | 1             | 50    | all          | 0                  | 2024-06-06 |

