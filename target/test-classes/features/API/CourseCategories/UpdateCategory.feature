Feature: As an administrator, I want to update the information of the course category with the specified ID via an API connection.

  Scenario Outline: When a PATCH request with valid authorization and correct data is sent to the /api/updateCategory/{id} endpoint,
  it should be verified that the status code is 200 and the response body contains the messages "success" and
  "Successfully Updated." Additionally, it should be checked that the returned Updated Category ID matches the id path parameter
  specified in the /api/updateCategory/{id} endpoint. This confirms that the course category record intended to be updated
  has been successfully updated via the API.

    * The api user sends a POST request to the api "addCategory" endpoint to create a new "category" record and records the "Added Category ID" information.
    # Api kullanıcısı api "addCategory" endpointine POST isteği göndererek yeni bir "category" kaydı oluşturur ve "Added Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCategory" path parameters.
    # Api kullanicisi "api/updateCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    # Api kullanicisi api updateCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * The api user verifies that the "Updated Category Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Updated Category Id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.translations[0].title" is "Education and Training" by sending a GET request to the "api" "category" endpoint with the "Updated Category Id" returned in the response body.
    # Api kullanicisi response bodyde donen "Updated Category Id" ile "api" "category" endpoint'ine GET request göndererek "title" bilgisinin "Education and Training" oldugunu dogrular

    Examples:
      | title                  |
      | Education and Training |


  Scenario: When a PATCH request with valid authorization credentials, the correct (id), and no data is sent to the
  /api/updateCategory/{id} endpoint, it should be verified that the returned status code is 203, the remark information in the
  response body is "failed", and the message information is "There is no information to update."

    * The api user sends a POST request to the api "addCategory" endpoint to create a new "category" record and records the "Added Category ID" information.
    # Api kullanıcısı api "addCategory" endpointine POST isteği göndererek yeni bir "category" kaydı oluşturur ve "Added Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCategory" path parameters.
    # Api kullanicisi "api/updateCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request without containing any data.
    # Api kullanicisi data icermeyen bir patch request hazırlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "There is no information to update.".
    # Api kullanicisi response bodyde dönen message bilgisinin "There is no information to update." oldugunu dogrular


  Scenario Outline: When a PATCH request with valid authorization credentials and correct data (title) but a non-existent
  id is sent to the /api/updateCategory/{id} endpoint, it should be verified that the status code returned is 203 and the
  remark field in the response body is "failed" and the message field is "There is not category for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCategory/<id>" path parameters.
    # Api kullanicisi "api/updateCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    # Api kullanicisi api updateCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
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
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
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

    * The api user sends a POST request to the api "addCategory" endpoint to create a new "category" record and records the "Added Category ID" information.
    # Api kullanıcısı api "addCategory" endpointine POST isteği göndererek yeni bir "category" kaydı oluşturur ve "Added Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/updateCategory" path parameters.
    # Api kullanicisi "api/updateCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    # Api kullanicisi api updateCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | title                  |
      | Education and Training |


  Scenario Outline: When a PATCH request with invalid authorization credentials (invalid token) and correct id and data (title)
  is sent to the /api/updateCategory/{id} endpoint, it should be verified that the status code returned is 401 and the message
  field in the response body is "Unauthenticated."

    * The api user sends a POST request to the api "addCategory" endpoint to create a new "category" record and records the "Added Category ID" information.
    # Api kullanıcısı api "addCategory" endpointine POST isteği göndererek yeni bir "category" kaydı oluşturur ve "Added Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/updateCategory" path parameters.
    # Api kullanicisi "api/updateCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateCategory endpoint.
    # Api kullanicisi api updateCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | title                  |
      | Education and Training |

