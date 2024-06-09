Feature: As an administrator or teacher, I want to access detailed information about the blog with the specified ID via an API connection.

  Scenario Outline: Validate that when a GET request is sent to the /api/blog/{id} endpoint with valid authentication credentials
  and the correct (id), the returned status code is 200, and the remark in the response body is "success". Additionally,
  verify that the returned data (id, category_id, author_id, slug, image, visit_count, enable_comment, status, created_at,
  updated_at, id, blog_id, locale, title, description, content, meta_description) is correct.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blog/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies the content of the data in the response body, which includes <data_id>, <category_id>, <author_id>, "<slug>", "<image>", <visit_count>, <enable_comment>, "<status>", <created_at>, <updated_at>, <translations_id>, <blog_id>, "<locale>", "<title>", "<description>", "<content>" and "<meta_description>".
    # Api kullanicisi response bodydeki data <data_id>, <category_id>, <author_id>, "<slug>", "<image>", <visit_count>, <enable_comment>, "<status>", <created_at>, <updated_at>, <translations_id>, <blog_id>, "<locale>", "<title>", "<description>", "<content>" ve "<meta_description>" içeriklerini doğrular.

    Examples:
      | id  | data_id | category_id | author_id | slug                                     | image                     | visit_count | enable_comment | status  | created_at | updated_at | translations_id | blog_id | locale | title                                  | description                  | content                     | meta_description             |
      | 112 | 112     | 34          | 1329      | The-Growing-Impact-of-Online-Education-4 | /store/1/blog-default.jpg | 1           | 0              | publish | 1717936723 | 1717936723 | 87              | 112     | en     | The Growing Impact of Online Education | Online education has rapidly | Accessibility Through MOOCs | Online education has rapidly |


  Scenario Outline: When a GET request is sent to the /api/blog/{id} endpoint with valid credentials and a non-existing (id),
  it verifies that the returned status code is 203, the remark field in the response body is "failed", and the message field is
  "There is not blog for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blog/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not blog for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not blog for this id." oldugunu dogrular

    Examples:
      | id    |
      | 32515 |


  Scenario: When a GET request is sent with valid credentials and without an (id) included, it verifies that the returned status
  code is 203, the remark field in the response body is "failed", and the message field is "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/blog" path parameters.
    # Api kullanicisi "api/blog/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When a GET request is sent with invalid (student) authentication credentials and the correct (id) to the
  /api/blog/{id} endpoint, it verifies that the returned status code is 203, the remark field in the response body is "failed",
  and the message field is "To access this data, you must log in as a teacher or admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blog/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a teacher or admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a teacher or admin." oldugunu dogrular

    Examples:
      | id  |
      | 112 |


  Scenario Outline: When a GET request is sent with invalid (invalid token) authentication credentials and the correct (id) to the
  /api/blog/{id} endpoint, it verifies that the returned status code is 401, and the message field in the response body is
  "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blog/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  |
      | 112 |



