Feature: As an administrator, I want to create a new course FAQ record via an API connection.

  Scenario Outline: When a valid POST request with proper authorization and correct data (title, answer, webinar_id) is sent to the
  /api/addCoursefaq endpoint, it should be verified that the status code is 200, and the response body contains the messages
  "success" and "Successfully Added." To confirm the creation of the record, a GET request should be sent to the
  /api/coursefaq/{id} endpoint using the returned Added Course Faq ID.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addCoursefaq" path parameters.
    # Api kullanicisi "api/addCoursefaq" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<title>", "<answer>" and <webinar_id> information to send to the api addCoursefaq endpoint.
    # Api kullanicisi api addCoursefaq endpointine gondermek icin "<title>", "<answer>" ve <webinar_id> bilgisilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "coursefaq" endpoint with the "Added Course Faq ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Added Course Faq ID" ile "api" "coursefaq" endpoint'ine GET request göndererek "remark" bilgisinin "success" oldugunu dogrular

    Examples:
      | title                                                                                   | answer                                                                                                                                                                                                                                                                                                  | webinar_id |
      | What are the key features that differentiate your online learning platform from others? | The key features that distinguish our online learning platform from others include: a wide range of course content, interactive learning tools, student support services, personalized learning paths that provide a customized learning experience, and a team of up-to-date and qualified instructors | 1995       |


  Scenario: When a POST request with valid authorization credentials and no data is sent to the /api/addCoursefaq endpoint,
  it should be verified that the returned status code is 422, and the message information in the response body is
  "The title field is required. (and 1 more error)"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addCoursefaq" path parameters.
    # Api kullanicisi "api/addCoursefaq" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The title field is required. (and 1 more error)".
    # Api kullanicisi response bodyde dönen message bilgisinin "The title field is required. (and 1 more error)" oldugunu dogrular


  Scenario Outline: When a POST request with invalid (student or teacher) authorization credentials and correct data
  (title, answer, webinar_id) is sent to the /api/addCoursefaq endpoint, it should be verified that the returned status code
  is 203, the remark information in the response body is "failed", and the message information is
  "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/addCoursefaq" path parameters.
    # Api kullanicisi "api/addCoursefaq" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<title>", "<answer>" and <webinar_id> information to send to the api addCoursefaq endpoint.
    # Api kullanicisi api addCoursefaq endpointine gondermek icin "<title>", "<answer>" ve <webinar_id> bilgisilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | title                                                                                   | answer                                                                                                                                                                                                                                                                                                  | webinar_id |
      | What are the key features that differentiate your online learning platform from others? | The key features that distinguish our online learning platform from others include: a wide range of course content, interactive learning tools, student support services, personalized learning paths that provide a customized learning experience, and a team of up-to-date and qualified instructors | 1995       |


  Scenario Outline: When a POST request with invalid (invalid token) authorization credentials and correct data
  (title, answer, webinar_id) is sent to the /api/addCoursefaq endpoint, it should be verified that the returned
  status code is 401, and the message information in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addCoursefaq" path parameters.
    # Api kullanicisi "api/addCoursefaq" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<title>", "<answer>" and <webinar_id> information to send to the api addCoursefaq endpoint.
    # Api kullanicisi api addCoursefaq endpointine gondermek icin "<title>", "<answer>" ve <webinar_id> bilgisilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodyde dönen message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | title                                                                                   | answer                                                                                                                                                                                                                                                                                                  | webinar_id |
      | What are the key features that differentiate your online learning platform from others? | The key features that distinguish our online learning platform from others include: a wide range of course content, interactive learning tools, student support services, personalized learning paths that provide a customized learning experience, and a team of up-to-date and qualified instructors | 1995       |
