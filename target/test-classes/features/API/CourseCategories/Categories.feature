Feature: As an administrator, I want to access course categories via an API connection.

  Scenario Outline: When a GET request is sent to the /api/categories endpoint with valid authorization, it should be
  verified that the status code is 200 and the remark information in the response body is "success". Additionally, it
  should be checked that the category with id(x) has accurate details for slug, parent_id, icon, order, title, id, category_id,
  locale, and title.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/categories" path parameters.
    # Api kullanicisi "api/categories" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user confirms that the remark information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the information for the entry with the specified <dataIndex> in the response body includes "<slug>", "<icon>", <order>, <id>, <category_id>, "<locale>" and "<title>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<slug>", "<icon>", <order>, <id>, <category_id>, "<locale>" ve "<title>" bilgilerini doğrular.

    Examples:
      | dataIndex | slug               | icon                                              | order | id | category_id | locale | title            |
      | 0         | Online-Education-2 | /store/1/default_images/categories_icons/code.png | 11    | 79 | 636         | en     | Online Education |
      | 1         | Online-Education   | /store/1/default_images/categories_icons/code.png | 10    | 78 | 635         | en     | Online Education |


  Scenario: When a GET request is sent to the /api/categories endpoint with invalid (student or teacher) authorization credentials,
  the expected status code should be 203. The remark information in the response body should be verified as "failed", and the
  message information should be "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/categories" path parameters.
    # Api kullanicisi "api/categories" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user confirms that the remark information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the message information in the response body is "To access this data, you must log in as a admin."
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario: When a GET request is sent to the /api/categories endpoint with invalid (invalid token) authorization credentials,
  the expected status code should be 401. The message information in the response body should be verified as "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/categories" path parameters.
    # Api kullanicisi "api/categories" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


