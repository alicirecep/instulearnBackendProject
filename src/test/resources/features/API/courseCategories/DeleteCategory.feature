Feature: As an administrator, I want to delete the course category information with the specified ID via an API connection.

  Scenario: When a DELETE request with valid authorization and correct (id) is sent to the /api/deleteCategory/{id}
  endpoint, the expected result should be a status code of 200. The status in the response body should be "success",
  and the Message should be "Successfully Deleted." The returned Deleted Category Id should match the id parameter
  specified in the endpoint. This confirms that the course category record intended to be deleted has been successfully
  deleted via the API.

    * The api user sends a POST request to the api "addCategory" endpoint to create a new "category" record and records the "Added Category ID" information.
    # Api kullanıcısı api "addCategory" endpointine POST isteği göndererek yeni bir "category" kaydı oluşturur ve "Added Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteCategory" path parameters.
    # Api kullanicisi "api/deleteCategory/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "data.status" information in the response body is "success".
    # Api kullanicisi response bodydeki status bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Category Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Category Id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.message" is "There is not category for this id." by sending a GET request to the "api" "category" endpoint with the "Deleted Category Id" returned in the response body.
    # Api kullanicisi response bodyde donen "Deleted Category Id" ile "api" "category" endpoint'ine GET request göndererek "message" bilgisinin "There is not category for this id." oldugunu dogrular


  Scenario Outline: When sending a DELETE request with valid authorization credentials but containing an unregistered id,
  it should be verified that the status code returned from the /api/deleteCategory/{id} endpoint is 203. Additionally, the
  remark field in the response body should be "failed", and the message field should be "There is not category for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteCategory/<id>" path parameters.
    # Api kullanicisi "api/deleteCategory/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not category for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not category for this id." oldugunu dogrular

    Examples:
      | id    |
      | 25416 |


  Scenario: When sending a DELETE request without an id but with valid authorization credentials, it should be verified that the
  status code returned from the /api/deleteCategory/{id} endpoint is 203. Additionally, the remark field in the response body
  should be "failed", and the message field should be "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteCategory" path parameters.
    # Api kullanicisi "api/deleteCategory/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario: When sending a DELETE request with invalid (student or teacher) authorization credentials but with the correct
  id, it should be verified that the status code returned from the /api/deleteCategory/{id} endpoint is 203. Additionally, the
  remark field in the response body should be "failed", and the message field should be
  "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addCategory" endpoint to create a new "category" record and records the "Added Category ID" information.
    # Api kullanıcısı api "addCategory" endpointine POST isteği göndererek yeni bir "category" kaydı oluşturur ve "Added Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/deleteCategory" path parameters.
    # Api kullanicisi "api/deleteCategory/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario: When sending a DELETE request with invalid (invalid token) authorization credentials but with the correct id,
  it should be verified that the status code returned from the /api/deleteCategory/{id} endpoint is 401. Additionally, the
  message field in the response body should be "Unauthenticated."

    * The api user sends a POST request to the api "addCategory" endpoint to create a new "category" record and records the "Added Category ID" information.
    # Api kullanıcısı api "addCategory" endpointine POST isteği göndererek yeni bir "category" kaydı oluşturur ve "Added Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteCategory" path parameters.
    # Api kullanicisi "api/deleteCategory/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

