Feature: As an administrator, I want to update the information of the coupon with the specified ID via an API connection.

  Scenario Outline: When a PATCH request with valid authorization credentials, correct (id), and updated data is sent to the
  /api/updateCoupon/{id} endpoint, the returned status code should be 200. Additionally, the remark field in the response body
  should be verified as "success", and the Message field should be "Successfully Updated." Moreover, it should be ensured that
  the Updated Coupon ID in the response body matches the id path parameter in the endpoint and that the updated coupon record is
  verified through the API.

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    # Api kullanıcısı api "addCoupon" endpointine POST isteği göndererek yeni bir "coupon" kaydı oluşturur ve "Added Coupon ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCoupon" path parameters.
    # Api kullanicisi "api/updateCoupon/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updateCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" and <for_first_purchase>.
    # Api kullanicisi api updateCoupon endpointine gondermek icin "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" ve <for_first_purchase> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * The api user verifies that the "Updated Coupon ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Updated Coupon ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.title" is "Test Coupon Updated" by sending a GET request to the "api" "coupon" endpoint with the "Updated Coupon ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Updated Coupon ID" ile "api" "coupon" endpoint'ine GET request göndererek "title" bilgisinin "Test Coupon Updated" oldugunu dogrular

    Examples:
      | title               | discount_type | source | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase |
      | Test Coupon Updated | percentage    | course | 5       | 10     | 200        | 1             | 50    | all          | 0                  |


  Scenario: When a PATCH request with valid authorization credentials and a correct (id) but no data is sent to the
  /api/updateCoupon/{id} endpoint, the returned status code should be 203, and the remark field in the response body should
  be verified as "failed". Additionally, the message field should be "There is no information to update."

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    # Api kullanıcısı api "addCoupon" endpointine POST isteği göndererek yeni bir "coupon" kaydı oluşturur ve "Added Coupon ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCoupon" path parameters.
    # Api kullanicisi "api/updateCoupon/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request without containing any data.
    # Api kullanicisi data icermeyen bir patch request hazırlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "There is no information to update.".
    # Api kullanicisi response bodyde dönen message bilgisinin "There is no information to update." oldugunu dogrular


  Scenario Outline: When a PATCH request with valid authorization credentials and correct data but a non-existing (id) is sent to
  the /api/updateCoupon/{id} endpoint, the returned status code should be 203, and the remark field in the response body should be
  verified as "failed". Additionally, the message field should be "There is not coupon for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCoupon/<id>" path parameters.
    # Api kullanicisi "api/updateCoupon/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updateCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" and <for_first_purchase>.
    # Api kullanicisi api updateCoupon endpointine gondermek icin "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" ve <for_first_purchase> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not coupon for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not coupon for this id." oldugunu dogrular

    Examples:
      | id    | title               | discount_type | source | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase |
      | 84517 | Test Coupon Updated | percentage    | course | 5       | 10     | 200        | 1             | 50    | all          | 0                  |


  Scenario Outline: Verify that sending a PATCH request to the /api/updateCoupon/{id} endpoint with valid authorization but missing {id}
  and correct data fields returns status code 203, with remark as "failed" and message as "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCoupon" path parameters.
    # Api kullanicisi "api/updateCoupon/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updateCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" and <for_first_purchase>.
    # Api kullanicisi api updateCoupon endpointine gondermek icin "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" ve <for_first_purchase> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular

    Examples:
      | title               | discount_type | source | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase |
      | Test Coupon Updated | percentage    | course | 5       | 10     | 200        | 1             | 50    | all          | 0                  |


  Scenario Outline: Verify that when a PATCH request is sent to the /api/updateCoupon/{id} endpoint with valid (id) and correct
  data but with invalid (student or teacher) authorization credentials, the response status code is 203, the response body contains
  remark, "failed", and the message, "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    # Api kullanıcısı api "addCoupon" endpointine POST isteği göndererek yeni bir "coupon" kaydı oluşturur ve "Added Coupon ID" bilgisini kaydeder.
    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/updateCoupon" path parameters.
    # Api kullanicisi "api/updateCoupon/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updateCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" and <for_first_purchase>.
    # Api kullanicisi api updateCoupon endpointine gondermek icin "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" ve <for_first_purchase> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | title               | discount_type | source | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase |
      | Test Coupon Updated | percentage    | course | 5       | 10     | 200        | 1             | 50    | all          | 0                  |


  Scenario Outline: When a PATCH request with the correct id and correct data is sent to the /api/updateCoupon/{id} endpoint
  with an invalid authorization token, the status code is 401 and the message in the response body is "Unauthenticated."

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    # Api kullanıcısı api "addCoupon" endpointine POST isteği göndererek yeni bir "coupon" kaydı oluşturur ve "Added Coupon ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/updateCoupon" path parameters.
    # Api kullanicisi "api/updateCoupon/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updateCoupon endpoint containing the following information: "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" and <for_first_purchase>.
    # Api kullanicisi api updateCoupon endpointine gondermek icin "<title>", "<discount_type>", "<source>", <percent>, <amount>, <max_amount>, <minimum_order>, <count>, "<product_type>" ve <for_first_purchase> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | title               | discount_type | source | percent | amount | max_amount | minimum_order | count | product_type | for_first_purchase |
      | Test Coupon Updated | percentage    | course | 5       | 10     | 200        | 1             | 50    | all          | 0                  |

