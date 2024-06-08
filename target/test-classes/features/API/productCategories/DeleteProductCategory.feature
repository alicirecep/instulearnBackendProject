Feature: As an administrator, I want to delete the product category information with the specified ID via an API connection.

  Scenario: Verify that when a DELETE request with valid authentication credentials and correct id is sent, the returned status
  code is 200, the remark in the response body is "success", and the Message is "Successfully Deleted." Also, confirm that the
  Deleted Product Category Id in the response body is the same as the id parameter in the /api/deleteProductCategory/{id} endpoint,
  and ensure that the record is successfully deleted via the API. Finally, verify the deletion by sending a GET request to the
  /api/productCategory/{id} endpoint to confirm that the record has been deleted.

    * The api user sends a POST request to the api "addProductCategory" endpoint to create a new "productCategory" record and records the "Added Category ID" information.
    # Api kullanıcısı api "addProductCategory" endpointine POST isteği göndererek yeni bir "productCategory" kaydı oluşturur ve "Added Category ID" bilgisini kaydeder.
    * The api user constructs the base url with the "admin" token.
    # Api kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/deleteProductCategory" path parameters.
    # Api kullanicisi "api/deleteProductCategory/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "remark" information in the response body is "success".
    # Api kullanicisi response bodydeki remark bilgisinin "success" oldugunu dogrular
    * The api user verifies that the "Message" information in the response body is "Successfully Deleted.".
    # Api kullanicisi response bodydeki Message bilgisinin "Successfully Deleted." oldugunu dogrular
    * The api user verifies that the "Deleted Product Category Id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "Deleted Product Id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "data.message" is "There is not product category for this id." by sending a GET request to the "api" "productCategory" endpoint with the "Deleted Product Category Id" returned in the response body.
    # Api kullanicisi response bodyde donen "Deleted Product Category Id" ile "api" "productCategory" endpoint'ine GET request göndererek "message" bilgisinin "There is not product category for this id." oldugunu dogrular











