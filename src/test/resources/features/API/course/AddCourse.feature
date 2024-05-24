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
    * The api user sends a POST request and saves the response returned from the api addCourse endpoint.
    # Api kullanicisi POST request gonderir ve api addCourse endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user confirms that the remark information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the Message information in the response body is "Successfully Added."
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular

    Examples:
      | title               | type   | slug       | start_date | duration | capacity | price | description | teacher_id |
      | Health And Fitness4 | course | Health-And | 1625081400 | 60       | 5        | 20    | desc        | 870        |

