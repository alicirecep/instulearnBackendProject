Feature: As an administrator, I want to delete the product FAQ information with the specified ID via an API connection.

  Scenario: Verify that when a DELETE request is sent with valid authentication credentials and correct (id), the returned status
  code is 200, the remark field in the response body is "success", and the Message field is "Successfully Deleted.". Also, confirm
  that the Deleted Product Faq ID returned in the response body is the same as the id parameter in the /api/deleteProductfaq/{id}
  endpoint, and ensure that the product faq record to be deleted is indeed deleted. Finally, verify the deletion process by sending
  a GET request to the /api/productfaq/{id} endpoint."

    * The api user sends a POST request to the api "addProductfaq" endpoint to create a new "productFaq" record and records the "Added Product Faq ID" information.
    # Api kullanıcısı api "addProductfaq" endpointine POST isteği göndererek yeni bir "productCategory" kaydı oluşturur ve "Added Product Faq ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteProductfaq" path parameters.
    # Api kullanicisi "api/deleteProductfaq/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Product Faq ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Product Faq ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.message" is "There is not product faq for this id." by sending a GET request to the "api" "productfaq" endpoint with the "Deleted Product Faq ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Deleted Product Faq ID" ile "api" "productfaq" endpoint'ine GET request göndererek "message" bilgisinin "There is not product faq for this id." oldugunu dogrular


  Scenario Outline: Verify that when a DELETE request is sent with valid authentication credentials and a non-existent (id),
  the returned status code is 203, the remark field in the response body is "failed", and the message field is
  "There is not product faq for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteProductfaq/<id>" path parameters.
    # Api kullanicisi "api/deleteProductfaq/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not product faq for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not product faq for this id." oldugunu dogrular

    Examples:
      | id    |
      | 65417 |


  Scenario: Verify that when a DELETE request is sent with valid authentication credentials and without an (id), the returned
  status code is 203, the remark field in the response body is "failed", and the message field is "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteProductfaq" path parameters.
    # Api kullanicisi "api/deleteProductfaq/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario: Verify that when a DELETE request is sent with invalid (student or teacher) authentication credentials and a correct (id),
  the returned status code is 203, the remark field in the response body is "failed", and the message field is
  "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addProductfaq" endpoint to create a new "productFaq" record and records the "Added Product Faq ID" information.
    # Api kullanıcısı api "addProductfaq" endpointine POST isteği göndererek yeni bir "productCategory" kaydı oluşturur ve "Added Product Faq ID" bilgisini kaydeder.
    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/deleteProductfaq" path parameters.
    # Api kullanicisi "api/deleteProductfaq/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario: Verify that when a DELETE request is sent with invalid (invalid token) authentication credentials and a correct (id),
  the returned status code is 401, and the message field in the response body is "Unauthenticated."

    * The api user sends a POST request to the api "addProductfaq" endpoint to create a new "productFaq" record and records the "Added Product Faq ID" information.
    # Api kullanıcısı api "addProductfaq" endpointine POST isteği göndererek yeni bir "productCategory" kaydı oluşturur ve "Added Product Faq ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteProductfaq" path parameters.
    # Api kullanicisi "api/deleteProductfaq/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


