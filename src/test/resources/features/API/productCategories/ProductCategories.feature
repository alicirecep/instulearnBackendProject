Feature: As an administrator, I want to access product categories via an API connection.

  Scenario Outline: When a GET request is sent to the /api/productCategories endpoint with valid authorization credentials,
  the status code returned is verified to be 200, and the remark in the response body is confirmed to be "success".
  Additionally, when a GET request is sent to the /api/productCategories endpoint with valid authorization credentials and an ID (x),
  the information returned in the response body (parent_id, icon, order, id, product_category_id, locale, title) is verified.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/productCategories" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies the "<icon>", <id>, <product_category_id>, "<locale>" and "<title>" information for the <dataIndex> index in the response body.


    Examples:
      | dataIndex | icon                                              | id | product_category_id | locale | title                 |
      | 1         | /store/1/default_images/categories_icons/code.png | 37 | 31                  | en     | Online Education      |
      | 2         | /store/1/default_images/categories_icons/code.png | 36 | 30                  | en     | Educational Equipment |


  Scenario: When a GET request is sent to the /api/productCategories endpoint with invalid (student or teacher) authorization
  credentials, the expected result should be a status code of 203. The remark in the response body should be "failed" and
  the message should be "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    * The api user sets "api/productCategories" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


  Scenario: When a GET request is sent to the /api/productCategories endpoint with invalid (invalid token) authorization
  credentials, the expected result should be a status code of 401. The message in the response body should be "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/productCategories" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

