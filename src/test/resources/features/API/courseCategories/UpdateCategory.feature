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
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * The api user verifies that the "Updated Category Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Updated Category Id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular

    Examples:
      | id  | title                  |
      | 637 | Education and Training |


  Scenario Outline: When a PATCH request with valid authorization credentials but without data is sent to the
  /api/updateCategory/{id} endpoint, it should be verified that the status code returned is 422 and the message
  field in the response body is "The title field is required."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCategory/<id>" path parameters.
    # Api kullanicisi "api/updateCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request without containing any data.
    # Api kullanicisi data icermeyen bir patch request hazırlar
    * The api user sends a "PATCH" request body and saves the returned response.
    # Api kullanicisi PATCH request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The title field is required.".
    # Api kullanicisi response bodyde dönen message bilgisinin "The title field is required." oldugunu dogrular

    Examples:
      | id  |
      | 637 |


  Scenario Outline: When a PATCH request with valid authorization credentials and correct data (title) but a non-existent
  id is sent to the /api/updateCategory/{id} endpoint, it should be verified that the status code returned is 203 and the
  remark field in the response body is "failed" and the message field is "There is not category for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCategory/<id>" path parameters.
    # Api kullanicisi "api/updateCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    # Api kullanicisi api updateCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request body and saves the returned response.
    # Api kullanicisi PATCH request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not category for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not category for this id." oldugunu dogrular

    Examples:
      | id    | title                  |
      | 25416 | Education and Training |


  Scenario Outline: When a PATCH request with valid authorization credentials but no id and correct data (title) is sent to the
  /api/updateCategory/{id} endpoint, it should be verified that the status code returned is 203 and the remark field in the
  response body is "failed" and the message field is "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCategory" path parameters.
    # Api kullanicisi "api/updateCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    # Api kullanicisi api updateCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request body and saves the returned response.
    # Api kullanicisi PATCH request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular

    Examples:
      | title                  |
      | Education and Training |


  Scenario Outline: When a PATCH request with invalid authorization credentials and correct id and data (title) is sent to the
  /api/updateCategory/{id} endpoint, it should be verified that the status code returned is 203 and the remark field in the
  response body is "failed" and the message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/updateCategory/<id>" path parameters.
    # Api kullanicisi "api/updateCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    # Api kullanicisi api updateCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request body and saves the returned response.
    # Api kullanicisi PATCH request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | id  | title                  |
      | 637 | Education and Training |


  Scenario Outline: When a PATCH request with invalid authorization credentials (invalid token) and correct id and data (title)
  is sent to the /api/updateCategory/{id} endpoint, it should be verified that the status code returned is 401 and the message
  field in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/updateCategory/<id>" path parameters.
    # Api kullanicisi "api/updateCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    # Api kullanicisi api updateCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request, saves the response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  | title                  |
      | 637 | Education and Training |


  Scenario Outline: To verify the updated course category record via the API, the returned Updated Category Id value can be
  used to send a GET request to the /api/category/{id} endpoint, confirming that the record has been updated.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/category/<id>" path parameters.
    # Api kullanicisi "api/category/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user confirms that the title information in the response body is "<titleValue>".
    # Api kullanicisi response bodydeki title bilgisinin "<titleValue>" olduğunu doğrular.

    Examples:
      | id  | titleValue             |
      | 637 | Education and Training |


