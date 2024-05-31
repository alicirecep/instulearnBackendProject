Feature: As an administrator, I need to access detailed information about the course with the specified ID via an API connection.

  Scenario Outline: When a GET request is sent to the /api/course/{id} endpoint with valid authorization and correct data (id),
  it should be verified that the status code is 200 and that the remark field in the response body is "success". Additionally,
  it should be confirmed that the data in the response body is accurate.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/course/<id>" path parameters.
    # Api kullanicisi "api/course/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The API user verifies that the data in the response body includes <data_id>, <teacher_id>, <creator_id>, <category_id>, "<type>", <private>, "<slug>", <start_date>, <duration>, <translations_id>, <webinar_id>, "<locale>", "<title>", "<seo_description>" and "<description>".
    # Api kullanicisi response bodydeki data <data_id>, <teacher_id>, <creator_id>, <category_id>, "<type>", <private>, "<slug>", <start_date>, <duration>, <translations_id>, <webinar_id>, "<locale>", "<title>", "<seo_description>" ve "<description>" içeriklerini doğrular.

    Examples:
      | id   | data_id | teacher_id | creator_id | category_id | type    | private | slug                            | start_date | duration | translations_id | webinar_id | locale | title                           | seo_description                 | description     |
      | 1996 | 1996    | 1015       | 1015       | 601         | webinar | 0       | Master-the-Fundamentals-of-Math | 1728570600 | 450      | 2               | 1996       | en     | Master the Fundamentals of Math | Master the Fundamentals of Math | (227, 227, 227) |


  Scenario Outline: When a GET request is sent to the /api/course/{id} endpoint with valid authorization credentials and a
  non-existent record (id), it should be verified that the status code is 203 and that the remark field in the response body
  is "failed". Additionally, the message field in the response body should be "There is not course for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/course/<id>" path parameters.
    # Api kullanicisi "api/course/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not course for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not course for this id." oldugunu dogrular

    Examples:
      | id     |
      | 254167 |


  Scenario: When a GET request is sent to the /api/course/{id} endpoint without including an id, but with valid authorization
  credentials, it should be verified that the status code is 203 and that the remark field in the response body is "failed".
  Additionally, the message field in the response body should be "No id".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/course" path parameters.
    # Api kullanicisi "api/course/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When a GET request is sent to the /api/course/{id} endpoint with invalid authorization credentials and correct
  data (id), it should be verified that the status code is 203 and that the remark field in the response body is "failed".
  Additionally, the message field in the response body should be "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/course/<id>" path parameters.
    # Api kullanicisi "api/course/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | id   |
      | 1996 |


  Scenario Outline: When a GET request is sent to the /api/course/{id} endpoint with invalid (invalid token) authorization
  credentials and correct data (id), it should be verified that the status code is 401 and that the message field in the
  response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/course/<id>" path parameters.
    # Api kullanicisi "api/course/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id   |
      | 1996 |

