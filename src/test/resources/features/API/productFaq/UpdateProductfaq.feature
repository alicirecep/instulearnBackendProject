Feature: As an administrator, I want to update the information of the product FAQ with the specified ID via an API connection.

  Scenario Outline: Verify that when a PATCH request with valid data and the correct (id) is sent, the returned status code is 200,
  the remark field in the response body is "success", and the Message field is "Successfully Updated.". Additionally, confirm that
  the updated Product Faq ID returned in the response body is the same as the id parameter in the /api/updateProductfaq/{id} endpoint,
  ensuring that the intended record has been updated. Finally, validate the update operation by sending a GET request to the
  /api/productfaq/{id} endpoint.

    * The api user sends a POST request to the api "addProductfaq" endpoint to create a new "productFaq" record and records the "Added Product Faq ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateProductfaq" path parameters.
    * The api user prepares a PATCH request to send to the api updateProductfaq endpoint, containing the "<title>", "<answer>" and <product_id> information.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    * The api user verifies that the "updated Product Faq ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.translations[0].title" is "What payment methods do you accept for online purchases?" by sending a GET request to the "api" "productfaq" endpoint with the "updated Product Faq ID" returned in the response body.

    Examples:
      | title                                                    | answer                                                                                                               | product_id |
      | What payment methods do you accept for online purchases? | We accept major credit cards such as Visa, Mastercard, and American Express, as well as PayPal for online purchases. | 20         |


  Scenario: When a PATCH request without data is sent to the /api/updateProductfaq/{id} endpoint with valid authentication
  credentials and correct (id), verify that the returned status code is 203, the remark field in the response body is "failed",
  and the message field is "There is no information to update."

    * The api user sends a POST request to the api "addProductfaq" endpoint to create a new "productFaq" record and records the "Added Product Faq ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateProductfaq" path parameters.
    * The api user prepares a PATCH request without containing any data.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "message" information in the response body is "There is no information to update.".


  Scenario Outline: When a PATCH request is sent to the /api/updateProductfaq/{id} endpoint with valid authentication credentials,
  correct data (title, answer, product_id), and a non-existing (id), verify that the returned status code is 203, the
  remark field in the response body is "failed", and the message field is "There is not product faq for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateProductfaq/<id>" path parameters.
    * The api user prepares a PATCH request to send to the api updateProductfaq endpoint, containing the "<title>", "<answer>" and <product_id> information.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not product faq for this id.".

    Examples:
      | id   | title                                                    | answer                                                                                                               | product_id |
      | 8417 | What payment methods do you accept for online purchases? | We accept major credit cards such as Visa, Mastercard, and American Express, as well as PayPal for online purchases. | 20         |


  Scenario Outline: When a PATCH request is sent to the /api/updateProductfaq/{id} endpoint with valid authentication credentials,
  but without an (id) and with correct data (title, answer, product_id), verify that the returned status code is 203, the remark
  field in the response body is "failed", and the message field is "No id"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateProductfaq" path parameters.
    * The api user prepares a PATCH request to send to the api updateProductfaq endpoint, containing the "<title>", "<answer>" and <product_id> information.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".

    Examples:
      | title                                                    | answer                                                                                                               | product_id |
      | What payment methods do you accept for online purchases? | We accept major credit cards such as Visa, Mastercard, and American Express, as well as PayPal for online purchases. | 20         |


  Scenario Outline: When a PATCH request with invalid (student or teacher) authentication credentials, but with correct (id)
  and data (title, answer, product_id), is sent to the /api/updateProductfaq/{id} endpoint, verify that the returned status code is
  203, the remark field in the response body is "failed", and the message field is "To access this data, you must log in as a admin."

    * The api user sends a POST request to the api "addProductfaq" endpoint to create a new "productFaq" record and records the "Added Product Faq ID" information.
    * The api user constructs the base url with the "student" token.
    * The api user sets "api/updateProductfaq" path parameters.
    * The api user prepares a PATCH request to send to the api updateProductfaq endpoint, containing the "<title>", "<answer>" and <product_id> information.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


    Examples:
      | title                                                    | answer                                                                                                               | product_id |
      | What payment methods do you accept for online purchases? | We accept major credit cards such as Visa, Mastercard, and American Express, as well as PayPal for online purchases. | 20         |


  Scenario Outline: When a PATCH request with invalid (invalid token) authentication credentials, but with correct (id) and data
  (title, answer, product_id), is sent to the /api/updateProductfaq/{id} endpoint, verify that the returned status code is 401
  and the message field in the response body is "Unauthenticated."

    * The api user sends a POST request to the api "addProductfaq" endpoint to create a new "productFaq" record and records the "Added Product Faq ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/updateProductfaq" path parameters.
    * The api user prepares a PATCH request to send to the api updateProductfaq endpoint, containing the "<title>", "<answer>" and <product_id> information.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | title                                                    | answer                                                                                                               | product_id |
      | What payment methods do you accept for online purchases? | We accept major credit cards such as Visa, Mastercard, and American Express, as well as PayPal for online purchases. | 20         |
