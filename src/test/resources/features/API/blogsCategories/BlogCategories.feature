Feature: As an administrator, I want to access blog categories via an API connection.

  Scenario Outline: When a GET request is made to the /api/blogCategories endpoint with valid authorization credentials,
  the returned status code should be 200, and the remark value in the response body should be "success". Additionally, the
  category information returned in this request (title, slug, blog_count) should be verified.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/blogCategories" path parameters.
    # Api kullanicisi "api/blogCategories" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies the "<title>", "<slug>" and <blog_count> information of the response body at the <dataIndex> index.
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<title>", "<slug>" ve <blog_count> bilgilerini doğrular.

    Examples:
      | dataIndex | title                  | slug                   | blog_count |
      | 0         | Blog                   | blog                   | 27         |
      | 2         | Education and Training | Education-and-Training | 0          |


  Scenario: When a GET request is made to the /api/blogCategories endpoint with invalid (student or teacher) authorization
  credentials, the returned status code should be 203. The remark value in the response body should be "failed" and the message
  value should be "To access this data, you must log in as admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/blogCategories" path parameters.
    # Api kullanicisi "api/blogCategories" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as admin." oldugunu dogrular


  Scenario: When a GET request is made to the /api/blogCategories endpoint with invalid (invalid token) authorization credentials,
  the returned status code should be 401. The message value in the response body should be "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/blogCategories" path parameters.
    # Api kullanicisi "api/blogCategories" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


