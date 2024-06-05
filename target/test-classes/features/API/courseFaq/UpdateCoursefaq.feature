Feature: As an administrator, I want to update the information of the course FAQ with the specified ID via an API connection.

  @API
  Scenario Outline: The status code returned after a PATCH request with valid authorization credentials, correct (id), and data
  (title, answer) should be verified to be 200. The remark information in the response body should indicate "success", and the
  Message information should state "Successfully Updated". Additionally, it should be ensured that the Updated Course Faq ID
  in the response body matches the id specified in the /api/updateCoursefaq/{id} endpoint.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCoursefaq/<id>" path parameters.
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

    Examples:
      | id  | title                                                       | answer                                                                                                                    |
      | 165 | Will I receive a certificate upon completion of the course? | Yes, upon successful completion of the course, you will receive a certificate of completion to showcase your achievement. |


  Scenario Outline: When a PATCH request with valid authorization credentials, correct (id), and no data is sent, it should be
  verified that the returned status code is 203, the remark information in the response body is "failed", and the message
  information is "There is no information to update."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCoursefaq/<id>" path parameters.
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

    Examples:
      | id  |
      | 165 |


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





