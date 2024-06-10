Feature: As an administrator, I want to update the information of the blog category with the specified ID via an API connection.
  @API
  Scenario Outline: When a PATCH request with valid authorization and correct data (title) is sent to the /api/updateBlogCategory/{id}
  endpoint with the correct (id), the returned status code should be 200. The remark field in the response body should be verified as
  "success", and the Message field should be "Successfully Updated." It should be confirmed that the Updated Blog Category ID in the
  response body matches the id path parameter specified in the /api/updateBlogCategory/{id} endpoint. Additionally, the update of
  the record can be verified by sending a GET request to the /api/blogCategory/{id} endpoint with the Updated Blog Category ID.

    * The api user sends a POST request to the api "addBlogCategory" endpoint to create a new "blogCategory" record and records the "Added Blog Category ID" information.
    # Api kullanıcısı api "addBlogCategory" endpointine POST isteği göndererek yeni bir "blogCategory" kaydı oluşturur ve "Added Blog Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateBlogCategory" path parameters.
    # Api kullanicisi "api/updateBlogCategory/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" information to send to the api updateBlogCategory endpoint.
    # Api kullanicisi api updateBlogCategory endpointine gondermek icin "<title>" bilgisini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * The api user verifies that the "Updated Blog Category ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Updated Blog Category ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.title" is "Education and Training" by sending a GET request to the "api" "blogCategory" endpoint with the "Updated Blog Category ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Updated Blog Category ID" ile "api" "blogCategory" endpoint'ine GET request göndererek "title" bilgisinin "Education and Training" oldugunu dogrular

    Examples:
      | title                  |
      | Education and Training |