Feature: As an administrator, I want to create a new blog category record via an API connection.

  Scenario Outline: When a POST request is sent to the /api/addBlogCategory endpoint with correct authorization and data, the
  returned status code should be 200. The remark field in the response body should be "success", and the Message field should be
  "Successfully Added." The addition of a new blog category record can be verified by making a GET request to the
  /api/blogCategory/{id} endpoint.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addBlogCategory" path parameters.
    # Api kullanicisi "api/addBlogCategory" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<title>" information to send to the api addBlogCategory endpoint.
    # Api kullanicisi api addBlogCategory endpointine gondermek icin "<title>" bilgisini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "blogCategory" endpoint with the "Added Blog Category ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Added Blog Category ID" ile "api" "blogCategory" endpoint'ine GET request göndererek "remark" bilgisinin "success" oldugunu dogrular

    Examples:
      | title           |
      | OnlineEducation |


  Scenario: When a POST request is sent to the /api/addBlogCategory endpoint with valid authorization credentials but no data,
  the returned status code should be 422, and the message field in the response body should be verified as
  "The title field is required."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addBlogCategory" path parameters.
    # Api kullanicisi "api/addBlogCategory" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The title field is required.".
    # Api kullanicisi response bodyde dönen message bilgisinin "The title field is required." oldugunu dogrular


  Scenario Outline: When a POST request is sent to the /api/addBlogCategory endpoint with invalid (student or teacher)
  authorization credentials but correct data (title), the returned status code should be 203. The remark field in the response
  body should be verified as "failed", and the message field should be "To access this data, you must log in as admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/addBlogCategory" path parameters.
    # Api kullanicisi "api/addBlogCategory" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<title>" information to send to the api addBlogCategory endpoint.
    # Api kullanicisi api addBlogCategory endpointine gondermek icin "<title>" bilgisini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as admin." oldugunu dogrular

    Examples:
      | title           |
      | OnlineEducation |


  Scenario Outline: When a POST request is sent to the /api/addBlogCategory endpoint with invalid (invalid token) authorization
  credentials but correct data (title), the returned status code should be 401. The message field in the response body should be
  verified as "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addBlogCategory" path parameters.
    # Api kullanicisi "api/addBlogCategory" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<title>" information to send to the api addBlogCategory endpoint.
    # Api kullanicisi api addBlogCategory endpointine gondermek icin "<title>" bilgisini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodyde dönen message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | title           |
      | OnlineEducation |



