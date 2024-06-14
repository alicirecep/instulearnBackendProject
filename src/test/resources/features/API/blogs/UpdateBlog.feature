Feature: As an administrator or teacher, I want to update the information of the blog with the specified ID via an API connection.

  Scenario Outline: When a PATCH request is sent to the /api/updateBlog/{id} endpoint with valid credentials and correct data,
  it verifies that the returned status code is 200, and the remark in the response body is "success" with the Message stating
  "Successfully Updated." Additionally, it verifies that the Updated Blog Id returned in the response body is the same as the id
  parameter specified in the /api/updateBlog/{id} endpoint. The update of the desired blog record via the API can be confirmed.
  By sending a GET request to the /api/blog/{id} endpoint with the Updated Blog Id returned in the response body, the update of
  the record can be verified.

    * The api user sends a POST request to the api "addBlog" endpoint to create a new "blog" record and records the "Added Blog ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateBlog" path parameters.
    * The api user prepares a PATCH request to send to the api updateBlog endpoint with the "<title>", <category_id>, "<description>" and "<content>" information.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    * The api user verifies that the "Updated Blog Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "data.translations[0].title" is "Online Education" by sending a GET request to the "api" "blog" endpoint with the "Updated Blog Id" returned in the response body.

    Examples:
      | title            | category_id | description                                                                                       | content                                                                                                                                                                                                                                                                                                   |
      | Online Education | 34          | Online education has rapidly evolved from a niche alternative to a mainstream method of learning. | Accessibility Through MOOCs:Massive Open Online Courses (MOOCs) pioneered accessible online learning, offering high-quality courses from prestigious universities to a global audience. Platforms like Coursera and edX made education more inclusive, breaking down geographical and financial barriers. |


  Scenario: Verify that a PATCH request to the /api/updateBlog/{id} endpoint with valid credentials, a correct (id), but no data
  returns a status code of 203. The response body should have the remark field as "failed" and the message field as
  "There is no information to update."

    * The api user sends a POST request to the api "addBlog" endpoint to create a new "blog" record and records the "Added Blog ID" information.
    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateBlog" path parameters.
    * The api user prepares a PATCH request without containing any data.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "message" information in the response body is "There is no information to update.".


  Scenario Outline: Verify that a PATCH request to the /api/updateBlog/{id} endpoint with valid credentials, a non-existent (id),
  and correct data (title, category_id, description, content) returns a status code of 203. The response body should have the
  remark field as "failed" and the message field as "There is not blog for this id."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateBlog/<id>" path parameters.
    * The api user prepares a PATCH request to send to the api updateBlog endpoint with the "<title>", <category_id>, "<description>" and "<content>" information.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "There is not blog for this id.".

    Examples:
      | id      | title            | category_id | description                                                                                       | content                                                                                                                                                                                                                                                                                                   |
      | 2351147 | Online Education | 34          | Online education has rapidly evolved from a niche alternative to a mainstream method of learning. | Accessibility Through MOOCs:Massive Open Online Courses (MOOCs) pioneered accessible online learning, offering high-quality courses from prestigious universities to a global audience. Platforms like Coursera and edX made education more inclusive, breaking down geographical and financial barriers. |


  Scenario Outline: Verify that a PATCH request to the /api/updateBlog/{id} endpoint with valid credentials, no (id), and correct
  data (title, category_id, description, content) returns a status code of 203. The response body should have the remark field as
  "failed" and the message field as "No id"

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/updateBlog" path parameters.
    * The api user prepares a PATCH request to send to the api updateBlog endpoint with the "<title>", <category_id>, "<description>" and "<content>" information.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "No id".

    Examples:
      | title            | category_id | description                                                                                       | content                                                                                                                                                                                                                                                                                                   |
      | Online Education | 34          | Online education has rapidly evolved from a niche alternative to a mainstream method of learning. | Accessibility Through MOOCs:Massive Open Online Courses (MOOCs) pioneered accessible online learning, offering high-quality courses from prestigious universities to a global audience. Platforms like Coursera and edX made education more inclusive, breaking down geographical and financial barriers. |


  Scenario Outline: Verify that a PATCH request to the /api/updateBlog/{id} endpoint with invalid (student) authorization
  credentials, a correct (id), and correct data (title, category_id, description, content) returns a status code of 203.
  The response body should have the remark field as "failed" and the message field as
  "To access this data, you must log in as a teacher or admin."

    * The api user sends a POST request to the api "addBlog" endpoint to create a new "blog" record and records the "Added Blog ID" information.
    * The api user constructs the base url with the "student" token.
    * The api user sets "api/updateBlog" path parameters.
    * The api user prepares a PATCH request to send to the api updateBlog endpoint with the "<title>", <category_id>, "<description>" and "<content>" information.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a teacher or admin.".

    Examples:
      | title            | category_id | description                                                                                       | content                                                                                                                                                                                                                                                                                                   |
      | Online Education | 34          | Online education has rapidly evolved from a niche alternative to a mainstream method of learning. | Accessibility Through MOOCs:Massive Open Online Courses (MOOCs) pioneered accessible online learning, offering high-quality courses from prestigious universities to a global audience. Platforms like Coursera and edX made education more inclusive, breaking down geographical and financial barriers. |


  Scenario Outline: Verify that a PATCH request to the /api/updateBlog/{id} endpoint with invalid (invalid token) authorization
  credentials, a correct (id), and correct data (title, category_id, description, content) returns a status code of 401.
  The response body should have the message field as "Unauthenticated."

    * The api user sends a POST request to the api "addBlog" endpoint to create a new "blog" record and records the "Added Blog ID" information.
    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/updateBlog" path parameters.
    * The api user prepares a PATCH request to send to the api updateBlog endpoint with the "<title>", <category_id>, "<description>" and "<content>" information.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | title            | category_id | description                                                                                       | content                                                                                                                                                                                                                                                                                                   |
      | Online Education | 34          | Online education has rapidly evolved from a niche alternative to a mainstream method of learning. | Accessibility Through MOOCs:Massive Open Online Courses (MOOCs) pioneered accessible online learning, offering high-quality courses from prestigious universities to a global audience. Platforms like Coursera and edX made education more inclusive, breaking down geographical and financial barriers. |

