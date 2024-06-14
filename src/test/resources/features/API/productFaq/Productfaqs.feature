Feature: As an administrator, I want to access product FAQs via an API connection.

  Scenario Outline: Verify that when a GET request is sent to the /api/productfaqs endpoint with valid authentication credentials,
  the returned status code is 200 and the remark in the response body is "success". Additionally, verify the details
  (creator_id, product_id, order, created_at, id, product_faq_id, locale, title, answer) of the record with id (x) in the
  response body.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/productfaqs" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies the details of the record at the <dataIndex> index in the response body <creator_id>, <product_id>, <created_at>, <id>, <product_faq_id>, "<locale>", "<title>", and "<answer>".

    Examples:
      | dataIndex | creator_id | product_id | created_at | id | product_faq_id | locale | title                                                    | answer           |
      | 0         | 1349       | 10         | 1715347861 | 9  | 8              | en     | What payment methods do you accept for online purchases? | American Express |


  Scenario: Verify that when a GET request is sent to the /api/productfaqs endpoint with invalid (student or teacher) authentication
  credentials, the returned status code is 203, the remark field in the response body is "failed", and the message field is
  "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "student" token.
    * The api user sets "api/productfaqs" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


  Scenario: Verify that when a GET request is sent to the /api/productfaqs endpoint with invalid (invalid token) authentication
  credentials, the returned status code is 401 and the message field in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/productfaqs" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

