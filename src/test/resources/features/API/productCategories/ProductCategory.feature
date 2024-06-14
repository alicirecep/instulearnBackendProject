Feature: As an administrator, I want to access detailed information about the product category with the specified ID via an API connection.

  Scenario Outline: When a valid authorization and correct data (id) are sent in a GET request to the /api/productCategory/{id}
  endpoint, the expected outcome should be a status code of 200 and the remark in the response body should be "success".
  Additionally, when a valid authorization and correct data (id) are sent in a GET request to the same endpoint, the
  correctness of the data in the response body (id, parent_id, icon, order, title, id, product_category_id, locale, title)
  should also be verified.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/productCategory/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies the content of the response body data <data_id>, "<icon>", <translations_id>, <product_category_id>, "<locale>" and "<title>".

    Examples:
      | id | data_id | icon                                              | translations_id | product_category_id | locale | title                 |
      | 30 | 30      | /store/1/default_images/categories_icons/code.png | 36              | 30                  | en     | Educational Equipment |


  Scenario Outline: When a valid authorization and a non-existent (id) are sent in a GET request, the response from the
  /api/productCategory/{id} endpoint should return a status code of 203, with the remark in the response body indicating "failed",
  and the message indicating "There is not product category for this id." This should be verified.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/productCategory/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not product category for this id.".

    Examples:
      | id    |
      | 22501 |


  Scenario: When a valid GET request without an (id) is sent to the /api/productCategory/{id} endpoint with proper authorization,
  the expected outcomes are: a status code of 203, a "failed" remark in the response body, and a message stating "No id"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/productCategory" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".


  Scenario Outline: When an invalid (student or teacher) authorization is used to send a GET request with correct data (id) to the
  /api/productCategory/{id} endpoint, the expected outcomes are: a status code of 203, a "failed" remark in the response body,
  and a message stating "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/productCategory/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | id |
      | 30 |


  Scenario Outline: When an invalid (invalid token) authorization is used to send a GET request with correct data (id) to the
  /api/productCategory/{id} endpoint, the expected outcomes are: a status code of 401 and a "Unauthenticated." message in the
  response body.

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/productCategory/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id |
      | 30 |

