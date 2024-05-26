Feature:As an administrator, I want to access courses via an API connection.

  Scenario Outline: When a GET request is sent to the /api/courses endpoint with valid authorization, it should be verified
  that the status code is 200 and that the remark in the response body is "success". Additionally, it should be
  confirmed that the course with id(x) has accurate details for teacher_id, creator_id, category_id, type, private,
  slug, start_date, duration, id, webinar_id, locale, title, seo_description, and description.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/courses" path parameters.
    # Api kullanicisi "api/courses" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user confirms that the remark information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including <teacher_id>, <creator_id>, <category_id>, "<type>", <private>, "<slug>", <duration>, <id>, <webinar_id>, "<locale>", "<title>", "<seo_description>", and "<description>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin <teacher_id>, <creator_id>, <category_id>, "<type>", <private>, "<slug>", <duration>, <id>, <webinar_id>, "<locale>", "<title>", "<seo_description>" ve "<description>" bilgilerini doğrular.

    Examples:
      | dataIndex | teacher_id | creator_id | category_id | type   | private | slug                     | duration | id | webinar_id | locale | title                    | seo_description    | description     |
      | 0         | 1016       | 1016       | 611         | course | 0       | Become-a-Project-Manager | 150      | 1  | 1995       | en     | Become a Project Manager | Project Management | (227, 227, 227) |


  Scenario: When a GET request is sent to the /api/courses endpoint with invalid (student or teacher) authorization credentials,
  the returned status code should be 203, and the remark information in the response body should be verified as "failed", with
  the message information being "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/courses" path parameters.
    # Api kullanicisi "api/courses" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user confirms that the remark information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the message information in the response body is "To access this data, you must log in as a admin."
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario:When a GET request is sent to the /api/courses endpoint with invalid (invalid token) authorization credentials,
  the returned status code should be 401, and the message information in the response body should be verified
  as "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/courses" path parameters.
    # Api kullanicisi "api/courses" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

