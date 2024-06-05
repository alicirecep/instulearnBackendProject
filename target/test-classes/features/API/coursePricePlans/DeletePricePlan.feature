Feature: As an administrator, I want to delete the course price plan information with the specified ID via an API connection.

  Scenario Outline: When a DELETE request with valid authorization credentials and the correct (id) is sent to the
  /api/deletePricePlan/{id} endpoint, it should be verified that the returned status code is 200, the remark information in
  the response body is "success", and the Message information is "Successfully Deleted." Additionally, it should be confirmed
  that the Deleted Price Plan Id in the response body matches the id in the path parameter.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deletePricePlan/<id>" path parameters.
    # Api kullanicisi "api/deletePricePlan/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Price Plan Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Price Plan Id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular

    Examples:
      | id |
      | 98 |


  Scenario Outline: When a DELETE request with valid authorization credentials and an invalid (id) is sent to the
  /api/deletePricePlan/{id} endpoint, it should be verified that the status code is 203, the remark information in the response body
  is "failed", and the message information is "There is not ticket for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deletePricePlan/<id>" path parameters.
    # Api kullanicisi "api/deletePricePlan/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not ticket for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not ticket for this id." oldugunu dogrular

    Examples:
      | id    |
      | 10241 |


  Scenario: When a DELETE request with valid authorization credentials and no (id) is sent to the /api/deletePricePlan/{id} endpoint,
  it should be verified that the status code is 203, the remark information in the response body is "failed", and the message
  information is "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deletePricePlan" path parameters.
    # Api kullanicisi "api/deletePricePlan/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When a DELETE request with invalid (student or teacher) authorization credentials and the correct (id) is sent to
  the /api/deletePricePlan/{id} endpoint, it should be verified that the status code is 203, the remark information in the
  response body is "failed", and the message information is "To access this data, you must log in as admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/deletePricePlan/<id>" path parameters.
    # Api kullanicisi "api/deletePricePlan/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as admin." oldugunu dogrular

    Examples:
      | id |
      | 98 |


  Scenario Outline: When a DELETE request with invalid (invalid token) authorization credentials and the correct (id) is sent to the
  /api/deletePricePlan/{id} endpoint, it should be verified that the status code is 401 and the message information in the response
  body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deletePricePlan/<id>" path parameters.
    # Api kullanicisi "api/deletePricePlan/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 98 |


  Scenario Outline: The deletion of the course price plan record via the API should be confirmed by sending a GET request to the
  /api/pricePlan/{id} endpoint using the Deleted Price Plan Id from the response body.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/pricePlan/<id>" path parameters.
    # Api kullanicisi "api/pricePlan/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not ticket for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not ticket for this id." oldugunu dogrular

    Examples:
      | id |
      | 98 |

