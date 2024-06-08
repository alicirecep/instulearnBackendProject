Feature: As an administrator, I want to create a new product category record via an API connection.

  Scenario Outline: When a valid authorization and correct data (title) are sent in the POST body to the /Api/addProductCategory
  endpoint, the expected outcomes are: a status code of 200, a "success" remark in the response body, and a "Successfully Added."
  message in the Message field. It should be confirmed by sending a GET request to the /api/productCategory/{id} endpoint with
  the Added Category ID returned in the response, verifying that the record is created.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addProductCategory" path parameters.
    # Api kullanicisi "api/addProductCategory" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<title>" information to send to the api addProductCategory endpoint.
    # Api kullanicisi api addProductCategory endpointine gondermek icin "<title>" bilgisini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "productCategory" endpoint with the "Added Category ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Added Category ID" ile "api" "productCategory" endpoint'ine GET request göndererek "remark" bilgisinin "success" oldugunu dogrular

    Examples:
      | title                 |
      | Educational Equipment |


  Scenario: When a POST request with valid authentication credentials but no data is sent to the /api/addProductCategory endpoint,
  verify that the status code returned is 422, and the message in the response body is "The title field is required."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addProductCategory" path parameters.
    # Api kullanicisi "api/addProductCategory" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The title field is required.".
    # Api kullanicisi response bodyde dönen message bilgisinin "The title field is required." oldugunu dogrular


  Scenario Outline: When a POST request with invalid (student or teacher) authentication credentials but correct data (title)
  is sent to the /api/addProductCategory endpoint, verify that the returned status code is 203, the remark in the response body
  is "failed", and the message is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/addProductCategory" path parameters.
    # Api kullanicisi "api/addProductCategory" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<title>" information to send to the api addProductCategory endpoint.
    # Api kullanicisi api addProductCategory endpointine gondermek icin "<title>" bilgisini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


    Examples:
      | title                 |
      | Educational Equipment |


  Scenario Outline: When a POST request with invalid (invalid token) authentication credentials but correct data (title) is sent
  to the /api/addProductCategory endpoint, verify that the returned status code is 401, and the message in the response body is
  "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addProductCategory" path parameters.
    # Api kullanicisi "api/addProductCategory" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<title>" information to send to the api addProductCategory endpoint.
    # Api kullanicisi api addProductCategory endpointine gondermek icin "<title>" bilgisini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodyde dönen message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | title                 |
      | Educational Equipment |




