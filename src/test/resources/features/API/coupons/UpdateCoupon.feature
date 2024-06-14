Feature: As an administrator, I want to update the information of the coupon with the specified ID via an API connection.

  Scenario Outline: When a PATCH request with valid authorization credentials, correct (id), and updated data is sent to the
  /api/updateCoupon/{id} endpoint, the returned status code should be 200. Additionally, the remark field in the response body
  should be verified as "success", and the Message field should be "Successfully Updated." Moreover, it should be ensured that
  the Updated Coupon ID in the response body matches the id path parameter in the endpoint and that the updated coupon record is
  verified through the API.

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateCoupon" path parameters.
    * The api user prepares a PATCH request to send to the api updateCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" and <for_first_purchase>.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    * The api user verifies that the "Updated Coupon ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.title" is "Test Coupon Updated" by sending a GET request to the "api" "coupon" endpoint with the "Updated Coupon ID" returned in the response body.

    Examples:
      | title               | discount_type | source | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase |
      | Test Coupon Updated | percentage    | course | 5       | 10     | 200        | 1             | 50    | all          | 0                  |


  Scenario: When a PATCH request with valid authorization credentials and a correct (id) but no data is sent to the
  /api/updateCoupon/{id} endpoint, the returned status code should be 203, and the remark field in the response body should
  be verified as "failed". Additionally, the message field should be "There is no information to update."

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateCoupon" path parameters.
    * The api user prepares a PATCH request without containing any data.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "message" information in the response body is "There is no information to update.".


  Scenario Outline: When a PATCH request with valid authorization credentials and correct data but a non-existing (id) is sent to
  the /api/updateCoupon/{id} endpoint, the returned status code should be 203, and the remark field in the response body should be
  verified as "failed". Additionally, the message field should be "There is not coupon for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateCoupon/<id>" path parameters.
    * The api user prepares a PATCH request to send to the api updateCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" and <for_first_purchase>.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not coupon for this id.".

    Examples:
      | id    | title               | discount_type | source | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase |
      | 84517 | Test Coupon Updated | percentage    | course | 5       | 10     | 200        | 1             | 50    | all          | 0                  |


  Scenario Outline: Verify that sending a PATCH request to the /api/updateCoupon/{id} endpoint with valid authorization but missing {id}
  and correct data fields returns status code 203, with remark as "failed" and message as "No id"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateCoupon" path parameters.
    * The api user prepares a PATCH request to send to the api updateCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" and <for_first_purchase>.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".

    Examples:
      | title               | discount_type | source | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase |
      | Test Coupon Updated | percentage    | course | 5       | 10     | 200        | 1             | 50    | all          | 0                  |


  Scenario Outline: Verify that when a PATCH request is sent to the /api/updateCoupon/{id} endpoint with valid (id) and correct
  data but with invalid (student or teacher) authorization credentials, the response status code is 203, the response body contains
  remark, "failed", and the message, "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    * The api user constructs the base url with the "student" token.
    * The api user sets "api/updateCoupon" path parameters.
    * The api user prepares a PATCH request to send to the api updateCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" and <for_first_purchase>.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | title               | discount_type | source | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase |
      | Test Coupon Updated | percentage    | course | 5       | 10     | 200        | 1             | 50    | all          | 0                  |


  Scenario Outline: When a PATCH request with the correct id and correct data is sent to the /api/updateCoupon/{id} endpoint
  with an invalid authorization token, the status code is 401 and the message in the response body is "Unauthenticated."

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/updateCoupon" path parameters.
    * The api user prepares a PATCH request to send to the api updateCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" and <for_first_purchase>.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | title               | discount_type | source | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase |
      | Test Coupon Updated | percentage    | course | 5       | 10     | 200        | 1             | 50    | all          | 0                  |

