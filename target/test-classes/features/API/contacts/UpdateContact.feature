Feature: As an administrator, I want to update the information of the contact with the specified ID via an API connection.

  Scenario Outline: When a PATCH request containing valid authorization credentials, correct ID, and valid data
  (phone, subject, message) is sent to the /api/updateContact/{id} endpoint, the returned status code is verified to be 200.
  Additionally, the remark field in the response body is "success", and the Message field is "Successfully Updated."
  Furthermore, it is confirmed through the Updated Contact Message ID returned in the response body that it matches the id
  path parameter in the /api/updateContact/{id} endpoint, ensuring that the record has been updated in the API.

    * The api user sends a POST request to the api "addContact" endpoint to create a new "contact" record and records the "Added Contact Message ID" information.
    # Api kullanıcısı api "addContact" endpointine POST isteği göndererek yeni bir "contact" kaydı oluşturur ve "Added Contact Message ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateContact" path parameters.
    # Api kullanicisi "api/updateContact/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<subject>" and "<message>" information to send to the api updateContact endpoint.
    # Api kullanicisi api updateContact endpointine gondermek icin "<subject>" ve "<message>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * The api user verifies that the "Updated Contact Message ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Updated Contact Message ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.subject" is "Subject Test Contact" by sending a GET request to the "api" "contact" endpoint with the "Updated Contact Message ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Updated Contact Message ID" ile "api" "contact" endpoint'ine GET request göndererek "title" bilgisinin "Subject Test Contact" oldugunu dogrular

    Examples:
      | subject              | message              |
      | Subject Test Contact | Message Test Contact |


  Scenario: When a PATCH request containing valid authorization credentials, correct ID, and no data is sent to the
  /api/updateContact/{id} endpoint, the returned status code is verified to be 203. Additionally, the
  remark field in the response body is "failed", and the message field is "There is no information to update."

    * The api user sends a POST request to the api "addContact" endpoint to create a new "contact" record and records the "Added Contact Message ID" information.
    # Api kullanıcısı api "addContact" endpointine POST isteği göndererek yeni bir "contact" kaydı oluşturur ve "Added Contact Message ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateContact" path parameters.
    # Api kullanicisi "api/updateContact/{id}" path parametrelerini olusturur
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


  Scenario Outline: When a PATCH request containing valid authorization credentials, a non-existing ID, and correct data
  (phone, subject, message) is sent to the /api/updateContact/{id} endpoint, the returned status code is verified to be 203.
  Additionally, the remark field in the response body is "failed", and the message field is
  "There is not contact message for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateContact/<id>" path parameters.
    # Api kullanicisi "api/updateContact/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<subject>" and "<message>" information to send to the api updateContact endpoint.
    # Api kullanicisi api updateContact endpointine gondermek icin "<subject>" ve "<message>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not contact message for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not contact message for this id." oldugunu dogrular

    Examples:
      | id    | subject              | message              |
      | 52414 | Subject Test Contact | Message Test Contact |


  Scenario Outline: When a PATCH request containing valid authorization credentials and correct data (phone, subject, message)
  but without an ID is sent to the /api/updateContact/{id} endpoint, the returned status code is verified to be 203.
  Additionally, the remark field in the response body is "failed", and the message field is "No id" is confirmed.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateContact" path parameters.
    # Api kullanicisi "api/updateContact/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<subject>" and "<message>" information to send to the api updateContact endpoint.
    # Api kullanicisi api updateContact endpointine gondermek icin "<subject>" ve "<message>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular

    Examples:
      | subject              | message              |
      | Subject Test Contact | Message Test Contact |


  Scenario Outline: When a PATCH request containing correct data (phone, subject, message) and a correct ID is sent to the
  /api/updateContact/{id} endpoint with invalid (student or teacher) authorization credentials, the returned status code is
  verified to be 203. Additionally, the remark field in the response body is "failed", and the message field is confirmed
  to be "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addContact" endpoint to create a new "contact" record and records the "Added Contact Message ID" information.
    # Api kullanıcısı api "addContact" endpointine POST isteği göndererek yeni bir "contact" kaydı oluşturur ve "Added Contact Message ID" bilgisini kaydeder.
    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/updateContact" path parameters.
    # Api kullanicisi "api/updateContact/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<subject>" and "<message>" information to send to the api updateContact endpoint.
    # Api kullanicisi api updateContact endpointine gondermek icin "<subject>" ve "<message>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | subject              | message              |
      | Subject Test Contact | Message Test Contact |


  Scenario Outline: When a PATCH request containing correct data (phone, subject, message) and a correct ID is sent to the
  /api/updateContact/{id} endpoint with invalid (invalid token) authorization credentials, the returned status code is
  verified to be 401, and the message field in the response body is confirmed to be "Unauthenticated."

    * The api user sends a POST request to the api "addContact" endpoint to create a new "contact" record and records the "Added Contact Message ID" information.
    # Api kullanıcısı api "addContact" endpointine POST isteği göndererek yeni bir "contact" kaydı oluşturur ve "Added Contact Message ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/updateContact" path parameters.
    # Api kullanicisi "api/updateContact/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<subject>" and "<message>" information to send to the api updateContact endpoint.
    # Api kullanicisi api updateContact endpointine gondermek icin "<subject>" ve "<message>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | subject              | message              |
      | Subject Test Contact | Message Test Contact |


