Feature: As an administrator, I want to access course price plans via an API connection.

  Scenario Outline: When a GET request with valid authorization credentials is sent to the /api/pricePlans endpoint, it should be
  verified that the status code is 200 and the remark information in the response body is "success". Additionally, the details of
  the price plan with id(x) (creator_id, webinar_id, bundle_id, start_date, end_date, discount, capacity, order, created_at, id,
  ticket_id, locale, title) should be verified.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/pricePlans" path parameters.
    # Api kullanicisi "api/pricePlans" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the information for the entry at the specified <dataIndex> in the response body includes <creator_id>, <webinar_id>, <start_date>, <end_date>, <discount>, <created_at>, <id>, <ticket_id>, "<locale>" and "<title>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin <creator_id>, <webinar_id>, <start_date>, <end_date>, <discount>, <created_at>, <id>, <ticket_id>, "<locale>" ve "<title>" bilgilerini doğrular.

    Examples:
      | dataIndex | creator_id | webinar_id | start_date | end_date   | discount | created_at | id | ticket_id | locale | title    |
      | 2         | 1092       | 2041       | 1714953600 | 1715126400 | 50       | 1714738592 | 28 | 41        | en     | discount |


  Scenario: When a GET request with invalid (student or teacher) authorization credentials is sent to the /api/pricePlans endpoint,
  it should be verified that the status code is 203, the remark information in the response body is "failed", and the message
  information is "To access this data, you must log in as admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/pricePlans" path parameters.
    # Api kullanicisi "api/pricePlans" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as admin." oldugunu dogrular


  Scenario: When sending a GET request to the /api/pricePlans endpoint with an invalid token, it should be verified that the
  status code is 401 and the message in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/pricePlans" path parameters.
    # Api kullanicisi "api/pricePlans" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular




