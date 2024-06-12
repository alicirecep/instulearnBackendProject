Feature: As an administrator, I want to delete the coupon information with the specified ID via an API connection.

  Scenario: When a DELETE request is sent to the /api/deleteCoupon/{id} endpoint with valid authorization information
  and the correct id, the status code returned should be 200, the remark in the response body should be "success" and the message
  should be "Successfully Deleted.". Also, the Deleted Coupon ID returned in the response body must be the same as the id path
  parameter specified in the /api/deleteCoupon/{id} endpoint. When these criteria are met, the coupon record to be deleted via
  API should be successfully deleted.

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    # Api kullanıcısı api "addCoupon" endpointine POST isteği göndererek yeni bir "coupon" kaydı oluşturur ve "Added Coupon ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteCoupon" path parameters.
    # Api kullanicisi "api/deleteCoupon/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Coupon ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Coupon ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.message" is "There is not coupon for this id." by sending a GET request to the "api" "coupon" endpoint with the "Deleted Coupon ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Deleted Coupon ID" ile "api" "coupon" endpoint'ine GET request göndererek "message" bilgisinin "There is not coupon for this id." oldugunu dogrular


  Scenario Outline: When a DELETE request is sent to the /api/deleteCoupon/{id} endpoint with valid authorization information and
  a non-existing id, it should be verified that the status code returned is 203 and the remark in the response body is "failed"
  and the message is "There is not coupon for this id.".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteCoupon/<id>" path parameters.
    # Api kullanicisi "api/deleteCoupon/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not coupon for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not coupon for this id." oldugunu dogrular

    Examples:
      | id    |
      | 65147 |


  Scenario: When a DELETE request is sent to the /api/deleteCoupon/{id} endpoint without valid authorization information and id,
  it should be verified that the status code returned is 203 and the remark in the response body is "failed" and the message is
  "No id".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteCoupon" path parameters.
    # Api kullanicisi "api/deleteCoupon/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario: When a DELETE request is sent to the /api/deleteCoupon/{id} endpoint with invalid (student or teacher) authorization
  information and the correct id, it should be verified that the status code returned is 203 and the remark in the response body
  is "failed" and the message is "To access this data, you must log in as a admin.".

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    # Api kullanıcısı api "addCoupon" endpointine POST isteği göndererek yeni bir "coupon" kaydı oluşturur ve "Added Coupon ID" bilgisini kaydeder.
    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/deleteCoupon" path parameters.
    # Api kullanicisi "api/deleteCoupon/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario: When a DELETE request with the correct id is sent to the /api/deleteCoupon/{id} endpoint with an invalid token, it
  should be verified that the status code returned is 401 and the message in the response body is "Unauthenticated.".

    * The api user sends a POST request to the api "addCoupon" endpoint to create a new "coupon" record and records the "Added Coupon ID" information.
    # Api kullanıcısı api "addCoupon" endpointine POST isteği göndererek yeni bir "coupon" kaydı oluşturur ve "Added Coupon ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteCoupon" path parameters.
    # Api kullanicisi "api/deleteCoupon/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


