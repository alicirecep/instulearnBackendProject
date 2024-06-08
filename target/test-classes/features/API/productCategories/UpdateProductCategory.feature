Feature: As an administrator, I want to update the information of the product category with the specified ID via an API connection.

  Scenario Outline: When a PATCH request is sent with valid authentication credentials, correct id, and title information,
  verify that the returned status code is 200, the remark in the response body is "success", and the Message in the response body
  is "Successfully Updated." Additionally, ensure that the Updated Category Id in the response body is the same as the id parameter
  in the /api/updateProductCategory/{id} endpoint. Finally, to validate this update via the API, send a GET request to the
  /api/productCategory/{id} endpoint to confirm that the record has been updated.

    * The api user sends a POST request to the api "addProductCategory" endpoint to create a new "productCategory" record and records the "Added Category ID" information.
    # Api kullanıcısı api "addProductCategory" endpointine POST isteği göndererek yeni bir "productCategory" kaydı oluşturur ve "Added Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateProductCategory" path parameters.
    # Api kullanicisi "api/updateProductCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateProductCategory endpoint.
    # Api kullanicisi api updateProductCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * The api user verifies that the "Updated Category Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Updated Product ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.translations[0].title" is "Education and Training" by sending a GET request to the "api" "productCategory" endpoint with the "Updated Category Id" returned in the response body.
    # Api kullanicisi response bodyde donen "Updated Category Id" ile "api" "productCategory" endpoint'ine GET request göndererek "title" bilgisinin "Education and Training" oldugunu dogrular

    Examples:
      | title                  |
      | Education and Training |


  Scenario: When a PATCH request with valid credentials and correct ID but no data is sent to the
  /api/updateProductCategory/{id} endpoint, confirm that the returned status code is 203, the remark in the response body is "failed,
  and the message is "There is no information to update."

    * The api user sends a POST request to the api "addProductCategory" endpoint to create a new "productCategory" record and records the "Added Category ID" information.
    # Api kullanıcısı api "addProductCategory" endpointine POST isteği göndererek yeni bir "productCategory" kaydı oluşturur ve "Added Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateProductCategory" path parameters.
    # Api kullanicisi "api/updateProductCategory/{id}" path parametrelerini olusturur
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


  Scenario Outline: When a PATCH request with valid credentials, a non-existing (id), and correct data (title) is sent to the
  /api/updateProductCategory/{id} endpoint, confirm that the returned status code is 203, the remark in the response body is
  "failed", and the message is "There is not product category for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateProductCategory/<id>" path parameters.
    # Api kullanicisi "api/updateProductCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateProductCategory endpoint.
    # Api kullanicisi api updateProductCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not product category for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not product category for this id." oldugunu dogrular

    Examples:
      | id    | title                  |
      | 52145 | Education and Training |


  Scenario Outline: When a PATCH request with valid credentials, but without (id) and containing correct data (title) is sent to the
  /api/updateProductCategory/{id} endpoint, confirm that the returned status code is 203, the remark in the response body is
  "failed", and the message is "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateProductCategory" path parameters.
    # Api kullanicisi "api/updateProductCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateProductCategory endpoint.
    # Api kullanicisi api updateProductCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular

    Examples:
      | title                  |
      | Education and Training |


  Scenario Outline: When a PATCH request with invalid (student or teacher) authentication credentials, but with correct (id) and
  correct data (title) is sent to the /api/updateProductCategory/{id} endpoint, confirm that the returned status code is 203,
  the remark in the response body is "failed", and the message is "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addProductCategory" endpoint to create a new "productCategory" record and records the "Added Category ID" information.
    # Api kullanıcısı api "addProductCategory" endpointine POST isteği göndererek yeni bir "productCategory" kaydı oluşturur ve "Added Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/updateProductCategory" path parameters.
    # Api kullanicisi "api/updateProductCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateProductCategory endpoint.
    # Api kullanicisi api updateProductCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | title                  |
      | Education and Training |


  Scenario Outline: When a PATCH request with invalid (invalid token) authentication credentials, but with correct (id) and
  correct data (title) is sent to the /api/updateProductCategory/{id} endpoint, confirm that the returned status code is 401,
  and the message in the response body is "Unauthenticated."

    * The api user sends a POST request to the api "addProductCategory" endpoint to create a new "productCategory" record and records the "Added Category ID" information.
    # Api kullanıcısı api "addProductCategory" endpointine POST isteği göndererek yeni bir "productCategory" kaydı oluşturur ve "Added Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/updateProductCategory" path parameters.
    # Api kullanicisi "api/updateProductCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateProductCategory endpoint.
    # Api kullanicisi api updateProductCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | title                  |
      | Education and Training |



