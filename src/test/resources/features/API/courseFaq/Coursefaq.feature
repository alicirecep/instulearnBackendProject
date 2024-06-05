Feature: As an administrator, I want to access detailed information about the course FAQ with the specified ID via an API connection.

  Scenario Outline: When a GET request with valid authorization credentials and correct data (id) is sent to the /api/coursefaq/{id}
  endpoint, it should be verified that the status code is 200 and the remark information in the response body is "success".
  Additionally, when a GET request with valid authorization credentials and correct data (id) is sent to the /api/coursefaq/{id}
  endpoint, it should be confirmed that the data in the response body (id, creator_id, webinar_id, bundle_id, upcoming_course_id,
  order, created_at, updated_at, id, faq_id, locale, title, answer) is correct."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coursefaq/<id>" path parameters.
    # Api kullanicisi "api/coursefaq/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies the contents of <data_id>, <creator_id>, <webinar_id>, <created_at>, <updated_at>, <translations_id>, <faq_id>, "<locale>", "<title>", and "<answer>" in the response body's data.
    # Api kullanicisi response bodydeki data <data_id>, <creator_id>, <webinar_id>, <created_at>, <updated_at>, <translations_id>, <faq_id>, "<locale>", "<title>" ve "<answer>" içeriklerini doğrular.

    Examples:
      | id | data_id | creator_id | webinar_id | created_at | updated_at | translations_id | faq_id | locale | title  | answer                     |
      | 14 | 14      | 1016       | 1995       | 1624908812 | 1711967802 | 2               | 14     | en     | course | project management process |


  Scenario Outline: When a GET request with valid authorization credentials and a non-existent (id) is sent to the /api/coursefaq/{id}
  endpoint, it should be verified that the returned status code is 203, the remark information in the response body is "failed", and the
  message information is "There is not course faq for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coursefaq/<id>" path parameters.
    # Api kullanicisi "api/coursefaq/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not course faq for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not course faq for this id." oldugunu dogrular

    Examples:
      | id   |
      | 2415 |


  Scenario: When a GET request without (id) and with valid authorization credentials is sent to the /api/coursefaq/{id}
  endpoint, it should be verified that the returned status code is 203, the remark information in the response body is "failed",
  and the message information is "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coursefaq" path parameters.
    # Api kullanicisi "api/coursefaq/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When a GET request with invalid (student or teacher) authorization credentials and correct data (id) is sent to the
  /api/coursefaq/{id} endpoint, it should be verified that the returned status code is 203, the remark information in the response body
  is "failed", and the message information is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/coursefaq/<id>" path parameters.
    # Api kullanicisi "api/coursefaq/{id}" path parametrelerini olusturur
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
      | 14 |


  Scenario Outline: When a GET request with invalid (invalid token) authorization credentials and correct data (id) is sent to the
  /api/coursefaq/{id} endpoint, it should be verified that the returned status code is 401, and the message information in the response
  is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/coursefaq/<id>" path parameters.
    # Api kullanicisi "api/coursefaq/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 14 |



