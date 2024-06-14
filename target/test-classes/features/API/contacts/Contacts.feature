Feature: As an administrator, I want to access contacts via an API connection.

  Scenario Outline: When a GET request is sent to the /api/contacts endpoint with valid authorization credentials, the returned
  status code is verified to be 200. Additionally, the remark field in the response body is confirmed to be "success". Furthermore,
  for a specific contact ID, the accuracy of the information returned in the response body (name, email, phone, subject, message,
  reply, status, created_at) is checked.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/contacts" path parameters.
    # Api kullanicisi "api/contacts" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies the "<name>", "<email>", "<phone>", "<subject>", "<message>", "<status>", and <created_at> information for the item at the <dataIndex> index in the response body.
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<name>", "<email>", "<phone>", "<subject>", "<message>", "<status>" ve <created_at> bilgilerini doğrular.

    Examples:
      | dataIndex | name          | email            | phone       | subject              | message              | status  | created_at |
      | 0         | John Brown    | jbrown@gmail.com | 12024569875 | Test Contact Subject | Test Contact Message | pending | 1717851128 |
      | 2         | Alice William | jbrown@gmail.com | 12035269752 | Test Contact Subject | Test Contact Message | pending | 1717850741 |


  Scenario: When a GET request is sent to the /api/contacts endpoint with invalid (student or teacher) authorization credentials,
  the returned status code is verified to be 203. Additionally, the remark field in the response body is "failed", and the
  message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/contacts" path parameters.
    # Api kullanicisi "api/contacts" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular


  Scenario: Verify that when a GET request is sent to the /api/contacts endpoint with invalid (invalid token) credentials,
  the status code is 401 and the message field in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/contacts" path parameters.
    # Api kullanicisi "api/contacts" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

