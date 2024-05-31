Feature: As an administrator, I want to delete the course information with the specified ID via an API connection.

  Scenario Outline: When a DELETE request is sent with valid authorization credentials and correct data (id), it should return a
  200 status code from the /api/deleteCourse/{id} endpoint. Additionally, it should be verified that the remark field in the
  response body is "success", the Message field is "Successfully Deleted.", and the "Deleted Course ID" value matches the
  id sent in the request.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteCourse/<id>" path parameters.
    # Api kullanicisi "api/deleteCourse/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Course ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Course ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular

    Examples:
      | id   |
      | 2392 |


  Scenario Outline: When a DELETE request is sent with valid authorization credentials and a non-existent record (id), it should
  return a 203 status code from the /api/deleteCourse/{id} endpoint. Additionally, it should be verified that the remark
  field in the response body is "failed" and the message field is "There is no course for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteCourse/<id>" path parameters.
    # Api kullanicisi "api/deleteCourse/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not course for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not course for this id." oldugunu dogrular

    Examples:
      | id   |
      | 5568 |


  Scenario: When a DELETE request is sent without including an (id) parameter with valid authorization credentials, it should
  return a 203 status code from the /api/deleteCourse/{id} endpoint. Additionally, it should be verified that the remark
  field in the response body is "failed" and the message field is "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteCourse" path parameters.
    # Api kullanicisi "api/deleteCourse/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When a DELETE request is sent with invalid (student or teacher) authorization credentials and correct (id),
  it should return a 203 status code from the /api/deleteCourse/{id} endpoint. Additionally, it should be verified that the
  remark field in the response body is "failed" and the message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/deleteCourse/<id>" path parameters.
    # Api kullanicisi "api/deleteCourse/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | id   |
      | 2392 |


  Scenario Outline: When a DELETE request is sent with invalid (invalid token) authorization credentials and correct (id),
  it should return a 401 status code from the /api/deleteCourse/{id} endpoint. Additionally, it should be verified that the
  message field in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteCourse/<id>" path parameters.
    # Api kullanicisi "api/deleteCourse/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id   |
      | 2392 |


  Scenario Outline: The deletion of the course record via the API should be verified. This can be confirmed by sending a GET
  request to the /api/course/{id} endpoint using the "Deleted Course ID" value obtained from the response body,
  thus confirming that the record has been deleted.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/course/<id>" path parameters.
    # Api kullanicisi "api/course/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not course for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not course for this id." oldugunu dogrular

    Examples:
      | id   |
      | 2392 |

