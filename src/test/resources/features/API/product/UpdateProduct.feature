Feature: As an administrator, I want to update the information of the product with the specified ID via an API connection.

  Scenario Outline: When a valid update request with proper authorization and correct (id) is sent to the /api/updateProduct/{id}
  endpoint, the expected outcomes are: a status code of 200, a "success" remark in the response body, and a message stating
  "Successfully Updated." Furthermore, within the response body of the same request, the id of the updated product should
  match the id parameter specified in the endpoint. This ensures that the product record intended to be updated has indeed
  been modified via the API.

    * The api user sends a POST request to the api "addProduct" endpoint to create a new "product" record and records the "Added Product ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateProduct" path parameters.
    * The api user prepares a PATCH request to the api updateProduct endpoint containing the following information "<type>", <price>, <category_id>, "<title>", "<summary>" and "<description>"
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    * The api user verifies that the "Updated Product ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.translations[0].title" is "Introduction to Yoga: A Beginner's Guide Video Course" by sending a GET request to the "api" "product" endpoint with the "Updated Product ID" returned in the response body.

    Examples:
      | type    | price | category_id | title                                                 | summary                                                                        | description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | virtual | 150   | 2           | Introduction to Yoga: A Beginner's Guide Video Course | Discover the transformative power of yoga and embark on a journey to wellness. | Are you ready to embark on a journey to holistic wellness? 'Introduction to Yoga: A Beginner's Guide' is designed for individuals who want to explore the ancient practice of yoga and reap its numerous benefits. In this comprehensive course, you will learn the fundamentals of yoga, including basic poses, breathing techniques, and meditation practices. Led by experienced yoga instructors, you will develop strength, flexibility, and inner peace as you progress through the course. Whether you're a complete beginner or looking to deepen your practice, this course will empower you to cultivate a healthier mind, body, and spirit. Join us and unlock the transformative power of yoga today! |


  Scenario: When a PATCH request with valid authorization details and a correct (id) but no data is sent to the
  /api/updateProduct/{id} endpoint, it should be verified that the status code is 203, the remark in the response body is
  "failed" and the message is "There is no information to update."

    * The api user sends a POST request to the api "addProduct" endpoint to create a new "product" record and records the "Added Product ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateProduct" path parameters.
    * The api user prepares a PATCH request without containing any data.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "message" information in the response body is "There is no information to update.".



  Scenario Outline: When a PATCH request with valid authorization details, an invalid (id), and correct data is sent to the
  /api/updateProduct/{id} endpoint, it should be verified that the status code is 203, the remark in the response body is
  "failed" and the message is "There is not product for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateProduct/<id>" path parameters.
    * The api user prepares a PATCH request to the api updateProduct endpoint containing the following information "<type>", <price>, <category_id>, "<title>", "<summary>" and "<description>"
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not product for this id.".

    Examples:
      | id    | type    | price | category_id | title                                                 | summary                                                                        | description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | 54125 | virtual | 150   | 2           | Introduction to Yoga: A Beginner's Guide Video Course | Discover the transformative power of yoga and embark on a journey to wellness. | Are you ready to embark on a journey to holistic wellness? 'Introduction to Yoga: A Beginner's Guide' is designed for individuals who want to explore the ancient practice of yoga and reap its numerous benefits. In this comprehensive course, you will learn the fundamentals of yoga, including basic poses, breathing techniques, and meditation practices. Led by experienced yoga instructors, you will develop strength, flexibility, and inner peace as you progress through the course. Whether you're a complete beginner or looking to deepen your practice, this course will empower you to cultivate a healthier mind, body, and spirit. Join us and unlock the transformative power of yoga today! |


  Scenario Outline: When a PATCH request with valid authorization details, does not include an (id), and contains correct data
  (type, price, category_id, title, summary, description) is sent to the /api/updateProduct/{id} endpoint, it should be verified that
  the status code is 203, the remark in the response body is "failed" and the message is "No id"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateProduct" path parameters.
    * The api user prepares a PATCH request to the api updateProduct endpoint containing the following information "<type>", <price>, <category_id>, "<title>", "<summary>" and "<description>"
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".

    Examples:
      | type    | price | category_id | title                                                 | summary                                                                        | description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | virtual | 150   | 2           | Introduction to Yoga: A Beginner's Guide Video Course | Discover the transformative power of yoga and embark on a journey to wellness. | Are you ready to embark on a journey to holistic wellness? 'Introduction to Yoga: A Beginner's Guide' is designed for individuals who want to explore the ancient practice of yoga and reap its numerous benefits. In this comprehensive course, you will learn the fundamentals of yoga, including basic poses, breathing techniques, and meditation practices. Led by experienced yoga instructors, you will develop strength, flexibility, and inner peace as you progress through the course. Whether you're a complete beginner or looking to deepen your practice, this course will empower you to cultivate a healthier mind, body, and spirit. Join us and unlock the transformative power of yoga today! |


  Scenario Outline: When a PATCH request with invalid (student or teacher) authorization credentials, correct (id), and valid data
  (type, price, category_id, title, summary, description) is sent to the /api/updateProduct/{id} endpoint, it should be verified
  that the status code is 203, the remark in the response body is "failed" and the message is
  "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addProduct" endpoint to create a new "product" record and records the "Added Product ID" information.
    * The api user constructs the base url with the "student" token.
    * The api user sets "api/updateProduct" path parameters.
    * The api user prepares a PATCH request to the api updateProduct endpoint containing the following information "<type>", <price>, <category_id>, "<title>", "<summary>" and "<description>"
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | type    | price | category_id | title                                                 | summary                                                                        | description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | virtual | 150   | 2           | Introduction to Yoga: A Beginner's Guide Video Course | Discover the transformative power of yoga and embark on a journey to wellness. | Are you ready to embark on a journey to holistic wellness? 'Introduction to Yoga: A Beginner's Guide' is designed for individuals who want to explore the ancient practice of yoga and reap its numerous benefits. In this comprehensive course, you will learn the fundamentals of yoga, including basic poses, breathing techniques, and meditation practices. Led by experienced yoga instructors, you will develop strength, flexibility, and inner peace as you progress through the course. Whether you're a complete beginner or looking to deepen your practice, this course will empower you to cultivate a healthier mind, body, and spirit. Join us and unlock the transformative power of yoga today! |


  Scenario Outline: When a PATCH request with invalid (invalid token) authorization credentials, correct (id), and valid data
  (type, price, category_id, title, summary, description) is sent to the /api/updateProduct/{id} endpoint, it should be verified
  that the status code is 401 and the message in the response body is "Unauthenticated."

    * The api user sends a POST request to the api "addProduct" endpoint to create a new "product" record and records the "Added Product ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/updateProduct" path parameters.
    * The api user prepares a PATCH request to the api updateProduct endpoint containing the following information "<type>", <price>, <category_id>, "<title>", "<summary>" and "<description>"
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      |  type    | price | category_id | title                                                 | summary                                                                        | description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | virtual | 150   | 2           | Introduction to Yoga: A Beginner's Guide Video Course | Discover the transformative power of yoga and embark on a journey to wellness. | Are you ready to embark on a journey to holistic wellness? 'Introduction to Yoga: A Beginner's Guide' is designed for individuals who want to explore the ancient practice of yoga and reap its numerous benefits. In this comprehensive course, you will learn the fundamentals of yoga, including basic poses, breathing techniques, and meditation practices. Led by experienced yoga instructors, you will develop strength, flexibility, and inner peace as you progress through the course. Whether you're a complete beginner or looking to deepen your practice, this course will empower you to cultivate a healthier mind, body, and spirit. Join us and unlock the transformative power of yoga today! |


