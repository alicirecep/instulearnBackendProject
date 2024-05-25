Feature: As an administrator, I want to delete the course information with the specified ID via an API connection.

  @API
  Scenario Outline: When a DELETE request with valid authorization information and correct data (id) is sent to the
  /api/deleteCourse/{id} endpoint, the returned status code should be 200. The 'remark' information in the response body should
  be "success", and the 'Message' information should be "Successfully Deleted." Additionally, the "Deleted Course ID" in the
  response body should be the same as the id sent.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteCourse/<id>" path parameters.
    # Api kullanicisi "api/deleteCourse/{id}" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user confirms that the remark information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the Message information in the response body is "Successfully Deleted."
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Course ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Course ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular

    Examples:
      | id   |
      | 2392 |

