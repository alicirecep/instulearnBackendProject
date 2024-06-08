Feature: As an administrator, I want to update the information of the course FAQ with the specified ID via an API connection.

  Scenario Outline: When a PATCH request with valid authorization and correct data is sent to the /api/updateCoursefaq/{id}
  endpoint, it should return a status code of 200 and the response body should contain the messages "success" and
  "Successfully Updated." Additionally, the returned Updated Course Faq ID should match the id path parameter.
  This confirms that the course FAQ record intended to be updated has been successfully updated via the API.

    * The api user sends a POST request to the api "addCoursefaq" endpoint to create a new "coursefaq" record and records the "Added Course Faq ID" information.
    # Api kullanıcısı api "addCoursefaq" endpointine POST isteği göndererek yeni bir "coursefaq" kaydı oluşturur ve "Added Course Faq ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCoursefaq" path parameters.
    # Api kullanicisi "api/updateCoursefaq/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" and "<answer>" information to send to the api updateCoursefaq endpoint.
    # Api kullanicisi api updateCoursefaq endpointine gondermek icin "<title>" ve "<answer>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * The api user verifies that the "Updated Course Faq ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Updated Course Faq ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.translations[0].title" is "Will I receive a certificate upon completion of the course?" by sending a GET request to the "api" "coursefaq" endpoint with the "Updated Course Faq ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Updated Course Faq ID" ile "api" "coursefaq" endpoint'ine GET request göndererek "title" bilgisinin "Will I receive a certificate upon completion of the course?" oldugunu dogrular

    Examples:
      | title                                                       | answer                                                                                                                    |
      | Will I receive a certificate upon completion of the course? | Yes, upon successful completion of the course, you will receive a certificate of completion to showcase your achievement. |


  Scenario: When a PATCH request with valid authorization credentials, correct (id), and no data is sent, it should be
  verified that the returned status code is 203, the remark information in the response body is "failed", and the message
  information is "There is no information to update."

    * The api user sends a POST request to the api "addCoursefaq" endpoint to create a new "coursefaq" record and records the "Added Course Faq ID" information.
    # Api kullanıcısı api "addCoursefaq" endpointine POST isteği göndererek yeni bir "coursefaq" kaydı oluşturur ve "Added Course Faq ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCoursefaq" path parameters.
    # Api kullanicisi "api/updateCoursefaq/{id}" path parametrelerini olusturur
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


  Scenario Outline: When a PATCH request with valid authorization credentials, a non-existent (id), and correct data is sent,
  it should be verified that the returned status code is 203, the remark information in the response body is "failed", and the
  message information is "There is not course faq for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCoursefaq/<id>" path parameters.
    # Api kullanicisi "api/updateCoursefaq/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" and "<answer>" information to send to the api updateCoursefaq endpoint.
    # Api kullanicisi api updateCoursefaq endpointine gondermek icin "<title>" ve "<answer>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "There is not course faq for this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is not course faq for this id." oldugunu dogrular

    Examples:
      | id    | title                                                       | answer                                                                                                                    |
      | 25146 | Will I receive a certificate upon completion of the course? | Yes, upon successful completion of the course, you will receive a certificate of completion to showcase your achievement. |


  Scenario Outline: With valid authorization credentials, sending a PATCH request containing correct data but without an (id)
  should result in a returned status code of 203. It should be verified that the remark information in the response body
  indicates "failed", and the message information states "No id"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCoursefaq" path parameters.
    # Api kullanicisi "api/updateCoursefaq/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" and "<answer>" information to send to the api updateCoursefaq endpoint.
    # Api kullanicisi api updateCoursefaq endpointine gondermek icin "<title>" ve "<answer>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "No id".
    # Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu dogrular

    Examples:
      | title                                                       | answer                                                                                                                    |
      | Will I receive a certificate upon completion of the course? | Yes, upon successful completion of the course, you will receive a certificate of completion to showcase your achievement. |


  Scenario Outline: When a PATCH request with invalid (student or teacher) authorization credentials, the correct (id), and correct
  data (title, answer) is sent to the /api/updateCoursefaq/{id} endpoint, it should be verified that the status code is 203 and
  the response body contains a remark field with the value "failed" and a message field with the value
  "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addCoursefaq" endpoint to create a new "coursefaq" record and records the "Added Course Faq ID" information.
    # Api kullanıcısı api "addCoursefaq" endpointine POST isteği göndererek yeni bir "coursefaq" kaydı oluşturur ve "Added Course Faq ID" bilgisini kaydeder.
    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/updateCoursefaq" path parameters.
    # Api kullanicisi "api/updateCoursefaq/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" and "<answer>" information to send to the api updateCoursefaq endpoint.
    # Api kullanicisi api updateCoursefaq endpointine gondermek icin "<title>" ve "<answer>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | title                                                       | answer                                                                                                                    |
      | Will I receive a certificate upon completion of the course? | Yes, upon successful completion of the course, you will receive a certificate of completion to showcase your achievement. |


  Scenario Outline: When a PATCH request with invalid (invalid token) authorization credentials, the correct (id), and correct data
  (title, answer) is sent to the /api/updateCoursefaq/{id} endpoint, it should be verified that the status code is 401 and the
  response body contains a message field with the value "Unauthenticated."

    * The api user sends a POST request to the api "addCoursefaq" endpoint to create a new "coursefaq" record and records the "Added Course Faq ID" information.
    # Api kullanıcısı api "addCoursefaq" endpointine POST isteği göndererek yeni bir "coursefaq" kaydı oluşturur ve "Added Course Faq ID" bilgisini kaydeder.
    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/updateCoursefaq" path parameters.
    # Api kullanicisi "api/updateCoursefaq/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<title>" and "<answer>" information to send to the api updateCoursefaq endpoint.
    # Api kullanicisi api updateCoursefaq endpointine gondermek icin "<title>" ve "<answer>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | title                                                       | answer                                                                                                                    |
      | Will I receive a certificate upon completion of the course? | Yes, upon successful completion of the course, you will receive a certificate of completion to showcase your achievement. |

