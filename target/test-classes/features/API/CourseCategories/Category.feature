Feature: As an administrator, I want to access detailed information about the course category with the specified ID via an API connection.

  Scenario Outline: When a GET request is sent to the /api/category/{id} endpoint with valid authorization and correct data (id),
  it should be verified that the returned status code is 200 and that the remark information in the response body is "success".
  Additionally, it should be tested to confirm that the id, slug, parent_id, icon, order, title, id, category_id, locale and title data in
  the response body are accurate.

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/category/<id>" path parameters.
    # Api kullanicisi "api/category/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user confirms that the remark information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the data in the response body includes <data_id>, "<slug>", "<icon>", <order>, <translations_id>, <category_id>, "<locale>" and "<title>".
    # Api kullanicisi response bodydeki data <data_id>, "<slug>", "<icon>", <order>, <translations_id>, <category_id>, "<locale>" ve "<title>" içeriklerini doğrular.

    Examples:
      | id  | data_id | slug               | icon                                              | order | translations_id | category_id | locale | title            |
      | 636 | 636     | Online-Education-2 | /store/1/default_images/categories_icons/code.png | 11    | 79              | 636         | en     | Online Education |

  @API
  Scenario Outline: When a GET request is sent to the /api/category/{id} endpoint with valid authorization credentials and a
  non-existent (id), the expected status code should be 203. The remark information in the response body should be verified as
  "failed", and the message information should be "There is not category for this id."

    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/category/<id>" path parameters.
    # Api kullanicisi "api/category/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user confirms that the remark information in the response body is "failed".
    # Api kullanicisi response bodydeki remark bilgisinin "failed" oldugunu dogrular
    * The api user verifies that the message information in the response body is "There is not category for this id."
    # Api kullanicisi response bodydeki message bilgisinin "There is not category for this id." oldugunu dogrular

    Examples:
      | id    |
      | 25416 |



