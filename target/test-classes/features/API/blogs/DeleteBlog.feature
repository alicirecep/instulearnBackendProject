Feature: As an administrator or teacher, I want to delete the blog information with the specified ID via an API connection.

  Scenario: Verify that a DELETE request to the /api/deleteBlog/{id} endpoint with valid authorization credentials and a correct (id)
  returns a status code of 200. The response body should have the remark field as "success" and the Message field as
  "Successfully Deleted." Additionally, the Deleted Blog Id in the response body should match the id specified in the request,
  confirming that the blog record intended for deletion has been successfully removed. To confirm the deletion of the blog record,
  a GET request can be made to the /api/blog/{id} endpoint with the Deleted Blog Id specified in the response.

    * The api user sends a POST request to the api "addBlog" endpoint to create a new "blog" record and records the "Added Blog ID" information.
    # Api kullanıcısı api "addBlog" endpointine POST isteği göndererek yeni bir "blog" kaydı oluşturur ve "Added Blog ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteBlog" path parameters.
    # Api kullanicisi "api/deleteBlog/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Blog Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Blog Id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.message" is "There is not blog for this id." by sending a GET request to the "api" "blog" endpoint with the "Deleted Blog Id" returned in the response body.
    # Api kullanicisi response bodyde donen "Deleted Blog Id" ile "api" "blog" endpoint'ine GET request göndererek "message" bilgisinin "There is not blog for this id." oldugunu dogrular


  Scenario Outline: When a DELETE request is made to the /api/deleteBlog/{id} endpoint with valid authorization credentials but a
  non-existent (id), the returned status code should be 203. The response body should contain remark as "failed" and message as
  "There is not blog for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteBlog/<id>" path parameters.
    # Api kullanicisi "api/deleteBlog/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not blog for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not blog for this id." oldugunu dogrular

    Examples:
      | id   |
      | 5568 |


  Scenario: When a DELETE request is sent to the /api/deleteBlog/{id} endpoint with valid authorization credentials but without an
  (id), the returned status code should be 203. The response body should contain remark as "failed" and message as "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteBlog" path parameters.
    # Api kullanicisi "api/deleteBlog/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular


  Scenario: When a DELETE request is sent to the /api/deleteBlog/{id} endpoint with invalid (student) authorization credentials
  but a correct (id), the returned status code should be 203. The response body should contain remark as "failed" and message
  as "To access this data, you must log in as a teacher or admin."

    * The api user sends a POST request to the api "addBlog" endpoint to create a new "blog" record and records the "Added Blog ID" information.
    # Api kullanıcısı api "addBlog" endpointine POST isteği göndererek yeni bir "blog" kaydı oluşturur ve "Added Blog ID" bilgisini kaydeder.
    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/deleteBlog" path parameters.
    # Api kullanicisi "api/deleteBlog/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a teacher or admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a teacher or admin." oldugunu dogrular


  Scenario: When a DELETE request is sent to the /api/deleteBlog/{id} endpoint with invalid (invalid token) authorization
  credentials but a correct (id), the returned status code should be 401. The response body should contain message as
  "Unauthenticated."

    * The api user sends a POST request to the api "addBlog" endpoint to create a new "blog" record and records the "Added Blog ID" information.
    # Api kullanıcısı api "addBlog" endpointine POST isteği göndererek yeni bir "blog" kaydı oluşturur ve "Added Blog ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteBlog" path parameters.
    # Api kullanicisi "api/deleteBlog/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


