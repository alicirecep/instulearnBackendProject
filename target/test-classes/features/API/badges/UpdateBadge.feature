Feature: As an administrator, I want to update the information of the badge with the specified ID via an API connection.

  Scenario Outline: When a PATCH request is sent to the /api/updateBadge/{id} endpoint with valid authorization and the correct
  {id}, the response should have a status code of 200. The response body must include remark as "success", Message as
  "Successfully Updated.", and the Updated Badge ID in the response body should match the id parameter. This allows verification
  of the updated badge record through the API.

    * The api user sends a POST request to the api "addBadge" endpoint to create a new "badge" record and records the "Added Badge ID" information.
    # Api kullanıcısı api "addBadge" endpointine POST isteği göndererek yeni bir "badge" kaydı oluşturur ve "Added Badge ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/updateBadge" path parameters.
    # Api kullanicisi "api/updateBadge/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<title>" and "<type>" information to send to the api updateBadge endpoint.
    # Api kullanicisi api updateBadge endpointine gondermek icin "<title>" ve "<type>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Updated.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Updated." oldugunu dogrular
    * The api user verifies that the "Updated Badge ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Updated Badge ID" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.translations[0].title" is "Expert Vendor" by sending a GET request to the "api" "badge" endpoint with the "Updated Badge ID" returned in the response body.
    # Api kullanicisi response bodyde donen "Updated Badge ID" ile "api" "badge" endpoint'ine GET request göndererek "title" bilgisinin "Expert Vendor" oldugunu dogrular

    Examples:
      | title         | type          |
      | Expert Vendor | register_date |