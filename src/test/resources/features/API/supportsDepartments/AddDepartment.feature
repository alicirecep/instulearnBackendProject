Feature: As an administrator, I want to create a new support department record via an API connection.

  Scenario Outline: When a POST request with valid authorization information and correct data (title) is sent to the
  /api/addDepartment endpoint, the status code returned is 200, the remark field in the response body is "success" and the
  Message field is "Successfully Added.", and a GET request is sent to the /api/department/{id} endpoint with the returned
  Added Support Department ID to verify that the record was created.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addDepartment" path parameters.
    # Api kullanicisi "api/addDepartment" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<title>" information to send to the addDepartment endpoint.
    # Api kullanicisi api addDepartment endpointine gondermek icin "<title>" bilgisini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "department" endpoint with the "Added Support Department ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Added Support Department ID" ile "api" "department" endpoint'ine GET request göndererek "remark" bilgisinin "success" oldugunu dogrular

    Examples:
      | title            |
      | Technical Office |


  Scenario: When a POST request without data is sent to the /api/addDepartment endpoint with valid authentication credentials,
  the returned status code of 422 and the message field in the response body are verified to be "The title field is required."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addDepartment" path parameters.
    # Api kullanicisi "api/addDepartment" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The title field is required.".
    # Api kullanicisi response bodyde dönen message bilgisinin "The title field is required." oldugunu dogrular


  Scenario Outline: When a POST request containing correct data (title) is sent to the /api/addDepartment endpoint with invalid
  (student or teacher) authorization credentials, the returned status code is verified to be 203. Additionally, the remark field
  in the response body is "failed", and the message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/addDepartment" path parameters.
    # Api kullanicisi "api/addDepartment" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<title>" information to send to the addDepartment endpoint.
    # Api kullanicisi api addDepartment endpointine gondermek icin "<title>" bilgisini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | title            |
      | Technical Office |


  Scenario Outline: When a POST request containing correct data (title) is sent to the /api/addDepartment endpoint with invalid
  authorization credentials (invalid token), the returned status code is verified to be 401. Furthermore, the message field in
  the response body is confirmed to be "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addDepartment" path parameters.
    # Api kullanicisi "api/addDepartment" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<title>" information to send to the addDepartment endpoint.
    # Api kullanicisi api addDepartment endpointine gondermek icin "<title>" bilgisini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodyde dönen message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | title            |
      | Technical Office |


