Feature: As an administrator, I want to access detailed information about the product FAQ with the specified ID via an API connection.

  Scenario Outline: Verify that when a GET request with valid authentication credentials and a correct (id) is sent to the
  /api/productfaq/{id} endpoint, the returned status code is 200 and the remark field in the response body is "success".
  Also, verify the (id, creator_id, product_id, order, created_at, id, product_faq_id, locale, title, answer) fields in the
  response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/productfaq/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies the content of the data <data_id>, <creator_id>, <product_id>, <created_at>, <translations_id>, <product_faq_id>, "<locale>", "<title>" and "<answer>" in the response body.

    Examples:
      | id | data_id | creator_id | product_id | created_at | translations_id | product_faq_id | locale | title            | answer           |
      | 16 | 16      | 1349       | 10         | 1717712325 | 17              | 16             | en     | online purchases | American Express |


  Scenario Outline: With valid credentials, when a GET request with a non-existing (id) is sent to the /api/productfaq/{id} endpoint,
  it verifies that the returned status code is 203, the remark field in the response body is "failed", and the message field is
  "There is not product faq for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/productfaq/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not product faq for this id.".

    Examples:
      | id    |
      | 74812 |


  Scenario: With valid credentials, when a GET request without an (id) is sent to the /api/productfaq/{id} endpoint, it verifies
  that the returned status code is 203, the remark field in the response body is "failed", and the message field is "No id"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/productfaq" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".


  Scenario Outline: With invalid (student or teacher) authentication credentials and a correct (id), when a GET request is sent to
  the /api/productfaq/{id} endpoint, it verifies that the returned status code is 203, the remark field in the response body is
  "failed", and the message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/productfaq/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | id |
      | 16 |


  Scenario Outline: With invalid (invalid token) authentication credentials and a correct (id), when a GET request is sent to the
  /api/productfaq/{id} endpoint, it verifies that the returned status code is 401 and the message field in the response body is
  "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/productfaq/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id |
      | 16 |



