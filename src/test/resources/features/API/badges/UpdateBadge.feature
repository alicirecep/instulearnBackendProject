Feature: As an administrator, I want to update the information of the badge with the specified ID via an API connection.

  Scenario Outline: When a PATCH request is sent to the /api/updateBadge/{id} endpoint with valid authorization and the correct
  {id}, the response should have a status code of 200. The response body must include remark as "success", Message as
  "Successfully Updated.", and the Updated Badge ID in the response body should match the id parameter. This allows verification
  of the updated badge record through the API.

    * The api user sends a POST request to the api "addBadge" endpoint to create a new "badge" record and records the "Added Badge ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateBadge" path parameters.
    * The api user prepares a PATCH request containing "<title>" and "<type>" information to send to the api updateBadge endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    * The api user verifies that the "Updated Badge ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.translations[0].title" is "Expert Vendor" by sending a GET request to the "api" "badge" endpoint with the "Updated Badge ID" returned in the response body.

    Examples:
      | title         | type          |
      | Expert Vendor | register_date |


  Scenario Outline: When a PATCH request is sent to the /api/updateBadge/{id} endpoint with valid authorization and id and an
  invalid type, the status code returned should be 203, the description in the response body should be "failed" and the Message
  should be "Type value is invalid. It must be register_date, course_count, course_rate, sale_count, support_rate,product_sale_count, make_topic, send_post_in_topic or instructor_blog."

    * The api user sends a POST request to the api "addBadge" endpoint to create a new "badge" record and records the "Added Badge ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateBadge" path parameters.
    * The api user prepares a PATCH request containing "<title>" and "<type>" information to send to the api updateBadge endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "Message" information in the response body is "Type value is invalid. It must be register_date, course_count, course_rate, sale_count, support_rate,product_sale_count, make_topic, send_post_in_topic or instructor_blog.".

    Examples:
      | title         | type |
      | Expert Vendor | xyz  |


  Scenario: When a PATCH request is sent to the /api/updateBadge/{id} endpoint without valid authorization information and data
  with the correct (id), the status code returned should be 203, the remark in the response body should be "failed" and the
  message should be "There is no information to update."

    * The api user sends a POST request to the api "addBadge" endpoint to create a new "badge" record and records the "Added Badge ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateBadge" path parameters.
    * The api user prepares a PATCH request without containing any data.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "message" information in the response body is "There is no information to update.".


  Scenario Outline: When a PATCH body containing an unregistered (id) and correct data (title, type) with valid authorization
  information is sent to the /api/updateBadge/{id} endpoint, the status code returned should be 203, the remark in the response
  body should be "failed" and the message should be "There is not badge for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateBadge/<id>" path parameters.
    * The api user prepares a PATCH request containing "<title>" and "<type>" information to send to the api updateBadge endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not badge for this id.".

    Examples:
      | id   | title         | type          |
      | 8547 | Expert Vendor | register_date |


  Scenario Outline: When a PATCH request is sent to the /api/updateBadge/{id} endpoint with valid authorization information
  (id) and correct data (title, type), the status code returned should be 203, the remark in the response body should be "failed"
  and the message should be "No id".

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateBadge" path parameters.
    * The api user prepares a PATCH request containing "<title>" and "<type>" information to send to the api updateBadge endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".

    Examples:
      | title         | type          |
      | Expert Vendor | register_date |


  Scenario Outline: When a PATCH request containing correct (id) and correct data (title, type) with invalid (student or teacher)
  authorization information is sent to the /api/updateBadge/{id} endpoint, the status code returned should be 203, the remark
  in the response body should be "failed" and the message should be "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addBadge" endpoint to create a new "badge" record and records the "Added Badge ID" information.
    * The api user constructs the base url with the "student" token.
    * The api user sets "api/updateBadge" path parameters.
    * The api user prepares a PATCH request containing "<title>" and "<type>" information to send to the api updateBadge endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | title         | type          |
      | Expert Vendor | register_date |


  Scenario Outline: When a PATCH request is sent to the /api/updateBadge/{id} endpoint with invalid token authorization
  information and correct (id) and correct data (title, type), the status code returned should be 401 and the message in
  the response body should be "Unauthenticated.".

    * The api user sends a POST request to the api "addBadge" endpoint to create a new "badge" record and records the "Added Badge ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/updateBadge" path parameters.
    * The api user prepares a PATCH request containing "<title>" and "<type>" information to send to the api updateBadge endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | title         | type          |
      | Expert Vendor | register_date |


