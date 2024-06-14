Feature: As an administrator, I want to access detailed information about the support resource with the specified ID via an API connection.

  Scenario Outline: When a GET request is sent to the /api/support/{id} endpoint with valid authorization information and the
  correct data (id), it should be verified that the status code returned is 200 and the remark in the response body is "success".
  Also, when a GET request is sent to /api/support/{id} endpoint with valid authorization information and correct data (id),
  the data in the response body (id, user_id, webinar_id, department_id, title, status, created_at, updated_at, status_order, id,
  full_name, role_name) should be verified.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/support/<id>" path parameters.
    # Api kullanicisi "api/support/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user validates the data <data_id>, <user_id>, <department_id>, "<title>", "<status>", <created_at>, <updated_at>, "<status_order>", <userId>, "<full_name>" and "<role_name>" in the response body.
    # Api kullanicisi response bodydeki data <data_id>, <user_id>, <department_id>, "<title>", "<status>", <created_at>, <updated_at>, "<status_order>", <userId>, "<full_name>" ve "<role_name>" içeriklerini doğrular.

    Examples:
      | id | data_id | user_id | department_id | title          | status | created_at | updated_at | status_order | userId | full_name      | role_name |
      | 25 | 25      | 934     | 3             | Convert Videos | close  | 1625891270 | 1625973596 | c            | 934    | Elodie Bennett | teacher   |


  Scenario Outline: When a GET request is sent to the /api/support/{id} endpoint with valid authorization information and a
  non-existing (id), it should be verified that the status code returned is 203 and the remark in the response body is "failed"
  and the message is "There is not support message for this id.".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/support/<id>" path parameters.
    # Api kullanicisi "api/support/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydede
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not support message for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not support message for this id." oldugunu dogrular

    Examples:
      | id    |
      | 85417 |


  Scenario: When a GET request is sent to the /api/support/{id} endpoint without valid authorization information and id, it
  should be verified that the status code returned is 203 and the remark in the response body is "failed" and the message is "No id".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/support" path parameters.
    # Api kullanicisi "api/support/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydede
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When a GET request is sent to the /api/support/{id} endpoint with invalid (student or teacher) authorization
  information and the correct data (id), it should be verified that the status code returned is 203, the remark in the
  response body is "failed" and the message is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/support/<id>" path parameters.
    # Api kullanicisi "api/support/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydede
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | id |
      | 25 |


  Scenario Outline: When sending a GET request to the /api/support/{id} endpoint with invalid token authorization information
  and correct data (id), it should be verified that the status code returned is 401 and the message in the response body is "
  "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/support/<id>" path parameters.
    # Api kullanicisi "api/support/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 25 |
