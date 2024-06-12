Feature: As an administrator, I want to access detailed information about the support department with the specified ID via an API connection.

  Scenario Outline: When a GET request is sent to the /api/department/{id} endpoint with valid authorization information and
  the correct data (id), it is verified that the status code returned is 200 and the remark field in the response body is "success",
  and that the data in the response body (id, created_at, title, id, support_department_id, locale, title) is correct.”

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/department/<id>" path parameters.
    # Api kullanicisi "api/department/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user validates the data <data_id>, <created_at>, <translations_id>, <support_department_id>, "<locale>" and "<title>" in the response body.
    # Api kullanicisi response bodydeki data <data_id>, <created_at>, <translations_id>, <support_department_id>, "<locale>" ve "<title>" içeriklerini doğrular.

    Examples:
      | id | data_id | created_at | translations_id | support_department_id | locale | title            |
      | 12 | 12      | 1715869854 | 14              | 12                    | en     | Technical Office |


  Scenario Outline: When a GET request is sent to the /api/department/{id} endpoint with valid authorization information and an
  (id) with no registration, it is verified that the status code returned is 203, the remark field in the response body is "failed"
  and the message field is "There is not support department for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/department/<id>" path parameters.
    # Api kullanicisi "api/department/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not support department for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not support department for this id." oldugunu dogrular

    Examples:
      | id   |
      | 5241 |


  Scenario: When a GET request without valid authorization information (id) is sent to the /api/department/{id} endpoint,
  it is verified that the status code returned is 203, the remark field in the response body is "failed" and the message
  field is "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/department" path parameters.
    # Api kullanicisi "api/department/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When a GET request with invalid (student or teacher) authorization information and correct data (id) is sent to
  the /api/department/{id} endpoint, it is verified that the status code returned is 203, the remark field in the response body is
  "failed" and the message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/department/<id>" path parameters.
    # Api kullanicisi "api/department/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | id |
      | 12 |


  Scenario Outline: When a GET request with invalid token authorization information and correct data (id) is sent to the
  /api/department/{id} endpoint, it is verified that the status code returned is 401 and the message field in the response
  body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/department/<id>" path parameters.
    # Api kullanicisi "api/department/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 12 |

