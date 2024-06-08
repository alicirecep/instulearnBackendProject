Feature: As an administrator, I want to create a new product record via an API connection.

  Scenario Outline: When a valid POST request with proper authorization and correct data is sent to the /api/addProduct endpoint,
  the expected outcomes are: a status code of 200, a "success" remark in the response body, and a message stating
  "Successfully Added." Furthermore, within the response body of the same request, the ID of the created product should be
  included. By sending a GET request to the /api/product/{id} endpoint with this ID, the creation of the record is confirmed.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addProduct" path parameters.
    # Api kullanicisi "api/addProduct" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addProduct endpoint containing the information "<type>", <price>, <category_id>, "<title>", "<summary>" and "<description>".
    # Api kullanicisi api addProduct endpointine gondermek icin "<type>", <price>, <category_id>, "<title>", "<summary>" ve "<description>" bilgisilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "product" endpoint with the "Added Product ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Added Product ID" ile "api" "product" endpoint'ine GET request göndererek "remark" bilgisinin "success" oldugunu dogrular

    Examples:
      | type    | price | category_id | title                                                 | summary                                                                        | description                                                                                                                                                                                                                                                                                                                                                                |
      | virtual | 100   | 2           | Introduction to Yoga: A Beginner's Guide Video Course | Discover the transformative power of yoga and embark on a journey to wellness. | Embark on a journey to holistic wellness with 'Introduction to Yoga: A Beginner's Guide.' This course covers basic poses, breathing techniques, and meditation, led by experienced instructors. Suitable for beginners and those looking to deepen their practice, you'll gain strength, flexibility, and inner peace. Join us to unlock the transformative power of yoga! |


  Scenario: When a POST request is sent to the /api/addProduct endpoint with valid authorization but without data,
  it should be verified that the returned status code is 422 and the message in the response body is
  "The type field is required. (and 3 more errors)"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addProduct" path parameters.
    # Api kullanicisi "api/addProduct" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The type field is required. (and 3 more errors)".
    # Api kullanicisi response bodyde dönen message bilgisinin "The type field is required. (and 3 more errors)" oldugunu dogrular


  Scenario Outline: When a POST request with valid data (type, price, category_id, title, summary, description) is sent to the
  /api/addProduct endpoint with invalid (student or teacher) authorization credentials, it should be verified that the returned
  status code is 203, and the remark in the response body is "failed" with the message
  "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/addProduct" path parameters.
    # Api kullanicisi "api/addProduct" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addProduct endpoint containing the information "<type>", <price>, <category_id>, "<title>", "<summary>" and "<description>".
    # Api kullanicisi api addProduct endpointine gondermek icin "<type>", <price>, <category_id>, "<title>", "<summary>" ve "<description>" bilgisilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | type    | price | category_id | title                                                 | summary                                                                        | description                                                                                                                                                                                                                                                                                                                                                                |
      | virtual | 100   | 2           | Introduction to Yoga: A Beginner's Guide Video Course | Discover the transformative power of yoga and embark on a journey to wellness. | Embark on a journey to holistic wellness with 'Introduction to Yoga: A Beginner's Guide.' This course covers basic poses, breathing techniques, and meditation, led by experienced instructors. Suitable for beginners and those looking to deepen their practice, you'll gain strength, flexibility, and inner peace. Join us to unlock the transformative power of yoga! |


  Scenario Outline: When a POST request with valid data (type, price, category_id, title, summary, description) is sent to the
  /api/addProduct endpoint with invalid (invalid token) authorization credentials, it should be verified that the returned status
  code is 401, and the message in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addProduct" path parameters.
    # Api kullanicisi "api/addProduct" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api addProduct endpoint containing the information "<type>", <price>, <category_id>, "<title>", "<summary>" and "<description>".
    # Api kullanicisi api addProduct endpointine gondermek icin "<type>", <price>, <category_id>, "<title>", "<summary>" ve "<description>" bilgisilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodyde dönen message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | type    | price | category_id | title                                                 | summary                                                                        | description                                                                                                                                                                                                                                                                                                                                                                |
      | virtual | 100   | 2           | Introduction to Yoga: A Beginner's Guide Video Course | Discover the transformative power of yoga and embark on a journey to wellness. | Embark on a journey to holistic wellness with 'Introduction to Yoga: A Beginner's Guide.' This course covers basic poses, breathing techniques, and meditation, led by experienced instructors. Suitable for beginners and those looking to deepen their practice, you'll gain strength, flexibility, and inner peace. Join us to unlock the transformative power of yoga! |



