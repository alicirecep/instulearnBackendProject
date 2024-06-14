Feature: As an administrator, I want to delete the coupon information with the specified ID via an API connection.

  Scenario: When a DELETE request is sent to the /api/deleteCoupon/{id} endpoint with valid authorization information
  and the correct id, the status code returned should be 200, the remark in the response body should be "success" and the message
  should be "Successfully Deleted.". Also, the Deleted Coupon ID returned in the response body must be the same as the id path
  parameter specified in the /api/deleteCoupon/{id} endpoint. When these criteria are met, the coupon record to be deleted via
  API should be successfully deleted.

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteCoupon" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    * The api user verifies that the "Deleted Coupon ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.message" is "There is not coupon for this id." by sending a GET request to the "api" "coupon" endpoint with the "Deleted Coupon ID" returned in the response body.


  Scenario Outline: When a DELETE request is sent to the /api/deleteCoupon/{id} endpoint with valid authorization information and
  a non-existing id, it should be verified that the status code returned is 203 and the remark in the response body is "failed"
  and the message is "There is not coupon for this id.".

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteCoupon/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not coupon for this id.".

    Examples:
      | id    |
      | 65147 |


  Scenario: When a DELETE request is sent to the /api/deleteCoupon/{id} endpoint without valid authorization information and id,
  it should be verified that the status code returned is 203 and the remark in the response body is "failed" and the message is
  "No id".

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/deleteCoupon" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".


  Scenario: When a DELETE request is sent to the /api/deleteCoupon/{id} endpoint with invalid (student or teacher) authorization
  information and the correct id, it should be verified that the status code returned is 203 and the remark in the response body
  is "failed" and the message is "To access this data, you must log in as a admin.".

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/deleteCoupon" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


  Scenario: When a DELETE request with the correct id is sent to the /api/deleteCoupon/{id} endpoint with an invalid token, it
  should be verified that the status code returned is 401 and the message in the response body is "Unauthenticated.".

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/deleteCoupon" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


