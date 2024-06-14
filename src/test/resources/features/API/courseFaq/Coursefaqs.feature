Feature: As an administrator, I want to access course FAQs via an API connection.

  Scenario Outline: When a GET request with valid authorization credentials is sent to the /api/coursefaqs endpoint, it should be
  verified that the status code is 200 and the remark information in the response body is "success". Additionally, when a GET request
  with valid authorization credentials is sent to the /api/coursefaqs endpoint, it should be confirmed that the FAQ information with
  the specified id value (creator_id, webinar_id, bundle_id, upcoming_course_id, order, created_at, updated_at, id, faq_id, locale,
  title, answer) in the response body is correct."

    * The api user constructs the base url with the "admin" token.
    * The api user sets "api/coursefaqs" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "remark" information in the response body is "success".
    * The api user verifies the <creator_id>, <webinar_id>, <created_at>, <updated_at>, <id>, <faq_id>, "<locale>", "<title>" and "<answer>" information of the item at the specified <dataIndex> index in the response body.

    Examples:
      | dataIndex | creator_id | webinar_id | created_at | updated_at | id | faq_id | locale | title                                                 | answer                                                                                                                                                                                                                                 |
      | 0         | 1016       | 1995       | 1624908798 | 1711967775 | 1  | 13     | en     | When does the course start and how long does it last? | The course is available for access anytime, and you can progress at your own pace. Typically, completion of the course may take anywhere from a few weeks to a few months, but it entirely depends on your personal pace and schedule. |


  Scenario: When a GET request with invalid (student or teacher) authorization credentials is sent to the /api/coursefaqs
  endpoint, it should be verified that the status code is 203, the remark information in the response body is "failed", and the
  message information is "To access this data, you must log in as a admin."

    * The api user constructs the base url with the "instructor" token.
    * The api user sets "api/coursefaqs" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "remark" information in the response body is "failed".
    * The api user verifies that the "data.message" information in the response body is "To access this data, you must log in as a admin.".


  Scenario: When a GET request with invalid (invalid token) authorization credentials is sent to the /api/coursefaqs endpoint,
  it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated."

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/coursefaqs" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


