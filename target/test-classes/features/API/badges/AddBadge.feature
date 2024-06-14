Feature: As an administrator, I want to create a new badge record via an API connection.

  Scenario Outline: Verify that when a POST body with valid authorization credentials and correct data (title, description,
  type, from, to, score) is sent to the /api/addBadge endpoint, the returned status code is 200. Ensure that the remark field
  in the response body is "success" and the Message field is "Successfully Added." Additionally, to verify the newly created
  badge record through the API, use the Added Badge ID returned in the response body to send a GET request to the /api/badge/{id}
  endpoint and confirm that the record has been created.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addBadge" path parameters.
    # Api kullanicisi "api/addBadge" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addBadge endpoint with the following information "<title>", "<description>", "<type>", <from>, <to> and <score>.
    # Api kullanicisi api addBadge endpointine gondermek icin "<title>", "<description>", "<type>", <from>, <to> ve <score> bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "badge" endpoint with the "Added Badge ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Added Badge ID" ile "api" "badge" endpoint'ine GET request göndererek "remark" bilgisinin "success" oldugunu dogrular

    Examples:
      | title      | description           | type         | from | to | score |
      | Test Badge | Test Badge Descriptio | course_count | 25   | 50 | 50    |


  Scenario Outline: Verify that when a POST body with valid authorization credentials and an invalid type is sent to the
  /api/addBadge endpoint including (title, description, type, from, to, score), the returned status code is 422. Confirm that the
  message field in the response body states "The selected type is invalid."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addBadge" path parameters.
    # Api kullanicisi "api/addBadge" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addBadge endpoint with the following information "<title>", "<description>", "<type>", <from>, <to> and <score>.
    # Api kullanicisi api addBadge endpointine gondermek icin "<title>", "<description>", "<type>", <from>, <to> ve <score> bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The selected type is invalid.".
    # Api kullanicisi response bodydeki message bilgisinin "The selected type is invalid." oldugunu dogrular

    Examples:
      | title      | description           | type | from | to | score |
      | Test Badge | Test Badge Descriptio | xyz  | 25   | 50 | 50    |


  Scenario: Verify that when a POST request without data and with valid authorization credentials is sent to the /api/addBadge
  endpoint, the returned status code is 422. Confirm that the message field in the response body states
  "The title field is required. (and 4 more errors)"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addBadge" path parameters.
    # Api kullanicisi "api/addBadge" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The title field is required. (and 4 more errors)".
    # Api kullanicisi response bodyde dönen message bilgisinin "The title field is required. (and 4 more errors)" oldugunu dogrular


  Scenario Outline: Verify that when a POST body with valid data (title, description, type, from, to, score) and invalid
  (student or teacher) authorization credentials is sent to the /api/addBadge endpoint, the returned status code is 203.
  Confirm that the remark field in the response body is "failed" and the message field states
  "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/addBadge" path parameters.
    # Api kullanicisi "api/addBadge" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addBadge endpoint with the following information "<title>", "<description>", "<type>", <from>, <to> and <score>.
    # Api kullanicisi api addBadge endpointine gondermek icin "<title>", "<description>", "<type>", <from>, <to> ve <score> bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | title      | description           | type         | from | to | score |
      | Test Badge | Test Badge Descriptio | course_count | 25   | 50 | 50    |


  Scenario Outline: Verify that when a POST request with invalid (invalid token) authorization credentials and correct data
  (title, description, type, from, to, score) is sent to the /api/addBadge endpoint, the returned status code is 401.
  Confirm that the message field in the response body states "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addBadge" path parameters.
    # Api kullanicisi "api/addBadge" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addBadge endpoint with the following information "<title>", "<description>", "<type>", <from>, <to> and <score>.
    # Api kullanicisi api addBadge endpointine gondermek icin "<title>", "<description>", "<type>", <from>, <to> ve <score> bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodyde dönen message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | title      | description           | type         | from | to | score |
      | Test Badge | Test Badge Descriptio | course_count | 25   | 50 | 50    |

