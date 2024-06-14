Feature: As an administrator, I want to access support departments via an API connection.

  Scenario Outline: When a GET request is sent to the /api/departments endpoint with valid authorization information, it is
  verified that the status code returned is 200 and the remark field in the response body is "success". Also, when a GET request
  is sent to the /api/departments endpoint with valid authorization information for a department with a specific id, the
  information returned (created_at, supports_count, title, id, support_department_id, locale, title) is checked for correctness

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departments" path parameters.
    # Api kullanicisi "api/departments" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The API user validates the <created_at>, <supports_count>, <id>, <support_department_id>, "<locale>" and "<title>" of the response body with index <dataIndex>.
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin <created_at>, <supports_count>, <id>, <support_department_id>, "<locale>" ve "<title>" bilgilerini doğrular.

    Examples:
      | dataIndex | created_at | supports_count | id | support_department_id | locale | title            |
      | 0         | 1716130129 | 0              | 16 | 14                    | en     | Technical Office |


  Scenario: When a GET request is sent to the /api/departments endpoint with invalid (student or teacher) authorization
  information, it is verified that the status code returned is 203, the remark field in the response body is "failed" and the
  message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/departments" path parameters.
    # Api kullanicisi "api/departments" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario: When a GET request is sent to the /api/departments endpoint with invalid token authorization information, it is
  verified that the status code returned is 401 and the message field in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/departments" path parameters.
    # Api kullanicisi "api/departments" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

