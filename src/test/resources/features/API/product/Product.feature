Feature: As an administrator, I want to access detailed information about the product with the specified ID via an API connection.

  Scenario Outline: It should be verified that when a valid authorization and correct (id) are included in a GET request to the
  /api/product/{id} endpoint, the response status code is 200, and the remark in the response body is "success". The accuracy of
  the data in the response body (id, creator_id, type, slug, category_id, price, point, unlimited_inventory, ordering, id, product_id,
  locale, title, seo_description, summary, description) should also be checked.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/product/<id>" path parameters.
    # Api kullanicisi "api/product/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies the content of the data in the response body, including <data_id>, <creator_id>, "<type>", "<slug>", <category_id>, <price>, <point>, <unlimited_inventory>, <ordering>, <translations_id>, <product_id>, "<locale>", "<title>", "<seo_description>", "<summary>" and "<description>".
    # Api kullanicisi response bodydeki data <data_id>, <creator_id>, "<type>", "<slug>", <category_id>, <price>, <point>, <unlimited_inventory>, <ordering>, <translations_id>, <product_id>, "<locale>", "<title>", "<seo_description>", "<summary>" ve "<description>" içeriklerini doğrular.

    Examples:
      | id | data_id | creator_id | type    | slug                   | category_id | price | point | unlimited_inventory | ordering | translations_id | product_id | locale | title                  | seo_description | summary    | description     |
      | 4  | 4       | 1016       | virtual | Sherlock-Holmes-e-book | 3           | 5     | 2     | 1                   | 1        | 4               | 4          | en     | Sherlock Holmes e-book | Sherlock Holmes | Sir Arthur | Sherlock Holmes |


  Scenario Outline: When a valid authorization and a non-existing (id) are included in a GET request sent to the /api/product/{id}
  endpoint, the response code should be verified as 203, and the remark in the response body should be confirmed as "failed".
  The message in the response body should be checked to be "There is not product for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/product/<id>" path parameters.
    # Api kullanicisi "api/product/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not product for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not product for this id." oldugunu dogrular

    Examples:
      | id    |
      | 42514 |


  Scenario: When a valid authorization and a GET request without including an (id) are sent to the /api/product/{id} endpoint,
  the response code should be verified as 203, and the remark in the response body should be confirmed as "failed".
  The message in the response body should be checked to be "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/product" path parameters.
    # Api kullanicisi "api/product/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When an invalid (student or teacher) authorization information and correct data (id) are sent with a GET request
  to the /api/product/{id} endpoint, the returned status code should be verified as 203. The remark in the response body should
  be "failed", and the message should be "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/product/<id>" path parameters.
    # Api kullanicisi "api/product/{id}" path parametrelerini olusturur
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
      | 4  |


  Scenario Outline: When an invalid (invalid token) authorization information and correct data (id) are sent with a GET request to the
  /api/product/{id} endpoint, the returned status code should be verified as 401. The message in the response body should be
  "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/product/<id>" path parameters.
    # Api kullanicisi "api/product/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 4  |

