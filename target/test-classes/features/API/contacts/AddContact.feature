Feature: As an administrator, I want to create a new contact record via an API connection.

  Scenario Outline: When a POST body containing valid data (name, email, phone, subject, message) is sent with valid authorization
  credentials to the /api/addContact endpoint, the returned status code is verified to be 200. Additionally, the remark field in
  the response body is "success", and the Message field is "Successfully Added." Furthermore, the Added Contact Message ID
  returned from the response body is used to verify the creation of the record through a GET request sent to the
  /api/contact/{id} endpoint in the API.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addContact" path parameters.
    # Api kullanicisi "api/addContact" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<name>", "<email>", "<subject>" and "<message>" information to send to the api addContact endpoint.
    # Api kullanicisi api addContact endpointine gondermek icin "<name>", "<email>", <phone>, "<subject>" ve "<message>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Added.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Added." oldugunu dogrular
    * The api user verifies that the "remark" is "success" by sending a GET request to the "api" "contact" endpoint with the "Added Contact Message ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Added Contact Message ID" ile "api" "contact" endpoint'ine GET request göndererek "remark" bilgisinin "success" oldugunu dogrular

    Examples:
      | name       | email            | subject              | message              |
      | John Brown | jbrown@gmail.com | Test Contact Subject | Test Contact Message |


  Scenario Outline: When a POST body containing valid authorization credentials and an invalid email (email) is sent
  (with fields name, email, phone, subject, message), the returned status code is 422, and the message field in the
  response body is verified to be "The email must be a valid email address."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addContact" path parameters.
    # Api kullanicisi "api/addContact" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<name>", "<email>", "<subject>" and "<message>" information to send to the api addContact endpoint.
    # Api kullanicisi api addContact endpointine gondermek icin "<name>", "<email>", <phone>, "<subject>" ve "<message>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The email must be a valid email address.".
    # Api kullanicisi response bodydeki message bilgisinin "The email must be a valid email address." oldugunu dogrular

    Examples:
      | name       | email           | subject              | message              |
      | John Brown | jbrowngmail.com | Test Contact Subject | Test Contact Message |


  Scenario: When a POST request containing valid authorization credentials and no data is sent, the returned status code from the
  /api/addContact endpoint is verified to be 422. Additionally, the message field in the response body is confirmed to be
  "The name field is required. (and 4 more errors)"

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/addContact" path parameters.
    # Api kullanicisi "api/addContact" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 422.
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "The name field is required. (and 4 more errors)".
    # Api kullanicisi response bodyde dönen message bilgisinin "The name field is required. (and 4 more errors)" oldugunu dogrular


  Scenario Outline: When a POST body containing correct data (name, email, phone, subject, message) is sent with invalid
  (student or teacher) authorization credentials, the returned status code is verified to be 203. Additionally, the remark
  field in the response body is "failed", and the message field is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    # Api kullanicisi "instructor" token ile base urli olusturur
    * The api user sets "api/addContact" path parameters.
    # Api kullanicisi "api/addContact" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<name>", "<email>", "<subject>" and "<message>" information to send to the api addContact endpoint.
    # Api kullanicisi api addContact endpointine gondermek icin "<name>", "<email>", <phone>, "<subject>" ve "<message>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".
    # Api kullanicisi response bodydeki message bilgisinin "To access this data, you must log in as a admin." oldugunu dogrular

    Examples:
      | name       | email            | subject              | message              |
      | John Brown | jbrown@gmail.com | Test Contact Subject | Test Contact Message |


  Scenario Outline: When a POST body containing correct data (name, email, phone, subject, message) is sent with invalid
  (invalid token) authorization credentials, the returned status code is verified to be 401, and the message field in the
  response body is confirmed to be "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addContact" path parameters.
    # Api kullanicisi "api/addContact" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<name>", "<email>", "<subject>" and "<message>" information to send to the api addContact endpoint.
    # Api kullanicisi api addContact endpointine gondermek icin "<name>", "<email>", <phone>, "<subject>" ve "<message>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodyde dönen message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | name       | email            | subject              | message              |
      | John Brown | jbrown@gmail.com | Test Contact Subject | Test Contact Message |

