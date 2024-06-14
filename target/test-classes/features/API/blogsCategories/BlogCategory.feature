Feature: As an administrator, I want to access detailed information about the blog category with the specified ID via an API connection.

  Scenario Outline: When a GET request is made to the /api/blogCategory/{id} endpoint with valid authorization credentials and a
  correct id, it should return a status code of 200, and the remark value in the response body should be verified as "success".
  Additionally, the data in the response body (id, title, slug) should be checked for accuracy.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/blogCategory/<id>" path parameters.
    # Api kullanicisi "api/blogCategory/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies the content of data <data_id>, "<title>" and "<slug>" in the response body.
    # Api kullanicisi response bodydeki data <data_id>, "<title>" ve "<slug>" içeriklerini doğrular.

    Examples:
      | id | data_id | title | slug |
      | 34 | 34      | Blog  | blog |


  Scenario Outline: When a GET request is made to the /api/blogCategory/{id} endpoint with valid authorization credentials and a
  non-existent id, it should return a status code of 203. The remark value in the response body should be verified as "failed",
  and the message value should be "There is not category for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/blogCategory/<id>" path parameters.
    # Api kullanicisi "api/blogCategory/{id}" path parametrelerini olusturur
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
      | 95412 |


  Scenario: When a GET request is made to the /api/blogCategory/{id} endpoint without an id but with valid authorization credentials,
  it should return a status code of 203. The remark value in the response body should be verified as "failed", and the message
  value should be "No id".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/blogCategory" path parameters.
    # Api kullanicisi "api/blogCategory/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When a GET request is made to the /api/blogCategory/{id} endpoint with invalid (student or teacher)
  authorization credentials and a correct id, it should return a status code of 203. The remark value in the response body should
  be verified as "failed", and the message value should be "To access this data, you must log in as admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/blogCategory/<id>" path parameters.
    # Api kullanicisi "api/blogCategory/{id}" path parametrelerini olusturur
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
      | 34 |


  Scenario Outline: When a GET request is made to the /api/blogCategory/{id} endpoint with invalid (invalid token) authorization
  credentials and a correct id, it should return a status code of 401. The message value in the response body should be verified
  as "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/blogCategory/<id>" path parameters.
    # Api kullanicisi "api/blogCategory/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 34 |



