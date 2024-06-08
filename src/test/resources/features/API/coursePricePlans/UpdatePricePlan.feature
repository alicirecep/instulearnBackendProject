Feature: As an administrator, I want to update the information of the course price plan with the specified ID via an API connection.

  Scenario Outline: When a PATCH request with valid authorization and correct data is sent to the /api/updatePricePlan/{id} endpoint,
  it should be verified that the status code is 200 and the response body contains the messages "success" and
  "Successfully Updated." Additionally, it should be checked that the returned Updated Price Plans ID matches the id path
  parameter specified in the /api/updatePricePlan/{id} endpoint. This confirms that the course price plan record intended
  to be updated has been successfully updated via the API.

    * The api user sends a POST request to the api "addPricePlan" endpoint to create a new "pricePlan" record and records the "Added Price Plans ID" information.
    # Api kullanıcısı api "addPricePlan" endpointine POST isteği göndererek yeni bir "pricePlan" kaydı oluşturur ve "Added Price Plans ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updatePricePlan" path parameters.
    # Api kullanicisi "api/updatePricePlan/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updatePricePlan endpoint, containing the information "<title>", "<dateRange>", <discount>, <capacity> and <webinar_id>.
    # Api kullanicisi api updatePricePlan endpointine gondermek icin "<title>", "<dateRange>", <discount>, <capacity> ve <webinar_id> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * The api user verifies that the "Updated Price Plans ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Updated Price Plans ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.translations[0].title" is "Price Plans" by sending a GET request to the "api" "pricePlan" endpoint with the "Updated Price Plans ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Updated Price Plans ID" ile "api" "pricePlan" endpoint'ine GET request göndererek "title" bilgisinin "Price Plans" oldugunu dogrular

    Examples:
      | title       | dateRange               | discount | capacity | webinar_id |
      | Price Plans | 2024-06-01 - 2024-06-30 | 30       | 100      | 2004       |


  Scenario: When a valid PATCH request with authorization credentials and an empty id parameter is sent to the
  /api/updatePricePlan/{id} endpoint, it should return a status code of 203. The remark information in the response body
  should be "failed", and the message information should be "There is no information to update."

    * The api user sends a POST request to the api "addPricePlan" endpoint to create a new "pricePlan" record and records the "Added Price Plans ID" information.
    # Api kullanıcısı api "addPricePlan" endpointine POST isteği göndererek yeni bir "pricePlan" kaydı oluşturur ve "Added Price Plans ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updatePricePlan" path parameters.
    # Api kullanicisi "api/updatePricePlan/{id}" path parametrelerini olusturur
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


  Scenario Outline: When a PATCH request with valid authorization credentials, a non-existing (id), and correct data is sent to the
  /api/updatePricePlan/{id} endpoint, it should return a status code of 203. The remark information in the response body should be
  "failed", and the message information should be "There is not ticket for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updatePricePlan/<id>" path parameters.
    # Api kullanicisi "api/updatePricePlan/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updatePricePlan endpoint, containing the information "<title>", "<dateRange>", <discount>, <capacity> and <webinar_id>.
    # Api kullanicisi api updatePricePlan endpointine gondermek icin "<title>", "<dateRange>", <discount>, <capacity> ve <webinar_id> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not ticket for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not ticket for this id." oldugunu dogrular

    Examples:
      | id   | title       | dateRange               | discount | capacity | webinar_id |
      | 2545 | Price Plans | 2024-06-01 - 2024-06-30 | 30       | 100      | 2004       |


  Scenario Outline: When a PATCH request with valid authorization credentials, no (id), and correct data is sent to the
  /api/updatePricePlan/{id} endpoint, it should return a status code of 203. The remark information in the response body
  should be "failed", and the message information should be "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updatePricePlan" path parameters.
    # Api kullanicisi "api/updatePricePlan/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updatePricePlan endpoint, containing the information "<title>", "<dateRange>", <discount>, <capacity> and <webinar_id>.
    # Api kullanicisi api updatePricePlan endpointine gondermek icin "<title>", "<dateRange>", <discount>, <capacity> ve <webinar_id> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular

    Examples:
      | title       | dateRange               | discount | capacity | webinar_id |
      | Price Plans | 2024-06-01 - 2024-06-30 | 30       | 100      | 2004       |


  Scenario Outline: When a PATCH request with invalid (student or teacher) authorization credentials, correct (id), and correct data
  is sent to the /api/updatePricePlan/{id} endpoint, it should return a status code of 203. The remark information in the
  response body should be "failed", and the message information should be "To access this data, you must log in as admin."

    * The api user sends a POST request to the api "addPricePlan" endpoint to create a new "pricePlan" record and records the "Added Price Plans ID" information.
    # Api kullanıcısı api "addPricePlan" endpointine POST isteği göndererek yeni bir "pricePlan" kaydı oluşturur ve "Added Price Plans ID" bilgisini kaydeder.
    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/updatePricePlan" path parameters.
    # Api kullanicisi "api/updatePricePlan/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updatePricePlan endpoint, containing the information "<title>", "<dateRange>", <discount>, <capacity> and <webinar_id>.
    # Api kullanicisi api updatePricePlan endpointine gondermek icin "<title>", "<dateRange>", <discount>, <capacity> ve <webinar_id> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as admin." oldugunu dogrular

    Examples:
      | title       | dateRange               | discount | capacity | webinar_id |
      | Price Plans | 2024-06-01 - 2024-06-30 | 30       | 100      | 2004       |


  Scenario Outline: When a PATCH request with invalid (invalid token) authorization credentials, correct (id), and correct data is
  sent to the /api/updatePricePlan/{id} endpoint, it should return a status code of 401. The message information in the response
  body should be verified as "Unauthenticated."

    * The api user sends a POST request to the api "addPricePlan" endpoint to create a new "pricePlan" record and records the "Added Price Plans ID" information.
    # Api kullanıcısı api "addPricePlan" endpointine POST isteği göndererek yeni bir "pricePlan" kaydı oluşturur ve "Added Price Plans ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/updatePricePlan" path parameters.
    # Api kullanicisi "api/updatePricePlan/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updatePricePlan endpoint, containing the information "<title>", "<dateRange>", <discount>, <capacity> and <webinar_id>.
    # Api kullanicisi api updatePricePlan endpointine gondermek icin "<title>", "<dateRange>", <discount>, <capacity> ve <webinar_id> bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | title       | dateRange               | discount | capacity | webinar_id |
      | Price Plans | 2024-06-01 - 2024-06-30 | 30       | 100      | 2004       |

