Feature: As an administrator, I want to update the information of the course category with the specified ID via an API connection.

  Scenario Outline: When a PATCH request is sent with valid authorization credentials, correct id, and data to the
  /api/updateCategory/{id} endpoint, it should be verified that the status code returned is 200. Additionally, it should be
  confirmed that the remark field in the response body is "success" and the Message field is "Successfully Updated."
  The value of Updated Category Id obtained from the response body should match the id path parameter specified in the
  /api/updateCategory/{id} endpoint.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCategory/<id>" path parameters.
    # Api kullanicisi "api/updateCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    # Api kullanicisi api updateCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request body and saves the returned response.
    # Api kullanicisi PATCH request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user confirms that the remark information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the Message information in the response body is "Successfully Updated."
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * The api user verifies that the "Updated Category Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Updated Category Id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular

    Examples:
      | id  | title               |
      | 637 | Web Development 101 |


