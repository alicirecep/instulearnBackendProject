Feature: As an administrator, I want to delete the course category information with the specified ID via an API connection.

  Scenario Outline: When a DELETE request is sent with valid authorization credentials and the correct ID, it should be verified
  that the status code returned from the /api/deleteCategory/{id} endpoint is 200, the status field in the response body is "success",
  and the Message field is "Successfully Deleted." Additionally, the Deleted Category Id value received from the response body
  should match the ID specified in the path parameter of the /api/deleteCategory/{id} endpoint.

   #635 id'sini sil
    Examples:
      | id  |
      | 635 |


