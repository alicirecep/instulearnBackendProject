Feature: As an administrator, I want to delete the course FAQ information with the specified ID via an API connection.

  Scenario Outline: When a DELETE request is sent to the /api/deleteCoursefaq/{id} endpoint with valid authorization and the correct
  (id), the status code should be 200, the response body should have a remark of "success" and a message of "Successfully Deleted."
  and the Deleted Course Faq ID in the response body should be the same as the id in the path parameter.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteCoursefaq/<id>" path parameters.
    # Api kullanicisi "api/deleteCoursefaq/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Course Faq ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Course Faq ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular

    Examples:
      | id  |
      | 182 |


  Scenario Outline: When a DELETE request with valid authorization and a non-existing (id) is sent to the /api/deleteCoursefaq/{id}
  endpoint, the returned status code should be 203, the remark in the response body should be "failed," and the message should be
  "There is not course faq for this id." This should be verified.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteCoursefaq/<id>" path parameters.
    # Api kullanicisi "api/deleteCoursefaq/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not course faq for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not course faq for this id." oldugunu dogrular

    Examples:
      | id   |
      | 2145 |


  Scenario: When a DELETE request without an (id) is sent to the /api/deleteCoursefaq/{id} endpoint with valid authorization
  credentials, the returned status code should be 203, the remark in the response body should be "failed," and the message should
  be "No id" This should be verified.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteCoursefaq" path parameters.
    # Api kullanicisi "api/deleteCoursefaq/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario Outline: When a DELETE request with invalid (student or teacher) authorization credentials and correct (id) is sent to the
  /api/deleteCoursefaq/{id} endpoint, the returned status code should be 203, the remark in the response body should be "failed,"
  and the message should be "To access this data, you must log in as a admin." This should be verified.

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/deleteCoursefaq/<id>" path parameters.
    # Api kullanicisi "api/deleteCoursefaq/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | id  |
      | 182 |


  Scenario Outline: When a DELETE request with invalid token authorization credentials and correct (id) is sent to the
  /api/deleteCoursefaq/{id} endpoint, the returned status code should be 401, and the message in the response body should be
  "Unauthenticated." This should be verified.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteCoursefaq/<id>" path parameters.
    # Api kullanicisi "api/deleteCoursefaq/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  |
      | 182 |


  Scenario Outline: To verify the deletion of a course faq record, a GET request can be sent to the /api/coursefaq/{id}
  endpoint with the Deleted Course Faq ID returned by the API, confirming that the record has been deleted.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coursefaq/<id>" path parameters.
    # Api kullanicisi "api/coursefaq/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not course faq for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not course faq for this id." oldugunu dogrular

    Examples:
      | id  |
      | 182 |
