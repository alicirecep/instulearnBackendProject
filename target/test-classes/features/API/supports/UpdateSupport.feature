Feature: As an administrator, I want to update the information of the support resource with the specified ID via an API connection.

  Scenario Outline: When a PATCH request is sent to the /api/updateSupport/{id} endpoint with valid authorization information
  and correct data, it is verified that the status code returned is 200, the remark field in the response body is "success" and
  the Message field is "Updated Successfully", and the Updated Support ID returned is the same as the id path parameter
  specified in the /api/updateSupport/{id} endpoint. Also, to verify the updated record, a GET request is sent to the
  /api/support/{id} endpoint with the returned Updated Support ID to verify that the record has been updated.

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    # Api kullanıcısı api "addSupport" endpointine POST isteği göndererek yeni bir "support" kaydı oluşturur ve "Added Support ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateSupport" path parameters.
    # Api kullanicisi "api/updateSupport/{id}" path parametrelerini olusturur
    * The api user prepares a patch request with "<title>", <department_id> and "<message>" to send to the api updateSupport endpoint.
    # Api kullanicisi api updateSupport endpointine gondermek icin "<title>", <department_id> ve "<message>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Updated Succesfully".
    # Api kullanicisi response bodydeki Message bilgisinin "Updated Succesfully" oldugunu dogrular
    * The api user verifies that the "Updated Support ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Updated Support ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.title" is "Cancelled order not been refunded." by sending a GET request to the "api" "support" endpoint with the "Updated Support ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Updated Support ID" ile "api" "support" endpoint'ine GET request göndererek "title" bilgisinin "Cancelled order not been refunded." oldugunu dogrular

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


  Scenario:  When a PATCH request is sent to the /api/updateSupport/{id} endpoint with valid authorization information, it
  should be verified that the status code returned is 203, the remark in the response body is "failed" and the message is
  "There is no information to update."

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    # Api kullanıcısı api "addSupport" endpointine POST isteği göndererek yeni bir "support" kaydı oluşturur ve "Added Support ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateSupport" path parameters.
    # Api kullanicisi "api/updateSupport/{id}" path parametrelerini olusturur
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


  Scenario Outline: When a PATCH body is sent to /api/updateSupport/{id} endpoint containing an unregistered (id) and correct data
  (title, department_id, message) with valid authorization information, it should be verified that the status code returned is 203,
  the remark in the response body is "failed" and the message is "There is not support message for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateSupport/<id>" path parameters.
    # Api kullanicisi "api/updateSupport/{id}" path parametrelerini olusturur
    * The api user prepares a patch request with "<title>", <department_id> and "<message>" to send to the api updateSupport endpoint.
    # Api kullanicisi api updateSupport endpointine gondermek icin "<title>", <department_id> ve "<message>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not support message for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not support message for this id." oldugunu dogrular

    Examples:
      | id       | title                              | department_id | message                                                    |
      | 88954121 | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


  Scenario Outline: When a PATCH body is sent to /api/updateSupport/{id} endpoint with valid authorization information (id) and
  correct data (title, department_id, message), it should be verified that the status code returned is 203, the remark in the
  response body is "failed" and the message is "No id".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateSupport" path parameters.
    # Api kullanicisi "api/updateSupport/{id}" path parametrelerini olusturur
    * The api user prepares a patch request with "<title>", <department_id> and "<message>" to send to the api updateSupport endpoint.
    # Api kullanicisi api updateSupport endpointine gondermek icin "<title>", <department_id> ve "<message>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


  Scenario Outline: When a PATCH body is sent to /api/updateSupport/{id} endpoint with invalid (student or teacher) authorization
  information and correct (id) and correct data (title, department_id, message), it should be verified that the status code
  returned is 203, the remark in the response body is "failed" and the message is
  "To access this data, you must log in as a  admin."

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    # Api kullanıcısı api "addSupport" endpointine POST isteği göndererek yeni bir "support" kaydı oluşturur ve "Added Support ID" bilgisini kaydeder.
    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/updateSupport" path parameters.
    # Api kullanicisi "api/updateSupport/{id}" path parametrelerini olusturur
    * The api user prepares a patch request with "<title>", <department_id> and "<message>" to send to the api updateSupport endpoint.
    # Api kullanicisi api updateSupport endpointine gondermek icin "<title>", <department_id> ve "<message>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a  admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a  admin." oldugunu dogrular

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


  Scenario Outline: When a PATCH body is sent to /api/updateSupport/{id} endpoint with invalid token authorization information
  and correct (id) and correct data (title, department_id, message), it should be verified that the status code returned is 401
  and the message information in the response body is "Unauthenticated."

    * The api user sends a POST request to the api "addSupport" endpoint to create a new "support" record and records the "Added Support ID" information.
    # Api kullanıcısı api "addSupport" endpointine POST isteği göndererek yeni bir "support" kaydı oluşturur ve "Added Support ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/updateSupport" path parameters.
    # Api kullanicisi "api/updateSupport/{id}" path parametrelerini olusturur
    * The api user prepares a patch request with "<title>", <department_id> and "<message>" to send to the api updateSupport endpoint.
    # Api kullanicisi api updateSupport endpointine gondermek icin "<title>", <department_id> ve "<message>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


