Feature: As an administrator or teacher, I want to update the information of the blog with the specified ID via an API connection.
  @API
  Scenario Outline: When a PATCH request is sent to the /api/updateBlog/{id} endpoint with valid credentials and correct data,
  it verifies that the returned status code is 200, and the remark in the response body is "success" with the Message stating
  "Successfully Updated." Additionally, it verifies that the Updated Blog Id returned in the response body is the same as the id
  parameter specified in the /api/updateBlog/{id} endpoint. The update of the desired blog record via the API can be confirmed.
  By sending a GET request to the /api/blog/{id} endpoint with the Updated Blog Id returned in the response body, the update of
  the record can be verified.

    * The api user sends a POST request to the api "addBlog" endpoint to create a new "blog" record and records the "Added Blog ID" information.
    # Api kullanıcısı api "addBlog" endpointine POST isteği göndererek yeni bir "blog" kaydı oluşturur ve "Added Blog ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateBlog" path parameters.
    # Api kullanicisi "api/updateBlog/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api updateBlog endpoint with the "<title>", <category_id>, "<description>" and "<content>" information.
    # Api kullanicisi api updateBlog endpointine gondermek icin "<title>", <category_id>, "<description>" ve "<content>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * The api user verifies that the "Updated Blog Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Updated Blog Id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.translations[0].title" is "Online Education" by sending a GET request to the "api" "blog" endpoint with the "Updated Blog Id" returned in the response body.
    # Api kullanicisi response bodyde donen "Updated Blog Id" ile "api" "blog" endpoint'ine GET request göndererek "title" bilgisinin "Online Education" oldugunu dogrular

    Examples:
      | title            | category_id | description                                                                                       | content                                                                                                                                                                                                                                                                                                   |
      | Online Education | 33          | Online education has rapidly evolved from a niche alternative to a mainstream method of learning. | Accessibility Through MOOCs:Massive Open Online Courses (MOOCs) pioneered accessible online learning, offering high-quality courses from prestigious universities to a global audience. Platforms like Coursera and edX made education more inclusive, breaking down geographical and financial barriers. |