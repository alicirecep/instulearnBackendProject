Feature: As an administrator, I want to create a new course price plan record via an API connection.

  Scenario Outline: When a valid POST request with proper authorization and correct data (title, dateRange, discount, capacity,
  webinar_id) is sent to the "/api/addPricePlan" endpoint, it should be verified that the status code is 200, and the response
  body contains the messages "success" and "Successfully Added." To confirm the creation of the record, a GET request should
  be sent to the /api/pricePlan/{id} endpoint using the returned Added Price Plans ID.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addPricePlan" path parameters.
    # Api kullanicisi "api/addPricePlan" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addPricePlan endpoint, containing the information "<title>", "<dateRange>", <discount>, <capacity> and <webinar_id>.
    # Api kullanicisi api addPricePlan endpointine gondermek icin "<title>", "<dateRange>", <discount>, <capacity> ve <webinar_id> bilgisilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "pricePlan" endpoint with the "Added Price Plans ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Added Price Plans ID" ile "api" "pricePlan" endpoint'ine GET request göndererek "remark" bilgisinin "success" oldugunu dogrular

    Examples:
      | title            | dateRange               | discount | capacity | webinar_id |
      | Test Price Plans | 2024-06-01 - 2024-06-30 | 20       | 50       | 2002       |


  Scenario: When a POST request with valid authorization credentials but no data is sent to the /api/addPricePlan endpoint, it
  should be verified that the status code is 422 and the message in the response body is
  "The title field is required. (and 3 more errors)"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addPricePlan" path parameters.
    # Api kullanicisi "api/addPricePlan" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The title field is required. (and 3 more errors)".
    # Api kullanicisi response bodyde dönen message bilgisinin "The title field is required. (and 3 more errors)" oldugunu dogrular


  Scenario Outline: When a POST request with invalid (student or teacher) authorization credentials but with the correct data
  (title, dateRange, discount, capacity, webinar_id) is sent to the /api/addPricePlan endpoint, it should be verified that the
  status code is 203, the remark information in the response body is "failed", and the message information is
  "To access this data, you must log in as admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/addPricePlan" path parameters.
    # Api kullanicisi "api/addPricePlan" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addPricePlan endpoint, containing the information "<title>", "<dateRange>", <discount>, <capacity> and <webinar_id>.
    # Api kullanicisi api addPricePlan endpointine gondermek icin "<title>", "<dateRange>", <discount>, <capacity> ve <webinar_id> bilgisilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as admin." oldugunu dogrular

    Examples:
      | title            | dateRange               | discount | capacity | webinar_id |
      | Test Price Plans | 2024-06-01 - 2024-06-30 | 20       | 50       | 2002       |


  Scenario Outline: When a POST request with invalid (invalid token) authorization credentials but with the correct data
  (title, dateRange, discount, capacity, webinar_id) is sent to the /api/addPricePlan endpoint, it should be verified
  that the status code returned is 401 and the message in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addPricePlan" path parameters.
    # Api kullanicisi "api/addPricePlan" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addPricePlan endpoint, containing the information "<title>", "<dateRange>", <discount>, <capacity> and <webinar_id>.
    # Api kullanicisi api addPricePlan endpointine gondermek icin "<title>", "<dateRange>", <discount>, <capacity> ve <webinar_id> bilgisilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodyde dönen message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | title            | dateRange               | discount | capacity | webinar_id |
      | Test Price Plans | 2024-06-01 - 2024-06-30 | 20       | 50       | 2002       |

