Feature: As an administrator, I want to access detailed information about the coupon with the specified ID via an API connection.

  Scenario Outline: When a GET request with valid authorization credentials and correct data (id) is sent to the /api/coupon/{id}
  endpoint, the returned status code should be 200, and the remark field in the response body should be verified as "success".
  Additionally, the id, creator_id, title, discount_type, source, code, percent, amount, max_amount, minimum_order, count, user_type,
  product_type, for_first_purchase, status, expired_at, created_at information in the response body should be verified.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/<id>" path parameters.
    # Api kullanicisi "api/coupon/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies the content of data <data_id>, <creator_id>, "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<user_type>", "<product_type>", <for_first_purchase>, "<status>", <expired_at> and <created_at> in the response body.
    # Api kullanicisi response bodydeki data <data_id>, <creator_id>, "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<user_type>", "<product_type>", <for_first_purchase>, "<status>", <expired_at> ve <created_at> içeriklerini doğrular.

    Examples:
      | id | data_id | creator_id | title               | discount_type | source | code   | percent | amount | max_amount | minimum_order | count | user_type | product_type | for_first_purchase | status | expired_at | created_at |
      | 25 | 25      | 1349       | Test Coupon Updated | percentage    | course | TST789 | 5       | 10     | 200        | 1             | 50    | all_users | all          | 0                  | active | 1717646400 | 1715348467 |


  Scenario Outline: When a GET request with valid authorization credentials and a non-existent (id) is sent to the /api/coupon/{id}
  endpoint, the returned status code should be 203, and the remark field in the response body should be verified as "failed".
  Additionally, the message field should be "There is not coupon for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/<id>" path parameters.
    # Api kullanicisi "api/coupon/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not coupon for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not coupon for this id." oldugunu dogrular

    Examples:
      | id    |
      | 54127 |


  Scenario: When a GET request without an (id) is sent with valid authorization credentials to the /api/coupon/{id} endpoint,
  the returned status code should be 203, and the remark field in the response body should be verified as "failed". Additionally,
  the message field should be "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon" path parameters.
    # Api kullanicisi "api/coupon/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When a GET request with invalid (student or teacher) authorization credentials and correct data (id) is sent to
  the /api/coupon/{id} endpoint, the returned status code should be 203, and the remark field in the response body should be
  verified as "failed". Additionally, the message field should be "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/coupon/<id>" path parameters.
    # Api kullanicisi "api/coupon/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | id |
      | 25 |


  Scenario Outline: When a GET request with invalid (invalid token) authorization credentials and correct data (id) is sent to the
  /api/coupon/{id} endpoint, the returned status code should be 401, and the message field in the response body should be verified as
  "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/coupon/<id>" path parameters.
    # Api kullanicisi "api/coupon/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 25 |


