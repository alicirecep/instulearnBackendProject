Feature: As an administrator, I want to update the information of the course with the specified ID via an API connection.

  Scenario Outline: When a PATCH request with valid authorization and correct data is sent to the /api/updateCourse/{id} endpoint,
  it should be verified that the status code is 200 and the response body contains the messages "success" and
  "Successfully Updated." Additionally, it should be checked that the returned Updated Course ID matches the id path parameter
  specified in the "/api/updateCourse/{id}" endpoint. This confirms that the course record intended to be updated has been
  successfully updated via the API.

    * The api user sends a POST request to the api "addCourse" endpoint to create a new "course" record and records the "Added Course ID" information.
    # Api kullanıcısı api "addCourse" endpointine POST isteği göndererek yeni bir "course" kaydı oluşturur ve "Added Course ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCourse" path parameters.
    # Api kullanicisi "api/updateCourse/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the API updateCourse endpoint containing the information <duration>, <capacity>, <price> and "<title>".
    # Api kullanicisi api updateCourse endpointine gondermek icin <duration>, <capacity>, <price> ve "<title>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * The api user verifies that the "Updated Course ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Updated Course ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.translations[0].title" is "Web Development 101" by sending a GET request to the "api" "course" endpoint with the "Updated Course ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Updated Course ID" ile "api" "course" endpoint'ine GET request göndererek "title" bilgisinin "Web Development 101" oldugunu dogrular

    Examples:
      | duration | capacity | price | title               |
      | 100      | 15       | 50    | Web Development 101 |


  Scenario: Valid authorization credentials and correct (id) should return a 203 status code from the /api/updateCourse/{id}
  endpoint when no data is included in the PATCH request. The response body should have remark as "failed" and message as
  "There is no information to update."

    * The api user sends a POST request to the api "addCourse" endpoint to create a new "course" record and records the "Added Course ID" information.
    # Api kullanıcısı api "addCourse" endpointine POST isteği göndererek yeni bir "course" kaydı oluşturur ve "Added Course ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCourse" path parameters.
    # Api kullanicisi "api/updateCourse/{id}" path parametrelerini olusturur
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


  Scenario Outline: Valid authorization credentials and correct data should return a 203 status code from the /api/updateCourse/{id}
  endpoint when a non-existent record (id) is provided in the PATCH request. The response body should have remark as "failed"
  and message as "There is no course for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCourse/<id>" path parameters.
    # Api kullanicisi "api/updateCourse/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the API updateCourse endpoint containing the information <duration>, <capacity>, <price> and "<title>".
    # Api kullanicisi api updateCourse endpointine gondermek icin <duration>, <capacity>, <price> ve "<title>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not course for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not course for this id." oldugunu dogrular

    Examples:
      | id      | duration | capacity | price | title               |
      | 5412568 | 100      | 15       | 50    | Web Development 101 |


  Scenario Outline: Valid authorization credentials and correct data without including an (id) should return a 203 status code
  from the /api/updateCourse/{id} endpoint. The response body should have remark as "failed" and message as "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCourse" path parameters.
    # Api kullanicisi "api/updateCourse/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the API updateCourse endpoint containing the information <duration>, <capacity>, <price> and "<title>".
    # Api kullanicisi api updateCourse endpointine gondermek icin <duration>, <capacity>, <price> ve "<title>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular

    Examples:
      | duration | capacity | price | title               |
      | 100      | 15       | 50    | Web Development 101 |


  Scenario Outline: Invalid (student or teacher) authorization credentials with correct data (id) should return a 203 status code
  from the /api/updateCourse/{id} endpoint. The response body should have remark as "failed" and message as
  "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addCourse" endpoint to create a new "course" record and records the "Added Course ID" information.
    # Api kullanıcısı api "addCourse" endpointine POST isteği göndererek yeni bir "course" kaydı oluşturur ve "Added Course ID" bilgisini kaydeder.
    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/updateCourse" path parameters.
    # Api kullanicisi "api/updateCourse/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the API updateCourse endpoint containing the information <duration>, <capacity>, <price> and "<title>".
    # Api kullanicisi api updateCourse endpointine gondermek icin <duration>, <capacity>, <price> ve "<title>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | duration | capacity | price | title               |
      | 100      | 15       | 50    | Web Development 101 |


  Scenario Outline: Invalid (invalid token) authorization credentials with correct data (id) should return a 401 status code from
  the /api/updateCourse/{id} endpoint. The response body should have the message field as "Unauthenticated."

    * The api user sends a POST request to the api "addCourse" endpoint to create a new "course" record and records the "Added Course ID" information.
    # Api kullanıcısı api "addCourse" endpointine POST isteği göndererek yeni bir "course" kaydı oluşturur ve "Added Course ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/updateCourse" path parameters.
    # Api kullanicisi "api/updateCourse/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the API updateCourse endpoint containing the information <duration>, <capacity>, <price> and "<title>".
    # Api kullanicisi api updateCourse endpointine gondermek icin <duration>, <capacity>, <price> ve "<title>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | duration | capacity | price | title               |
      | 100      | 15       | 50    | Web Development 101 |




