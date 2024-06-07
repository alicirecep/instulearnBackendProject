Feature: As an administrator, I want to access product categories via an API connection.

  Scenario Outline: When a GET request is sent to the /api/productCategories endpoint with valid authorization credentials,
  the status code returned is verified to be 200, and the remark in the response body is confirmed to be "success".
  Additionally, when a GET request is sent to the /api/productCategories endpoint with valid authorization credentials and an ID (x),
  the information returned in the response body (parent_id, icon, order, id, product_category_id, locale, title) is verified.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/productCategories" path parameters.
    # Api kullanicisi "api/productCategories" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies the "<icon>", <id>, <product_category_id>, "<locale>" and "<title>" information for the <dataIndex> index in the response body.
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<icon>", <id>, <product_category_id>, "<locale>" ve "<title>" bilgilerini doğrular.

    Examples:
      | dataIndex | icon                                              | id | product_category_id | locale | title                 |
      | 1         | /store/1/default_images/categories_icons/code.png | 35 | 29                  | en     | Educational Equipment |
      | 2         | /store/1/default_images/categories_icons/code.png | 34 | 28                  | en     | Online Education      |
