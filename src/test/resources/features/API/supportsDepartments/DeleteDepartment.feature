Feature: As an administrator, I want to delete the support department information with the specified ID via an API connection.

  Scenario: When a DELETE request containing valid authorization credentials and the correct ID is sent to the
  /api/deleteDepartment/{id} endpoint, the returned status code is verified to be 200. Additionally, the remark field in the
  response body is "success", and the Message field is "Successfully Deleted." Moreover, it is confirmed that the
  Deleted Support Department ID returned from the response body matches the id path parameter specified in the
  /api/deleteDepartment/{id} endpoint, and the deleted support department record is validated through an API GET request sent
  to the /api/department/{id} endpoint.

    * The api user sends a POST request to the api "addDepartment" endpoint to create a new "department" record and records the "Added Support Department ID" information.
    # Api kullanıcısı api "addDepartment" endpointine POST isteği göndererek yeni bir "support" kaydı oluşturur ve "Added Support Department ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteDepartment" path parameters.
    # Api kullanicisi "api/deleteDepartment/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Support Department ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Support Department ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.message" is "There is not support department for this id." by sending a GET request to the "api" "department" endpoint with the "Deleted Support Department ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Deleted Support Department ID" ile "api" "department" endpoint'ine GET request göndererek "message" bilgisinin "There is not support department for this id." oldugunu dogrular


  Scenario Outline: When a DELETE request containing valid authorization credentials and a non-existing ID is sent to the
  /api/deleteDepartment/{id} endpoint, the returned status code is verified to be 203. Additionally, the remark field in the
  response body is "failed", and the message field is "There is not support department for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteDepartment/<id>" path parameters.
    # Api kullanicisi "api/deleteDepartment/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not support department for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not support department for this id." oldugunu dogrular

    Examples:
      | id     |
      | 825147 |


  Scenario: When a DELETE request without an ID is sent to the /api/deleteDepartment/{id} endpoint with valid authorization
  credentials, the returned status code is verified to be 203. Furthermore, the remark field in the response body is "failed  ,
  and the message field is "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteDepartment" path parameters.
    # Api kullanicisi "api/deleteDepartment/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario: When a DELETE request containing a correct ID is sent to the /api/deleteDepartment/{id} endpoint with invalid
  (student or teacher) authorization credentials, the returned status code is verified to be 203. Additionally, the remark field
  in the response body is "failed", and the message field is "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addDepartment" endpoint to create a new "department" record and records the "Added Support Department ID" information.
    # Api kullanıcısı api "addDepartment" endpointine POST isteği göndererek yeni bir "support" kaydı oluşturur ve "Added Support Department ID" bilgisini kaydeder.
    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/deleteDepartment" path parameters.
    # Api kullanicisi "api/deleteDepartment/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario: When a DELETE request containing a correct ID is sent to the /api/deleteDepartment/{id} endpoint with invalid
  (invalid token) authorization credentials, the returned status code is verified to be 401. Additionally, the message
  field in the response body is confirmed to be "Unauthenticated."

    * The api user sends a POST request to the api "addDepartment" endpoint to create a new "department" record and records the "Added Support Department ID" information.
    # Api kullanıcısı api "addDepartment" endpointine POST isteği göndererek yeni bir "support" kaydı oluşturur ve "Added Support Department ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteDepartment" path parameters.
    # Api kullanicisi "api/deleteDepartment/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

