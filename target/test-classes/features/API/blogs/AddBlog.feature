Feature: As an administrator or teacher, I want to create a new blog record via an API connection.

  Scenario Outline: When a POST request is sent with valid authentication credentials and correct data (title, category_id,
  description, content) to the /api/addBlog endpoint, it verifies that the returned status code is 200, and the remark field in the
  response body is "success", with the Message field being "Successfully Added." Additionally, to verify the creation of the new
  blog entry via the API, you can send a GET request to the /api/blog/{id} endpoint using the Added Blog ID returned in the
  response body.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addBlog endpoint with the information "<title>", <category_id>, "<description>" and "<content>"
    # Api kullanicisi api addBlog endpointine gondermek icin "<title>", <category_id>, "<description>" ve "<content>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "blog" endpoint with the "Added Blog ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Added Blog ID" ile "api" "blog" endpoint'ine GET request göndererek "remark" bilgisinin "success" oldugunu dogrular

    Examples:
      | title                                  | category_id | description                                                                                                                                           | content                                                                                                                                                                                                                                                                                                                              |
      | The Growing Impact of Online Education | 34          | Online education's rapid evolution, propelled by technology, shifting attitudes, and demand for flexibility, has shifted it from niche to mainstream. | MOOCs pioneered accessible online learning, breaking barriers with high-quality courses from top universities. Adaptive technologies enable personalized experiences, while accredited online degrees offer quality and flexibility. Blended learning combines online resources with face-to-face instruction for enhanced outcomes. |


  Scenario: When a POST request with valid credentials and no data is sent to the /api/addBlog endpoint, it confirms that the
  status code returned is 422, and the message in the response body is "The title field is required. (and 3 more errors)"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The title field is required. (and 3 more errors)".
    # Api kullanicisi response bodyde dönen message bilgisinin "The title field is required. (and 3 more errors)" oldugunu dogrular


  Scenario Outline: When a POST request with invalid (student) authentication credentials and correct data (title, category_id,
  description, content) is sent to the /api/addBlog endpoint, it verifies that the returned status code is 203, and the remark
  in the response body is "failed", and the message is "To access this data, you must log in as a teacher or admin."

    * The api user constructs the base url with the "student" token.
    # Api kullanicisi "student" token ile base urli olusturur
    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addBlog endpoint with the information "<title>", <category_id>, "<description>" and "<content>"
    # Api kullanicisi api addBlog endpointine gondermek icin "<title>", <category_id>, "<description>" ve "<content>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a teacher or admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a teacher or admin." oldugunu dogrular

    Examples:
      | title                                  | category_id | description                                                                                                                                           | content                                                                                                                                                                                                                                                                                                                              |
      | The Growing Impact of Online Education | 34          | Online education's rapid evolution, propelled by technology, shifting attitudes, and demand for flexibility, has shifted it from niche to mainstream. | MOOCs pioneered accessible online learning, breaking barriers with high-quality courses from top universities. Adaptive technologies enable personalized experiences, while accredited online degrees offer quality and flexibility. Blended learning combines online resources with face-to-face instruction for enhanced outcomes. |


  Scenario Outline: When a POST request is sent to the /api/addBlog endpoint with invalid (invalid token) authentication
  credentials and correct data (title, category_id, description, content), it verifies that the returned status code is 401,
  and the message in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addBlog endpoint with the information "<title>", <category_id>, "<description>" and "<content>"
    # Api kullanicisi api addBlog endpointine gondermek icin "<title>", <category_id>, "<description>" ve "<content>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodyde dönen message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | title                                  | category_id | description                                                                                                                                           | content                                                                                                                                                                                                                                                                                                                              |
      | The Growing Impact of Online Education | 34          | Online education's rapid evolution, propelled by technology, shifting attitudes, and demand for flexibility, has shifted it from niche to mainstream. | MOOCs pioneered accessible online learning, breaking barriers with high-quality courses from top universities. Adaptive technologies enable personalized experiences, while accredited online degrees offer quality and flexibility. Blended learning combines online resources with face-to-face instruction for enhanced outcomes. |




