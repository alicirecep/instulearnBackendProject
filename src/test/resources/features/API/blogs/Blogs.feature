Feature: As an administrator or teacher, I want to access blogs via an API connection.

  Scenario Outline: Verify that when a GET request is sent to the /api/blogs endpoint with valid authentication credentials,
  the returned status code is 200 and the remark field in the response body is "success". Additionally, verify that the returned
  data for the blog with id(x) includes the correct values for (category_id, author_id, slug, image, visit_count, enable_comment,
  status, created_at, updated_at, comments_count, id, blog_id, locale, title, description, content, meta_description).

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/blogs" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies the information in the response body at the <dataIndex> index, including <category_id>, <author_id>, "<slug>", "<image>", <visit_count>, <enable_comment>, "<status>", <created_at>, <updated_at>, <comments_count>, <id>, <blog_id>, "<locale>", "<title>", "<description>", "<content>" and "<meta_description>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin <category_id>, <author_id>, "<slug>", "<image>", <visit_count>, <enable_comment>, "<status>", <created_at>, <updated_at>, <comments_count>, <id>, <blog_id>, "<locale>", "<title>", "<description>", "<content>" ve "<meta_description>" bilgilerini doğrular.

    Examples:
      | dataIndex | category_id | author_id | slug                                     | image                     | visit_count | enable_comment | status  | created_at | updated_at | comments_count | id | blog_id | locale | title | description   | content                     | meta_description             |
      | 0         | 34          | 1329      | The-Growing-Impact-of-Online-Education-3 | /store/1/blog-default.jpg | 2           | 0              | publish | 1717936723 | 1717936723 | 0              | 86 | 111     | en     | asd   | Accessibility | Accessibility Through MOOCs | Online education has rapidly |


  Scenario: Validate that when a GET request is sent to the /api/blogs endpoint with invalid (student) authentication credentials,
  the returned status code is 203, the remark in the response body is "failed", and the message is
  "To access this data, you must log in as a teacher or admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/blogs" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a teacher or admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a teacher or admin." oldugunu dogrular


  Scenario: Validate that when a GET request is sent to the /api/blogs endpoint with invalid (invalid token) authentication
  credentials, the returned status code is 401, and the message in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/blogs" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular



