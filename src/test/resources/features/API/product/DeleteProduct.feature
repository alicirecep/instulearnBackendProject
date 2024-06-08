Feature: As an administrator, I want to delete the product information with the specified ID via an API connection.

  Scenario: When a valid DELETE request with proper authorization and a valid (id) is sent to the /api/deleteProduct/{id}
  endpoint, the expected results are obtained: a status code of 200, a "success" remark in the response body, and a message stating
  "Successfully Deleted." Additionally, within the response body of the same request, the id of the deleted product should match the
  id parameter specified in the endpoint. This way, it verifies that the product record intended to be deleted has indeed been
  removed via the API.

    * The api user sends a POST request to the api "addProduct" endpoint to create a new "product" record and records the "Added Product ID" information.
    # Api kullanıcısı api "addProduct" endpointine POST isteği göndererek yeni bir "product" kaydı oluşturur ve "Added Product ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteProduct" path parameters.
    # Api kullanicisi "api/deleteProduct/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Product Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Product Id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.message" is "There is not product for this id." by sending a GET request to the "api" "product" endpoint with the "Deleted Product Id" returned in the response body.
    # Api kullanicisi response bodyde donen "Deleted Product Id" ile "api" "product" endpoint'ine GET request göndererek "message" bilgisinin "There is not product for this id." oldugunu dogrular


  Scenario Outline: When a valid DELETE request with authorization credentials and a non-existing (id) is sent to the
  /api/deleteProduct/{id} endpoint, the status code returned should be 203, the remark field in the response body should be "failed",
  and the message field should be "There is not product for this id." This should be verified.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteProduct/<id>" path parameters.
    # Api kullanicisi "api/deleteProduct/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not product for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not product for this id." oldugunu dogrular

    Examples:
      | id   |
      | 5241 |


  Scenario: When a DELETE request without an (id) but with valid authorization credentials is sent to the /api/deleteProduct/{id}
  endpoint, the status code returned should be 203, the remark field in the response body should be "failed", and the message field
  should be "No id". This should be verified.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteProduct" path parameters.
    # Api kullanicisi "api/deleteProduct/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario: When a DELETE request with invalid (student or teacher) authorization credentials but with correct (id)
  is sent to the /api/deleteProduct/{id} endpoint, the returned status code should be 203, the remark field in the response
  body should be "failed", and the message field should be "To access this data, you must log in as a admin."
  This should be verified.

    * The api user sends a POST request to the api "addProduct" endpoint to create a new "product" record and records the "Added Product ID" information.
    # Api kullanıcısı api "addProduct" endpointine POST isteği göndererek yeni bir "product" kaydı oluşturur ve "Added Product ID" bilgisini kaydeder.
    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/deleteProduct" path parameters.
    # Api kullanicisi "api/deleteProduct/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario: When a DELETE request with invalid (invalid token) authorization credentials but with correct (id) is sent to the
  /api/deleteProduct/{id} endpoint, the returned status code should be 401, and the message field in the response body should be
  "Unauthenticated." This should be verified.

    * The api user sends a POST request to the api "addProduct" endpoint to create a new "product" record and records the "Added Product ID" information.
    # Api kullanıcısı api "addProduct" endpointine POST isteği göndererek yeni bir "product" kaydı oluşturur ve "Added Product ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteProduct" path parameters.
    # Api kullanicisi "api/deleteProduct/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


