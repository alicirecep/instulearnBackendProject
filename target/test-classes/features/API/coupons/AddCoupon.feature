Feature: As an administrator, I want to create a new coupon record via an API connection.

  Scenario Outline: When a POST request with valid authorization credentials and correct data is sent to the /api/addCoupon endpoint,
  the returned status code should be 200. Additionally, the remark field in the response body should be verified as "success",
  and the Message field should be "Successfully Added." The creation of a new coupon record can be verified by sending a GET
  request to the /api/coupon/{id} endpoint with the Added Coupon ID returned in the response body.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addCoupon" path parameters.
    # Api kullanicisi "api/addCoupon" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>", <for_first_purchase> and "<expired_at>".
    # Api kullanicisi api addCoupon endpointine gondermek icin "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>", <for_first_purchase> ve "<expired_at>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "coupon" endpoint with the "Added Coupon ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Added Coupon ID" ile "api" "coupon" endpoint'ine GET request göndererek "remark" bilgisinin "success" oldugunu dogrular

    Examples:
      | title       | discount_type | source | code     | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase | expired_at |
      | Test Coupon | percentage    | course | TST78945 | 115     | 10     | 200        | 1             | 50    | all          | 0                  | 2024-06-06 |


  Scenario Outline: When a POST request with valid authorization credentials and a duplicate code is sent to the /api/addCoupon
  endpoint, the status code should be 422, and the message field in the response body should be verified as
  "The code has already been taken."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addCoupon" path parameters.
    # Api kullanicisi "api/addCoupon" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>", <for_first_purchase> and "<expired_at>".
    # Api kullanicisi api addCoupon endpointine gondermek icin "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>", <for_first_purchase> ve "<expired_at>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The code has already been taken.".
    # Api kullanicisi response bodydeki message bilgisinin "The code has already been taken." oldugunu dogrular

    Examples:
      | title       | discount_type | source | code     | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase | expired_at |
      | Test Coupon | percentage    | course | TST78945 | 115     | 10     | 200        | 1             | 50    | all          | 0                  | 2024-06-06 |


  Scenario: When a POST request with valid authorization credentials and no data is sent to the /api/addCoupon endpoint,
  the status code should be 422, and the message field in the response body should be verified as
  "The title field is required. (and 4 more errors)"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addCoupon" path parameters.
    # Api kullanicisi "api/addCoupon" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The title field is required. (and 4 more errors)".
    # Api kullanicisi response bodydeki message bilgisinin The title field is required. (and 4 more errors)" oldugunu dogrular


  Scenario Outline: When a POST request with invalid (student or teacher) authorization credentials and correct data is sent to the
  /api/addCoupon endpoint, the status code should be 203, and the remark field in the response body should be verified as "failed".
  Additionally, the message field should be "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/addCoupon" path parameters.
    # Api kullanicisi "api/addCoupon" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>", <for_first_purchase> and "<expired_at>".
    # Api kullanicisi api addCoupon endpointine gondermek icin "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>", <for_first_purchase> ve "<expired_at>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


    Examples:
      | title       | discount_type | source | code     | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase | expired_at |
      | Test Coupon | percentage    | course | TST78945 | 115     | 10     | 200        | 1             | 50    | all          | 0                  | 2024-06-06 |


  Scenario Outline: When a POST request with invalid (invalid token) authorization credentials and correct data is sent to the
  /api/addCoupon endpoint, the status code should be 401, and the message field in the response body should be verified as
  "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addCoupon" path parameters.
    # Api kullanicisi "api/addCoupon" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>", <for_first_purchase> and "<expired_at>".
    # Api kullanicisi api addCoupon endpointine gondermek icin "<title>", "<discount_type>", "<source>", "<code>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>", <for_first_purchase> ve "<expired_at>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodyde dönen message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | title       | discount_type | source | code     | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase | expired_at |
      | Test Coupon | percentage    | course | TST78945 | 115     | 10     | 200        | 1             | 50    | all          | 0                  | 2024-06-06 |

