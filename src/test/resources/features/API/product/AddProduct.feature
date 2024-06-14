Feature: As an administrator, I want to create a new product record via an API connection.

  Scenario Outline: When a valid POST request with proper authorization and correct data is sent to the /api/addProduct endpoint,
  the expected outcomes are: a status code of 200, a "success" remark in the response body, and a message stating
  "Successfully Added." Furthermore, within the response body of the same request, the ID of the created product should be
  included. By sending a GET request to the /api/product/{id} endpoint with this ID, the creation of the record is confirmed.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addProduct" path parameters.
    * The api user prepares a POST request to send to the api addProduct endpoint containing the information "<type>", <price>, <category_id>, "<title>", "<summary>" and "<description>".
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "product" endpoint with the "Added Product ID" returned in the response body.

    Examples:
      | type    | price | category_id | title                                                 | summary                                                                        | description                                                                                                                                                                                                                                                                                                                                                                |
      | virtual | 100   | 2           | Introduction to Yoga: A Beginner's Guide Video Course | Discover the transformative power of yoga and embark on a journey to wellness. | Embark on a journey to holistic wellness with 'Introduction to Yoga: A Beginner's Guide.' This course covers basic poses, breathing techniques, and meditation, led by experienced instructors. Suitable for beginners and those looking to deepen their practice, you'll gain strength, flexibility, and inner peace. Join us to unlock the transformative power of yoga! |


  Scenario: When a POST request is sent to the /api/addProduct endpoint with valid authorization but without data,
  it should be verified that the returned status code is 422 and the message in the response body is
  "The type field is required. (and 3 more errors)"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addProduct" path parameters.
    * The api user prepares a POST request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 422.
    * The api user verifies that the "message" information in the response body is "The type field is required. (and 3 more errors)".


  Scenario Outline: When a POST request with valid data (type, price, category_id, title, summary, description) is sent to the
  /api/addProduct endpoint with invalid (student or teacher) authorization credentials, it should be verified that the returned
  status code is 203, and the remark in the response body is "failed" with the message
  "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/addProduct" path parameters.
    * The api user prepares a POST request to send to the api addProduct endpoint containing the information "<type>", <price>, <category_id>, "<title>", "<summary>" and "<description>".
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | type    | price | category_id | title                                                 | summary                                                                        | description                                                                                                                                                                                                                                                                                                                                                                |
      | virtual | 100   | 2           | Introduction to Yoga: A Beginner's Guide Video Course | Discover the transformative power of yoga and embark on a journey to wellness. | Embark on a journey to holistic wellness with 'Introduction to Yoga: A Beginner's Guide.' This course covers basic poses, breathing techniques, and meditation, led by experienced instructors. Suitable for beginners and those looking to deepen their practice, you'll gain strength, flexibility, and inner peace. Join us to unlock the transformative power of yoga! |


  Scenario Outline: When a POST request with valid data (type, price, category_id, title, summary, description) is sent to the
  /api/addProduct endpoint with invalid (invalid token) authorization credentials, it should be verified that the returned status
  code is 401, and the message in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/addProduct" path parameters.
    * The api user prepares a POST request to send to the api addProduct endpoint containing the information "<type>", <price>, <category_id>, "<title>", "<summary>" and "<description>".
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | type    | price | category_id | title                                                 | summary                                                                        | description                                                                                                                                                                                                                                                                                                                                                                |
      | virtual | 100   | 2           | Introduction to Yoga: A Beginner's Guide Video Course | Discover the transformative power of yoga and embark on a journey to wellness. | Embark on a journey to holistic wellness with 'Introduction to Yoga: A Beginner's Guide.' This course covers basic poses, breathing techniques, and meditation, led by experienced instructors. Suitable for beginners and those looking to deepen their practice, you'll gain strength, flexibility, and inner peace. Join us to unlock the transformative power of yoga! |



