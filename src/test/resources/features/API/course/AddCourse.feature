Feature: As an administrator, I want to create a new course record via an API connection.

  Scenario Outline: When a POST request is sent to the /api/addCourse endpoint with valid authorization credentials and
  correct data (title, type, slug, start_date, duration, capacity, price, description, teacher_id) in the body,
  the returned status code should be 200, the remark information in the response body should be verified as
  "success", and the Message information should be "Successfully Added.".

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


  Scenario Outline: When sending a POST request to the /api/addCourse endpoint with valid authorization credentials and
  incomplete data (missing teacher_id) in the POST body, it should be verified that the returned status code is 422.
  Furthermore, in the response body, the message should state "The teacher id field is required.

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


  Scenario: When a POST request is sent to the /api/addCourse endpoint with valid authorization credentials and an empty body,
  the returned status code should be 422, and the message information in the response body should be verified as
  "The teacher id field is required. (and 2 more errors)"

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


  Scenario Outline: When a POST request is sent to the /api/addCourse endpoint with invalid (student or teacher) authorization
  credentials but correct data in the body, the returned status code should be 203, and the remark information in the response
  body should be verified as "failed", with the message information being "To access this data, you must log in as a admin."

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


  Scenario Outline: When a POST request is sent to the /api/addCourse endpoint with invalid (invalid token) authorization
  credentials but correct data in the body, the returned status code should be 401, and the message information in the
  response body should be verified as "Unauthenticated."

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


  Scenario Outline: The creation of a new course registration via the API should be verified.
  (The registration can be confirmed by sending a GET request to the endpoint /api/course/{id} with the Added Course ID
  returned in the response body.)

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


