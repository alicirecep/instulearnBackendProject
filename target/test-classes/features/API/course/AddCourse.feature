Feature: As an administrator, I want to create a new course record via an API connection.

  Scenario Outline: When a POST request with valid authorization credentials and correct data is sent, it should be verified
  that the status code returned from the /api/addCourse endpoint is 200. Additionally, it should be confirmed that the remark
  field in the response body is "success" and the Message field is "Successfully Added."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addCourse" path parameters.
    # Api kullanicisi "api/addCourse" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addCourse endpoint containing the information "<title>", "<type>", "<slug>", "<start_date>", <duration>, <capacity>, <price>, "<description>" and <teacher_id>.
    # Api kullanicisi api addCourse endpointine gondermek icin "<title>", "<type>", "<slug>", "<start_date>", <duration>, <capacity>, <price>, "<description>" ve <teacher_id> bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request body and saves the returned response.
    # Api kullanicisi POST request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user confirms that the remark information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the Message information in the response body is "Successfully Added."
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular

    Examples:
      | title               | type   | slug       | start_date | duration | capacity | price | description | teacher_id |
      | Health And Fitness4 | course | Health-And | 1625081400 | 60       | 5        | 20    | desc        | 870        |


  Scenario Outline: When a POST request with valid authorization credentials and incomplete data is sent, it should be verified
  that the status code returned from the /api/addCourse endpoint is 422. Additionally, it should be confirmed that the message
  field in the response body is "The teacher id field is required."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addCourse" path parameters.
    # Api kullanicisi "api/addCourse" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addCourse endpoint containing the information "<title>", "<type>", "<slug>", "<start_date>", <duration>, <capacity>, <price> and "<description>".
    # Api kullanicisi api addCourse endpointine gondermek icin "<title>", "<type>", "<slug>", "<start_date>", <duration>, <capacity>, <price> ve "<description>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request body and saves the returned response.
    # Api kullanicisi POST request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user confirms that the message in the response body is "The teacher id field is required."
    # Api kullanicisi response bodyde dönen message bilgisinin "The teacher id field is required." oldugunu dogrular

    Examples:
      | title               | type   | slug       | start_date | duration | capacity | price | description |
      | Health And Fitness4 | course | Health-And | 1625081400 | 60       | 5        | 20    | desc        |


  Scenario: When a POST request with valid authorization credentials and no data is sent, it should be verified that the status
  code returned from the /api/addCourse endpoint is 422. Additionally, it should be confirmed that the message field in the
  response body is "The teacher id field is required. (and 2 more errors)".

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addCourse" path parameters.
    # Api kullanicisi "api/addCourse" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a "POST" request body and saves the returned response.
    # Api kullanicisi POST request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user confirms that the message in the response body is "The teacher id field is required. (and 2 more errors)"
    # Api kullanicisi response bodyde dönen message bilgisinin "The teacher id field is required. (and 2 more errors)" oldugunu dogrular


  Scenario Outline:  When a POST request with invalid (student or teacher) authorization credentials and correct data is sent,
  it should be verified that the status code returned from the /api/addCourse endpoint is 203. Additionally, it should be confirmed
  that the remark field in the response body is "failed" and the message field is "To access this data, you must log in as an
  admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/addCourse" path parameters.
    # Api kullanicisi "api/addCourse" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addCourse endpoint containing the information "<title>", "<type>", "<slug>", "<start_date>", <duration>, <capacity>, <price>, "<description>" and <teacher_id>.
    # Api kullanicisi api addCourse endpointine gondermek icin "<title>", "<type>", "<slug>", "<start_date>", <duration>, <capacity>, <price>, "<description>" ve <teacher_id> bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request body and saves the returned response.
    # Api kullanicisi POST request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user confirms that the remark information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the message information in the response body is "To access this data, you must log in as a admin."
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | title               | type   | slug       | start_date | duration | capacity | price | description | teacher_id |
      | Health And Fitness4 | course | Health-And | 1625081400 | 60       | 5        | 20    | desc        | 870        |


  Scenario Outline:  When a POST request with invalid (invalid token) authorization credentials and correct data is sent, it
  should be verified that the status code returned from the /api/addCourse endpoint is 401. Additionally, it should be
  confirmed that the message field in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addCourse" path parameters.
    # Api kullanicisi "api/addCourse" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addCourse endpoint containing the information "<title>", "<type>", "<slug>", "<start_date>", <duration>, <capacity>, <price>, "<description>" and <teacher_id>.
    # Api kullanicisi api addCourse endpointine gondermek icin "<title>", "<type>", "<slug>", "<start_date>", <duration>, <capacity>, <price>, "<description>" ve <teacher_id> bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request body and saves the returned response.
    # Api kullanicisi POST request body gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user confirms that the message in the response body is "Unauthenticated."
    # Api kullanicisi response bodyde dönen message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | title               | type   | slug       | start_date | duration | capacity | price | description | teacher_id |
      | Health And Fitness4 | course | Health-And | 1625081400 | 60       | 5        | 20    | desc        | 870        |


  Scenario Outline: When a new course record is created via the API, it should be verified by sending a GET request to the
  /api/course/{id} endpoint using the "Added Course ID" value obtained from the response body to confirm that the record has
  been successfully created.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/course/<id>" path parameters.
    # Api kullanicisi "api/course/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user confirms that the remark information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular

    Examples:
      | id   |
      | 2389 |


