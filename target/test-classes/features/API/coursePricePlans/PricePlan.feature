Feature: As an administrator, I want to access detailed information about the course price plan with the specified ID via an API connection.

  Scenario Outline: When a GET request with valid authorization credentials and the correct (id) is sent to the /api/pricePlan/{id}
  endpoint, it should be verified that the returned status code is 200 and the remark information in the response body is "success".
  Additionally, the accuracy of the data (id, creator_id, webinar_id, bundle_id, start_date, end_date, discount, capacity, order,
  created_at, id, ticket_id, locale, title) in the response body should also be checked.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/pricePlan/<id>" path parameters.
    # Api kullanicisi "api/pricePlan/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies the contents of <data_id>, <creator_id>, <webinar_id>, <start_date>, <end_date>, <discount>, <capacity>, <created_at>, <translations_id>, <ticket_id>, "<locale>" and "<title>" in the response body's data.
    # Api kullanicisi response bodydeki data <data_id>, <creator_id>, <webinar_id>, <start_date>, <end_date>, <discount>, <capacity>, <created_at>, <translations_id>, <ticket_id>, "<locale>" ve "<title>" içeriklerini doğrular.

    Examples:
      | id | data_id | creator_id | webinar_id | start_date | end_date   | discount | capacity | created_at | translations_id | ticket_id | locale | title            |
      | 31 | 31      | 864        | 2003       | 1719792000 | 1722384000 | 25       | 55       | 1625299801 | 4               | 31        | en     | First Price Plan |
      | 28 | 28      | 1015       | 1998       | 1727740800 | 1730246400 | 35       | 20       | 1624965807 | 1               | 28        | en     | Golden Offer     |


  Scenario Outline: When a GET request with valid authorization credentials but an unregistered (id) is sent to the
  /api/pricePlan/{id} endpoint, it should be verified that the status code is 203, the remark information in the response body
  is "failed", and the message information is "There is not ticket for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/pricePlan/<id>" path parameters.
    # Api kullanicisi "api/pricePlan/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not ticket for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not ticket for this id." oldugunu dogrular

    Examples:
      | id   |
      | 5412 |


  Scenario: When a GET request without an (id) but with valid authorization credentials is sent to the /api/pricePlan/{id}
  endpoint, it should be verified that the status code is 203, the remark information in the response body is "failed", and
  the message information is "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/pricePlan" path parameters.
    # Api kullanicisi "api/pricePlan/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When a GET request with invalid (student or teacher) authorization credentials but with the correct data (id)
  is sent to the /api/pricePlan/{id} endpoint, it should be verified that the status code is 203, the remark information in the
  response body is "failed", and the message information is "To access this data, you must log in as admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/pricePlan/<id>" path parameters.
    # Api kullanicisi "api/pricePlan/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as admin." oldugunu dogrular

    Examples:
      | id |
      | 31 |


  Scenario Outline: When a GET request with invalid (invalid token) authorization credentials but with the correct data (id) is sent
  to the /api/pricePlan/{id} endpoint, it should be verified that the status code is 401 and the message in the response body is
  "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/pricePlan/<id>" path parameters.
    # Api kullanicisi "api/pricePlan/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 31 |
