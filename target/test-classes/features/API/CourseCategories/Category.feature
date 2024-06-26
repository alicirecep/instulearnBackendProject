Feature: As an administrator, I want to access detailed information about the course category with the specified ID via an API connection.

  Scenario Outline: When a GET request is sent to the /api/category/{id} endpoint with valid authorization credentials and
  correct data (id), it should return a 200 status code. Additionally, the remark field in the response body should be
  "success". Furthermore, the id, slug, parent_id, icon, order, title, id, category_id, locale, and title data in the
  response body should be verified for accuracy.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/category/<id>" path parameters.
    # Api kullanicisi "api/category/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the data in the response body includes <data_id>, "<slug>", "<icon>", <order>, <translations_id>, <category_id>, "<locale>" and "<title>".
    # Api kullanicisi response bodydeki data <data_id>, "<slug>", "<icon>", <order>, <translations_id>, <category_id>, "<locale>" ve "<title>" içeriklerini doğrular.

    Examples:
      | id  | data_id | slug               | icon                                              | order | translations_id | category_id | locale | title            |
      | 636 | 636     | Online-Education-2 | /store/1/default_images/categories_icons/code.png | 11    | 79              | 636         | en     | Online Education |


  Scenario Outline: When a GET request is sent to the /api/category/{id} endpoint with valid authorization credentials and a
  non-existing record (id), it should return a 203 status code. Additionally, it should be verified that the remark field in the
  response body is "failed" and the message field is "There is not category for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/category/<id>" path parameters.
    # Api kullanicisi "api/category/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not category for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not category for this id." oldugunu dogrular

    Examples:
      | id    |
      | 25416 |


  Scenario: When a GET request is sent to the /api/category/{id} endpoint without including an id parameter, it should return a
  status code of 203. Additionally, it should be verified that the remark field in the response body is "failed" and the message
  field is "No id".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/category" path parameters.
    # Api kullanicisi "api/category/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When a GET request is sent to the /api/category/{id} endpoint with invalid (student or teacher) authorization
  credentials and correct data (id), it should return a status code of 203. Additionally, it should be verified that the remark
  field in the response body is "failed" and the message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/category/<id>" path parameters.
    # Api kullanicisi "api/category/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | id  |
      | 636 |


  Scenario Outline: When a GET request is sent to the /api/category/{id} endpoint with invalid (invalid token) authorization
  credentials and correct data (id), it should return a status code of 401. Additionally, it should be verified that the
  message field in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/category/<id>" path parameters.
    # Api kullanicisi "api/category/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  |
      | 636 |


