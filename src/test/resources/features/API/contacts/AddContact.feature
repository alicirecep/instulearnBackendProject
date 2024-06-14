Feature: As an administrator, I want to create a new contact record via an API connection.

  Scenario Outline: When a POST body containing valid data (name, email, phone, subject, message) is sent with valid authorization
  credentials to the /api/addContact endpoint, the returned status code is verified to be 200. Additionally, the remark field in
  the response body is "success", and the Message field is "Successfully Added." Furthermore, the Added Contact Message ID
  returned from the response body is used to verify the creation of the record through a GET request sent to the
  /api/contact/{id} endpoint in the API.

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addContact" path parameters.
    * The api user prepares a POST request containing the "<name>", "<email>", "<subject>" and "<message>" information to send to the api addContact endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "contact" endpoint with the "Added Contact Message ID" returned in the response body.

    Examples:
      | name       | email            | subject              | message              |
      | John Brown | jbrown@gmail.com | Test Contact Subject | Test Contact Message |


  Scenario Outline: When a POST body containing valid authorization credentials and an invalid email (email) is sent
  (with fields name, email, phone, subject, message), the returned status code is 422, and the message field in the
  response body is verified to be "The email must be a valid email address."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addContact" path parameters.
    * The api user prepares a POST request containing the "<name>", "<email>", "<subject>" and "<message>" information to send to the api addContact endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 422.
    * The api user verifies that the "message" information in the response body is "The email must be a valid email address.".

    Examples:
      | name       | email           | subject              | message              |
      | John Brown | jbrowngmail.com | Test Contact Subject | Test Contact Message |


  Scenario: When a POST request containing valid authorization credentials and no data is sent, the returned status code from the
  /api/addContact endpoint is verified to be 422. Additionally, the message field in the response body is confirmed to be
  "The name field is required. (and 4 more errors)"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/addContact" path parameters.
    * The api user prepares a POST request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 422.
    * The api user verifies that the "message" information in the response body is "The name field is required. (and 4 more errors)".


  Scenario Outline: When a POST body containing correct data (name, email, phone, subject, message) is sent with invalid
  (student or teacher) authorization credentials, the returned status code is verified to be 203. Additionally, the remark
  field in the response body is "failed", and the message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/addContact" path parameters.
    * The api user prepares a POST request containing the "<name>", "<email>", "<subject>" and "<message>" information to send to the api addContact endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".

    Examples:
      | name       | email            | subject              | message              |
      | John Brown | jbrown@gmail.com | Test Contact Subject | Test Contact Message |


  Scenario Outline: When a POST body containing correct data (name, email, phone, subject, message) is sent with invalid
  (invalid token) authorization credentials, the returned status code is verified to be 401, and the message field in the
  response body is confirmed to be "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/addContact" path parameters.
    * The api user prepares a POST request containing the "<name>", "<email>", "<subject>" and "<message>" information to send to the api addContact endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | name       | email            | subject              | message              |
      | John Brown | jbrown@gmail.com | Test Contact Subject | Test Contact Message |

