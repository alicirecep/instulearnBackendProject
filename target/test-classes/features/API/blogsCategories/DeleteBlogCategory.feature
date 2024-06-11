Feature: As an administrator, I want to delete the blog category information with the specified ID via an API connection.

  Scenario: When a DELETE request with valid authorization and correct (id) is sent to the /api/deleteBlogCategory/{id} endpoint,
  the returned status code should be 200. The remark field in the response body should be verified as "success", and the Message
  field should be "Successfully Deleted." Additionally, it should be confirmed that the Deleted Blog Category Id in the response
  body matches the id path parameter specified in the /api/deleteBlogCategory/{id} endpoint. Finally, the deletion of the desired
  blog category record should be verified through the API.

    * The api user sends a POST request to the api "addBlogCategory" endpoint to create a new "blogCategory" record and records the "Added Blog Category ID" information.
    # Api kullanıcısı api "addBlogCategory" endpointine POST isteği göndererek yeni bir "blogCategory" kaydı oluşturur ve "Added Blog Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteBlogCategory" path parameters.
    # Api kullanicisi "api/deleteBlogCategory/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Blog Category Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Blog Category Id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.message" is "There is not category for this id." by sending a GET request to the "api" "blogCategory" endpoint with the "Deleted Blog Category Id" returned in the response body.
    # Api kullanicisi response bodyde donen "Deleted Blog Category Id" ile "api" "blogCategory" endpoint'ine GET request göndererek "message" bilgisinin "There is not category for this id." oldugunu dogrular


  Scenario Outline: When a DELETE request with valid authorization credentials and a non-existent (id) is sent to the
  /api/deleteBlogCategory/{id} endpoint, the returned status code should be 203. The remark field in the response body should be
  verified as "failed", and the message field should be "There is not category for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteBlogCategory/<id>" path parameters.
    # Api kullanicisi "api/deleteBlogCategory/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not category for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not category for this id." oldugunu dogrular

    Examples:
      | id     |
      | 521478 |


  Scenario: When a DELETE request without an (id) is sent with valid authorization credentials to the /api/deleteBlogCategory/{id}
  endpoint, the returned status code should be 203. The remark field in the response body should be verified as "failed", and the
  message field should be "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteBlogCategory" path parameters.
    # Api kullanicisi "api/deleteBlogCategory/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario: When a DELETE request with invalid (student or teacher) authorization credentials but correct (id) is sent to the
  /api/deleteBlogCategory/{id} endpoint, the returned status code should be 203. The remark field in the response body should be
  verified as "failed", and the message field should be "To access this data, you must log in as admin."

    * The api user sends a POST request to the api "addBlogCategory" endpoint to create a new "blogCategory" record and records the "Added Blog Category ID" information.
    # Api kullanıcısı api "addBlogCategory" endpointine POST isteği göndererek yeni bir "blogCategory" kaydı oluşturur ve "Added Blog Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/deleteBlogCategory" path parameters.
    # Api kullanicisi "api/deleteBlogCategory/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as admin." oldugunu dogrular


  Scenario: When a DELETE request with invalid (invalid token) authorization credentials but correct (id) is sent to the
  /api/deleteBlogCategory/{id} endpoint, the returned status code should be 401. The message field in the response body
  should be verified as "Unauthenticated."

    * The api user sends a POST request to the api "addBlogCategory" endpoint to create a new "blogCategory" record and records the "Added Blog Category ID" information.
    # Api kullanıcısı api "addBlogCategory" endpointine POST isteği göndererek yeni bir "blogCategory" kaydı oluşturur ve "Added Blog Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteBlogCategory" path parameters.
    # Api kullanicisi "api/deleteBlogCategory/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

