Feature: As an administrator, I want to update the information of the product FAQ with the specified ID via an API connection.

  Scenario Outline: Verify that when a PATCH request with valid data and the correct (id) is sent, the returned status code is 200,
  the remark field in the response body is "success", and the Message field is "Successfully Updated.". Additionally, confirm that
  the updated Product Faq ID returned in the response body is the same as the id parameter in the /api/updateProductfaq/{id} endpoint,
  ensuring that the intended record has been updated. Finally, validate the update operation by sending a GET request to the
  /api/productfaq/{id} endpoint.

    * The api user sends a POST request to the api "addProductfaq" endpoint to create a new "productFaq" record and records the "Added Product Faq ID" information.
    # Api kullanıcısı api "addProductfaq" endpointine POST isteği göndererek yeni bir "productCategory" kaydı oluşturur ve "Added Product Faq ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateProductfaq" path parameters.
    # Api kullanicisi "api/updateProductfaq/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updateProductfaq endpoint, containing the "<title>", "<answer>" and <product_id> information.
    # Api kullanicisi api updateProductfaq endpointine gondermek icin "<title>", "<answer>" ve <product_id> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * The api user verifies that the "updated Product Faq ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "updated Product Faq ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.translations[0].title" is "What payment methods do you accept for online purchases?" by sending a GET request to the "api" "productfaq" endpoint with the "updated Product Faq ID" returned in the response body.
    # Api kullanicisi response bodyde donen "updated Product Faq ID" ile "api" "productfaq" endpoint'ine GET request göndererek "title" bilgisinin "What payment methods do you accept for online purchases?" oldugunu dogrular

    Examples:
      | title                                                    | answer                                                                                                               | product_id |
      | What payment methods do you accept for online purchases? | We accept major credit cards such as Visa, Mastercard, and American Express, as well as PayPal for online purchases. | 20         |


  Scenario: When a PATCH request without data is sent to the /api/updateProductfaq/{id} endpoint with valid authentication
  credentials and correct (id), verify that the returned status code is 203, the remark field in the response body is "failed",
  and the message field is "There is no information to update."

    * The api user sends a POST request to the api "addProductfaq" endpoint to create a new "productFaq" record and records the "Added Product Faq ID" information.
    # Api kullanıcısı api "addProductfaq" endpointine POST isteği göndererek yeni bir "productCategory" kaydı oluşturur ve "Added Product Faq ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateProductfaq" path parameters.
    # Api kullanicisi "api/updateProductfaq/{id}" path parametrelerini olusturur
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


  Scenario Outline: When a PATCH request is sent to the /api/updateProductfaq/{id} endpoint with valid authentication credentials,
  correct data (title, answer, product_id), and a non-existing (id), verify that the returned status code is 203, the
  remark field in the response body is "failed", and the message field is "There is not product faq for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateProductfaq/<id>" path parameters.
    # Api kullanicisi "api/updateProductfaq/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updateProductfaq endpoint, containing the "<title>", "<answer>" and <product_id> information.
    # Api kullanicisi api updateProductfaq endpointine gondermek icin "<title>", "<answer>" ve <product_id> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not product faq for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not product faq for this id." oldugunu dogrular

    Examples:
      | id   | title                                                    | answer                                                                                                               | product_id |
      | 8417 | What payment methods do you accept for online purchases? | We accept major credit cards such as Visa, Mastercard, and American Express, as well as PayPal for online purchases. | 20         |


  Scenario Outline: When a PATCH request is sent to the /api/updateProductfaq/{id} endpoint with valid authentication credentials,
  but without an (id) and with correct data (title, answer, product_id), verify that the returned status code is 203, the remark
  field in the response body is "failed", and the message field is "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateProductfaq" path parameters.
    # Api kullanicisi "api/updateProductfaq/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updateProductfaq endpoint, containing the "<title>", "<answer>" and <product_id> information.
    # Api kullanicisi api updateProductfaq endpointine gondermek icin "<title>", "<answer>" ve <product_id> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular

    Examples:
      | title                                                    | answer                                                                                                               | product_id |
      | What payment methods do you accept for online purchases? | We accept major credit cards such as Visa, Mastercard, and American Express, as well as PayPal for online purchases. | 20         |


  Scenario Outline: When a PATCH request with invalid (student or teacher) authentication credentials, but with correct (id)
  and data (title, answer, product_id), is sent to the /api/updateProductfaq/{id} endpoint, verify that the returned status code is
  203, the remark field in the response body is "failed", and the message field is "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addProductfaq" endpoint to create a new "productFaq" record and records the "Added Product Faq ID" information.
    # Api kullanıcısı api "addProductfaq" endpointine POST isteği göndererek yeni bir "productCategory" kaydı oluşturur ve "Added Product Faq ID" bilgisini kaydeder.
    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/updateProductfaq" path parameters.
    # Api kullanicisi "api/updateProductfaq/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updateProductfaq endpoint, containing the "<title>", "<answer>" and <product_id> information.
    # Api kullanicisi api updateProductfaq endpointine gondermek icin "<title>", "<answer>" ve <product_id> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


    Examples:
      | title                                                    | answer                                                                                                               | product_id |
      | What payment methods do you accept for online purchases? | We accept major credit cards such as Visa, Mastercard, and American Express, as well as PayPal for online purchases. | 20         |


  Scenario Outline: When a PATCH request with invalid (invalid token) authentication credentials, but with correct (id) and data
  (title, answer, product_id), is sent to the /api/updateProductfaq/{id} endpoint, verify that the returned status code is 401
  and the message field in the response body is "Unauthenticated."

    * The api user sends a POST request to the api "addProductfaq" endpoint to create a new "productFaq" record and records the "Added Product Faq ID" information.
    # Api kullanıcısı api "addProductfaq" endpointine POST isteği göndererek yeni bir "productCategory" kaydı oluşturur ve "Added Product Faq ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/updateProductfaq" path parameters.
    # Api kullanicisi "api/updateProductfaq/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updateProductfaq endpoint, containing the "<title>", "<answer>" and <product_id> information.
    # Api kullanicisi api updateProductfaq endpointine gondermek icin "<title>", "<answer>" ve <product_id> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | title                                                    | answer                                                                                                               | product_id |
      | What payment methods do you accept for online purchases? | We accept major credit cards such as Visa, Mastercard, and American Express, as well as PayPal for online purchases. | 20         |
