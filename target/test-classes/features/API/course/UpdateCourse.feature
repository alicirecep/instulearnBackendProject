Feature: As an administrator, I want to update the information of the course with the specified ID via an API connection.
  @API
  Scenario Outline: When a PATCH request is sent to the /api/updateCourse/{id} endpoint with valid authorization
  credentials, correct (id), and accurate data (duration, capacity, price, title) in the body, the expected status
  code upon success should be 200. The remark information in the response body should be verified as "success",
  and the Message information should be "Successfully Updated."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateCourse/<id>" path parameters.
    # Api kullanicisi "api/updateCourse/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the API updateCourse endpoint containing the information <duration>, <capacity>, <price> and "<title>".
    # Api kullanicisi api updateCourse endpointine gondermek icin <duration>, <capacity>, <price> ve "<title>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the response returned from the API updateCourse endpoint.
    # Api kullanicisi PATCH request gonderir ve api updateCourse endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user confirms that the remark information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the Message information in the response body is "Successfully Updated."
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular

    Examples:
      | id   | duration | capacity | price | title               |
      | 2388 | 100      | 15       | 50    | Web Development 101 |


