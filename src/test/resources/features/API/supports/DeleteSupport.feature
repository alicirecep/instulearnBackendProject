Feature: As an administrator, I want to delete the support information with the specified ID via an API connection.

  Scenario: When a DELETE request is sent to the “/api/deleteSupport/{id}” endpoint with valid authorization information
  and the correct (id), the status code returned is 200, the remark field in the response body is "success" and the Message field
  is "Successfully Deleted.", and the returned Deleted Support Id is the same as the id path parameter specified in the
  /api/deleteSupport/{id} endpoint, the successful deletion of the record is verified by sending a GET request to the
  /api/support/{id} endpoint.

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    # Api kullanıcısı api "addSupport" endpointine POST isteği göndererek yeni bir "support" kaydı oluşturur ve "Added Support ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteSupport" path parameters.
    # Api kullanicisi "api/deleteSupport/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Support Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Support Id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.message" is "There is not support message for this id." by sending a GET request to the "api" "support" endpoint with the "Deleted Support Id" returned in the response body.
    # Api kullanicisi response bodyde donen "Deleted Support Id" ile "api" "support" endpoint'ine GET request göndererek "message" bilgisinin "There is not support message for this id." oldugunu dogrular


  Scenario Outline: When a DELETE request is sent to the /api/deleteSupport/{id} endpoint with valid authorization information and
  an unregistered (id), it should be verified that the status code returned is 203, the remark in the response body is "failed"
  and the message is "There is not support message for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteSupport/<id>" path parameters.
    # Api kullanicisi "api/deleteSupport/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not support message for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not support message for this id." oldugunu dogrular

    Examples:
      | id     |
      | 825147 |


  Scenario: When a DELETE request is sent to the /api/deleteSupport/{id} endpoint with valid authorization information and (id),
  it should be verified that the status code returned is 203, the remark in the response body is "failed" and the message is "No id".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteSupport" path parameters.
    # Api kullanicisi "api/deleteSupport/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario: When a DELETE request is sent to the /api/deleteSupport/{id} endpoint with invalid (student or teacher)
  authorization information and correct (id), it should be verified that the status code returned is 203, the remark in the
  response body is "failed" and the message is "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    # Api kullanıcısı api "addSupport" endpointine POST isteği göndererek yeni bir "support" kaydı oluşturur ve "Added Support ID" bilgisini kaydeder.
    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/deleteSupport" path parameters.
    # Api kullanicisi "api/deleteSupport/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario: When a DELETE request is sent to the /api/deleteSupport/{id} endpoint with invalid token authorization information
  and an id, it should be verified that the status code returned is 401 and the message in the response body is "Unauthenticated."

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    # Api kullanıcısı api "addSupport" endpointine POST isteği göndererek yeni bir "support" kaydı oluşturur ve "Added Support ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteSupport" path parameters.
    # Api kullanicisi "api/deleteSupport/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

