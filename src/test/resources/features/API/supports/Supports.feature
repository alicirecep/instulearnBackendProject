Feature: As an administrator, I want to access support resources via an API connection.

  Scenario Outline: When a GET request is sent to the /api/supports endpoint with valid authorization information, it should be
  verified that the status code returned is 200 and the remark in the response body is "success". Also, when a GET request is
  sent to the /api/supports endpoint with valid authorization information, if a record containing an id (x) is returned,
  the information in the response body (user_id, webinar_id, department_id, title, status, created_at, updated_at, status_order,
  id, full_name, role_name) should be verified.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/supports" path parameters.
    # Api kullanicisi "api/supports" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user validates the <user_id>, <department_id>, "<title>", "<status>", <created_at>, <updated_at>, "<status_order>", <id>, "<full_name>" and "<role_name>" of the response body with index <dataIndex>.
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin <user_id>, <department_id>, "<title>", "<status>", <created_at>, <updated_at>, "<status_order>", <id>, "<full_name>" ve "<role_name>" bilgilerini doğrular.

    Examples:
      | dataIndex | user_id | department_id | title           | status | created_at | updated_at | status_order | id  | full_name      | role_name |
      | 8         | 923     | 3             | Commission Rate | open   | 1625892221 | 1717974773 | a            | 923 | Sawyer Emerson | teacher   |


  Scenario: When a GET request is sent to the /api/supports endpoint with invalid (student or teacher) authorization information,
  it should be verified that the status code returned is 203 and the remark in the response body is "failed" and the message is
  "To access this data, you must log in as a admin.".

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/supports" path parameters.
    # Api kullanicisi "api/supports" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario: When a GET request is sent to the /api/supports endpoint with an invalid token, it should be verified that the status
  code returned is 401 and the message in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/supports" path parameters.
    # Api kullanicisi "api/supports" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

