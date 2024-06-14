Feature: As an administrator, I want to create a new support record via an API connection.

  Scenario Outline: When a POST request is sent with valid authorization information and correct data (title, department_id,
  message), the status code returned is 200, the remark field in the response body is "success" and the Message field is "
  Successfully Added." and a GET request is sent to the /api/support/{id} endpoint with the returned Added Support ID
  to verify the support record created.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addSupport" path parameters.
    # Api kullanicisi "api/addSupport" path parametrelerini olusturur
    * The api user prepares a post request with "<title>", <department_id> and "<message>" to send to the api addSupport endpoint
    # Api kullanicisi api addSupport endpointine gondermek icin "<title>", <department_id> ve "<message>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "support" endpoint with the "Added Support ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Added Support ID" ile "api" "support" endpoint'ine GET request göndererek "remark" bilgisinin "success" oldugunu dogrular

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


  Scenario: When a POST request is sent to /api/addSupport endpoint with valid authorization information and data, it should be
  verified that the status code returned is 422 and the message information in the response body is
  "The title field is required. (and 2 more errors)"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addSupport" path parameters.
    # Api kullanicisi "api/addSupport" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The title field is required. (and 2 more errors)".
    # Api kullanicisi response bodyde dönen message bilgisinin "The title field is required. (and 2 more errors)" oldugunu dogrular


  Scenario Outline: When a POST body containing correct data (title, department_id, message) with invalid (student or teacher)
  authorization information is sent to /api/addSupport endpoint, it should be verified that the status code returned is 203,
  the remark in the response body is "failed" and the message is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/addSupport" path parameters.
    # Api kullanicisi "api/addSupport" path parametrelerini olusturur
    * The api user prepares a post request with "<title>", <department_id> and "<message>" to send to the api addSupport endpoint
    # Api kullanicisi api addSupport endpointine gondermek icin "<title>", <department_id> ve "<message>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


  Scenario Outline: When sending a POST body with invalid authorization information (invalid token) and correct data (title,
  department_id, message) to /api/addSupport endpoint, it should be verified that the status code returned is 401 and the
  message information in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addSupport" path parameters.
    # Api kullanicisi "api/addSupport" path parametrelerini olusturur
    * The api user prepares a post request with "<title>", <department_id> and "<message>" to send to the api addSupport endpoint
    # Api kullanicisi api addSupport endpointine gondermek icin "<title>", <department_id> ve "<message>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodyde dönen message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | title                              | department_id | message                                                    |
      | Cancelled order not been refunded. | 2             | The purchase price I canceled has still not been refunded. |


