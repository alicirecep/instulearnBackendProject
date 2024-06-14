Feature: As an administrator, I want to delete the contact information with the specified ID via an API connection.

  Scenario: Verify that when a valid DELETE request is sent to the /api/deleteContact/{id} endpoint with correct
  authorization information and a valid {id}, the returned status code should be 200. The remark field in the response body
  should be "success", and the Message field should be "Successfully Deleted." Additionally, ensure that the
  Deleted Contact Message ID in the response body matches the {id} specified in the path parameter /api/deleteContact/{id},
  confirming that the contact record has been successfully deleted via the API.

    * The api user sends a POST request to the api "addContact" endpoint to create a new "contact" record and records the "Added Contact Message ID" information.
    # Api kullanıcısı api "addContact" endpointine POST isteği göndererek yeni bir "contact" kaydı oluşturur ve "Added Contact Message ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteContact" path parameters.
    # Api kullanicisi "api/deleteContact/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Contact Message ID " information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Contact Message ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.message" is "There is not contact message for this id." by sending a GET request to the "api" "contact" endpoint with the "Deleted Contact Message ID " returned in the response body.
    # Api kullanicisi response bodyde donen "Deleted Contact Message ID" ile "api" "contact" endpoint'ine GET request göndererek "message" bilgisinin "There is not contact message for this id." oldugunu dogrular


  Scenario Outline: When a DELETE request with valid authorization information and an {id} that does not exist in the records is
  sent to the /api/deleteContact/{id} endpoint, verify that the returned status code is 203. Ensure that the remark field in the
  response body is "failed" and the message field is "There is not contact message for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteContact/<id>" path parameters.
    # Api kullanicisi "api/deleteContact/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not contact message for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not contact message for this id." oldugunu dogrular

    Examples:
      | id     |
      | 521478 |


  Scenario: When a DELETE request without an {id} and with valid authorization information is sent to the /api/deleteContact/{id}
  endpoint, verify that the returned status code is 203. Ensure that the remark field in the response body is "failed" and the
  message field is "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteContact" path parameters.
    # Api kullanicisi "api/deleteContact/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario: When a DELETE request with invalid (student or teacher) authorization credentials and a valid {id} is sent to the
  /api/deleteContact/{id} endpoint, verify that the returned status code is 203. Ensure that the remark field in the response
  body is "failed" and the message field is "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addContact" endpoint to create a new "contact" record and records the "Added Contact Message ID" information.
    # Api kullanıcısı api "addContact" endpointine POST isteği göndererek yeni bir "contact" kaydı oluşturur ve "Added Contact Message ID" bilgisini kaydeder.
    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/deleteContact" path parameters.
    # Api kullanicisi "api/deleteContact/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario: Verify that when a DELETE request with invalid (invalid token) authorization credentials and a valid {id} is sent to
  the /api/deleteContact/{id} endpoint, the returned status code is 401, and the message field in the response body is
  "Unauthenticated."

    * The api user sends a POST request to the api "addContact" endpoint to create a new "contact" record and records the "Added Contact Message ID" information.
    # Api kullanıcısı api "addContact" endpointine POST isteği göndererek yeni bir "contact" kaydı oluşturur ve "Added Contact Message ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteContact" path parameters.
    # Api kullanicisi "api/deleteContact/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular



