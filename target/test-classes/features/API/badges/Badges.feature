Feature: As an administrator, I want to access badges via an API connection.

  Scenario Outline: Verify that when a GET request with valid authorization credentials is sent to the /api/badges endpoint,
  the returned status code is 200 and the remark field in the response body is "success". Additionally, ensure that the
  information in the response body for the badge with id(x) including (image, type, from, to, score, created_at, id, badge_id,
  locale, title, description) is correct.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/badges" path parameters.
    # Api kullanicisi "api/badges" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies the information for the entry with the <dataIndex> index in the response body, including "<image>", "<type>", "<from>", "<to>", <score>, <created_at>, <id>, <badge_id>, "<locale>", "<title>", and "<description>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<image>", "<type>", "<from>", "<to>", <score>, <created_at>, <id>, <created_at>, <badge_id>, "<locale>", "<title>" ve "<description>" bilgilerini doğrular.

    Examples:
      | dataIndex | image                                         | type          | from | to  | score | created_at | id | badge_id | locale | title      | description          |
      | 0         | /store/1/default_images/badges/loyal_user.png | register_date | 31   | 365 | 10    | 1625554171 | 2  | 22       | en     | Loyal User | 1 year of Membership |


  Scenario:Verify that when a GET request is sent to the /api/badges endpoint with invalid (student or teacher) authorization
  credentials, the returned status code is 203. Ensure that the remark field in the response body is "failed" and the message
  field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/badges" path parameters.
    # Api kullanicisi "api/badges" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario: Verify that when a GET request is sent to the /api/badges endpoint with invalid (invalid token) authorization
  credentials, the returned status code is 401, and the message field in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/badges" path parameters.
    # Api kullanicisi "api/badges" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
