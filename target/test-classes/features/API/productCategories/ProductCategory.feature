Feature: As an administrator, I want to access detailed information about the product category with the specified ID via an API connection.

  Scenario Outline: When a valid authorization and correct data (id) are sent in a GET request to the /api/productCategory/{id}
  endpoint, the expected outcome should be a status code of 200 and the remark in the response body should be "success".
  Additionally, when a valid authorization and correct data (id) are sent in a GET request to the same endpoint, the
  correctness of the data in the response body (id, parent_id, icon, order, title, id, product_category_id, locale, title)
  should also be verified.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/productCategory/<id>" path parameters.
    # Api kullanicisi "api/productCategory/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies the content of the response body data <data_id>, "<icon>", <translations_id>, <product_category_id>, "<locale>" and "<title>".
    # Api kullanicisi response bodydeki data <data_id>, "<icon>", <translations_id>, <product_category_id>, "<locale>" ve "<title>" içeriklerini doğrular.

    Examples:
      | id | data_id | icon                                              | translations_id | product_category_id | locale | title                 |
      | 30 | 30      | /store/1/default_images/categories_icons/code.png | 36              | 30                  | en     | Educational Equipment |


  Scenario Outline: When a valid authorization and a non-existent (id) are sent in a GET request, the response from the
  /api/productCategory/{id} endpoint should return a status code of 203, with the remark in the response body indicating "failed",
  and the message indicating "There is not product category for this id." This should be verified.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/productCategory/<id>" path parameters.
    # Api kullanicisi "api/productCategory/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not product category for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not product category for this id." oldugunu dogrular

    Examples:
      | id    |
      | 22501 |


  Scenario: When a valid GET request without an (id) is sent to the /api/productCategory/{id} endpoint with proper authorization,
  the expected outcomes are: a status code of 203, a "failed" remark in the response body, and a message stating "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/productCategory" path parameters.
    # Api kullanicisi "api/productCategory/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When an invalid (student or teacher) authorization is used to send a GET request with correct data (id) to the
  /api/productCategory/{id} endpoint, the expected outcomes are: a status code of 203, a "failed" remark in the response body,
  and a message stating "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/productCategory/<id>" path parameters.
    # Api kullanicisi "api/productCategory/{id}" path parametrelerini olusturur
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
      | 30 |


  Scenario Outline: When an invalid (invalid token) authorization is used to send a GET request with correct data (id) to the
  /api/productCategory/{id} endpoint, the expected outcomes are: a status code of 401 and a "Unauthenticated." message in the
  response body.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/productCategory/<id>" path parameters.
    # Api kullanicisi "api/productCategory/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 30 |

