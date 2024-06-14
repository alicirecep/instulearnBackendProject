Feature: As an administrator, I want to access course categories via an API connection.

  Scenario Outline: When a GET request is sent to the /api/categories endpoint with valid authorization credentials, it should
  return a 200 status code, and the remark field in the response body should be "success". Additionally, details such as slug,
  parent_id, icon, order, title, id, category_id, locale, and title of the category specified by id(x) should be checked for accuracy.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/categories" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the information for the entry with the specified <dataIndex> in the response body includes "<slug>", "<icon>", <order>, <id>, <category_id>, "<locale>" and "<title>".

    Examples:
      | dataIndex | slug               | icon                                              | order | id | category_id | locale | title            |
      | 0         | Online-Education-2 | /store/1/default_images/categories_icons/code.png | 11    | 79 | 636         | en     | Online Education |
      | 1         | Online-Education   | /store/1/default_images/categories_icons/code.png | 10    | 78 | 635         | en     | Online Education |


  Scenario: When a GET request is sent to the /api/categories endpoint with invalid (student or teacher) authorization credentials,
  it should return a 203 status code. Additionally, it should be verified that the remark field in the response body is "failed"
  and the message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/categories" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


  Scenario: When a GET request is sent to the /api/categories endpoint with invalid (invalid token) authorization credentials,
  it should return a 401 status code. Additionally, it should be verified that the message field in the response body is
  "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/categories" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


