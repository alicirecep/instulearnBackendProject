Feature: As an administrator, I want to access products via an API connection.

  Scenario Outline: A GET request with valid authorization information to the /api/products endpoint should return a status code of 200,
  and the remark field in the response body should be verified as "success". Additionally, for the verification of specific product
  information (id), the response body of the GET request should contain the following details: (creator_id, type, slug, category_id,
  price, point, unlimited_inventory, ordering, id, product_id, locale, title, seo_description, summary, description).

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/products" path parameters.
    # Api kullanicisi "api/products" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the information for the entry with the specified <dataIndex> index in the response body includes <creator_id>, "<type>", "<slug>", <category_id>, <price>, <point>, <unlimited_inventory>, <ordering>, <id>, <product_id>, "<locale>", "<title>", "<seo_description>", "<summary>" and "<description>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin <creator_id>, "<type>", "<slug>", <category_id>, <price>, <point>, <unlimited_inventory>, <ordering>, <id>, <product_id>, "<locale>", "<title>", "<seo_description>", "<summary>" ve "<description>" bilgilerini doğrular.

    Examples:
      | dataIndex | creator_id | type     | slug                | category_id | price | point | unlimited_inventory | ordering | id | product_id | locale | title               | seo_description       | summary           | description     |
      | 0         | 1015       | physical | Painting-tools      | 1           | 25    | 5     | 0                   | 1        | 1  | 1          | en     | Painting tools      | Manfredini's favorite | painting supplies | (0, 0, 0, 0.95) |
      | 1         | 934        | physical | Advanced-microscope | 2           | 290   | 4     | 0                   | 1        | 2  | 2          | en     | Advanced microscope | laboratory            | microscopes       | biological      |


  Scenario: It should be verified that when a GET request is made to the /api/products endpoint with invalid
  (student or teacher) authorization credentials, the response status code is 203, the remark in the response body is
  "failed" and the message is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/products" path parameters.
    # Api kullanicisi "api/products" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario: It should be verified that when a GET request is made to the /api/products endpoint with invalid (invalid token)
  authorization credentials, the response status code is 401, and the message in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/products" path parameters.
    # Api kullanicisi "api/products" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular



