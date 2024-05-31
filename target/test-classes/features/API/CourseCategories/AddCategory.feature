Feature: As an administrator, I want to create a new course category record via an API connection.

  Scenario Outline: When a POST request is sent to the /api/addCategory endpoint with valid authorization credentials and
  correct data (title), it should be verified that the status code returned is 200 and the remark field in the response body is
  "success" and the Message field is "Successfully Added."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addCategory" path parameters.
    # Api kullanicisi "api/addCategory" path parametrelerini olusturur
    * The api user prepares a POST request to send to the API addCategory endpoint containing the "<title>" information.
    # Api kullanicisi api addCategory endpointine gondermek icin "<title>" bilgisini iceren bir post request hazirlar
    * The api user sends a "POST" request body and saves the returned response.
    # Api kullanicisi POST request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular

    Examples:
      | title            |
      | Online Education |


  Scenario: When a POST request with valid authorization credentials but no data in the body is sent to the /api/addCategory
  endpoint, it should be verified that the status code returned is 422 and the message field in the response body is
  "The title field is required."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addCategory" path parameters.
    # Api kullanicisi "api/addCategory" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a "POST" request body and saves the returned response.
    # Api kullanicisi POST request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The title field is required.".
    # Api kullanicisi response bodyde dönen message bilgisinin "The title field is required." oldugunu dogrular


  Scenario Outline: When a POST request with invalid (student or teacher) authorization credentials and correct data (title)
  is sent to the /api/addCategory endpoint, it should be verified that the status code returned is 203 and the remark field in
  the response body is "failed" and the message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/addCategory" path parameters.
    # Api kullanicisi "api/addCategory" path parametrelerini olusturur
    * The api user prepares a POST request to send to the API addCategory endpoint containing the "<title>" information.
    # Api kullanicisi api addCategory endpointine gondermek icin "<title>" bilgisini iceren bir post request hazirlar
    * The api user sends a "POST" request body and saves the returned response.
    # Api kullanicisi POST request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | title            |
      | Online Education |


  Scenario Outline: When a POST request with invalid (invalid token) authorization credentials and correct data (title) is sent
  to the /api/addCategory endpoint, it should be verified that the status code returned is 401 and the message field in the
  response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addCategory" path parameters.
    # Api kullanicisi "api/addCategory" path parametrelerini olusturur
    * The api user prepares a POST request to send to the API addCategory endpoint containing the "<title>" information.
    # Api kullanicisi api addCategory endpointine gondermek icin "<title>" bilgisini iceren bir post request hazirlar
    * The api user sends a "POST" request body and saves the returned response.
    # Api kullanicisi POST request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodyde dönen message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | title            |
      | Online Education |


  Scenario Outline: The creation of a new course category record via the API should be verified. This can be achieved by sending a
  GET request to the /api/category/{id} endpoint using the Added Category ID value obtained from the response body to confirm
  that the record has been created.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/category/<id>" path parameters.
    # Api kullanicisi "api/category/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular

    Examples:
      | id  |
      | 637 |

