package stepdefinitions;

import config_Requirements.ConfigReader;
import hooks.HooksAPI;
import io.cucumber.java.en.Given;
import io.restassured.path.json.JsonPath;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.RequestBuilder;

import static org.junit.Assert.*;

public class API_Stepdefinitions {

    JsonPath jsonPath;
    String postRequestBody;
    String patchRequestBody;
    RequestBuilder builder = new RequestBuilder();

    @Given("The api user constructs the base url with the {string} token.")
    public void the_api_user_constructs_the_base_url_with_the_token(String userType) {
        HooksAPI.setUpApi(userType);
    }

    @Given("The api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        API_Methods.pathParam(pathParam);
    }

    // ******************************************* /api/courses ************************************************
    @Given("The api user sends a GET request and saves the returned response.")
    public void the_api_user_sends_a_get_request_and_saves_the_returned_response() {
        API_Methods.sendRequest("GET", null);
    }

    @Given("The api user verifies that the status code is {int}.")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        API_Methods.statusCodeAssert(code);
    }

    @Given("The api user confirms that the remark information in the response body is {string}.")
    public void the_api_user_confirms_that_the_remark_information_in_the_response_body_is(String remark) {
        API_Methods.assertBody("remark", remark);
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {int}, {int}, {string}, {int}, {string}, {int}, {int}, {int}, {string}, {string}, {string}, and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, int teacher_id, int creator_id, int category_id, String type, int privateValue, String slug, int duration, int id, int webinar_id, String locale, String title, String seo_description, String description) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(teacher_id, jsonPath.getInt("Added Course ID.webinars[" + dataIndex + "].teacher_id"));
        assertEquals(creator_id, jsonPath.getInt("Added Course ID.webinars[" + dataIndex + "].creator_id"));
        assertEquals(category_id, jsonPath.getInt("Added Course ID.webinars[" + dataIndex + "].category_id"));
        assertEquals(type, jsonPath.getString("Added Course ID.webinars[" + dataIndex + "].type"));
        assertEquals(privateValue, jsonPath.getInt("Added Course ID.webinars[" + dataIndex + "].private"));
        assertEquals(slug, jsonPath.getString("Added Course ID.webinars[" + dataIndex + "].slug"));
        assertNull(jsonPath.get("Added Course ID.webinars[" + dataIndex + "].start_date"));
        assertEquals(duration, jsonPath.getInt("Added Course ID.webinars[" + dataIndex + "].duration"));
        assertEquals(id, jsonPath.getInt("Added Course ID.webinars[" + dataIndex + "].translations[0].id"));
        assertEquals(webinar_id, jsonPath.getInt("Added Course ID.webinars[" + dataIndex + "].translations[0].webinar_id"));
        assertEquals(locale, jsonPath.getString("Added Course ID.webinars[" + dataIndex + "].translations[0].locale"));
        assertEquals(title, jsonPath.getString("Added Course ID.webinars[" + dataIndex + "].translations[0].title"));
        assertTrue(jsonPath.getString("Added Course ID.webinars[" + dataIndex + "].translations[0].seo_description").contains(seo_description));
        assertTrue(jsonPath.getString("Added Course ID.webinars[" + dataIndex + "].translations[0].description").contains(description));
    }

    @Given("The api user verifies that the message information in the response body is {string}")
    public void the_api_user_verifies_that_the_message_information_in_the_response_body_is(String message) {
        API_Methods.assertBody("data.message", message);
    }

    @Given("The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_get_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized() {
        assertTrue(API_Methods.tryCatchRequest("GET", null).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }
    // *********************************************************************************************************

    // ******************************************* /api/addCourse **********************************************
    @Given("The api user prepares a POST request to send to the api addCourse endpoint containing the information {string}, {string}, {string}, {string}, {int}, {int}, {int}, {string} and {int}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_add_course_endpoint_containing_the_information_and(String title, String type, String slug, String start_date, int duration, int capacity, int price, String description, int teacher_id) {
        postRequestBody = builder
                .addParameterForMap("title", title)
                .addParameterForMap("type", type)
                .addParameterForMap("slug", slug)
                .addParameterForMap("start_date", start_date)
                .addParameterForMap("duration", duration)
                .addParameterForMap("capacity", capacity)
                .addParameterForMap("price", price)
                .addParameterForMap("description", description)
                .addParameterForMap("teacher_id", teacher_id)
                .buildUsingMap();

        System.out.println("POST Request Body : " + postRequestBody);
    }

    @Given("The api user sends a POST request and saves the response returned from the api addCourse endpoint.")
    public void the_api_user_sends_a_post_request_and_saves_the_response_returned_from_the_api_add_course_endpoint() {
        API_Methods.sendRequest("POST", postRequestBody);
    }

    @Given("The api user verifies that the Message information in the response body is {string}")
    public void the_api_user_verifies_that_the_Message_information_in_the_response_body_is(String Message) {
        API_Methods.assertBody("Message", Message);
    }
    // *********************************************************************************************************

    // *************************************** /api/updateCourse/{id} ******************************************
    @Given("The api user prepares a PATCH request to send to the API updateCourse endpoint containing the information {int}, {int}, {int} and {string}.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_apı_update_course_endpoint_containing_the_information_and(int duration, int capacity, int price, String title) {
        patchRequestBody = builder
                .addParameterForJSONObject("duration", duration)
                .addParameterForJSONObject("capacity", capacity)
                .addParameterForJSONObject("price", price)
                .addParameterForJSONObject("title", title)
                .buildUsingJSONObject();

        System.out.println("PATCH Request Body : " + patchRequestBody);
    }

    @Given("The api user sends a PATCH request and saves the response returned from the API updateCourse endpoint.")
    public void the_api_user_sends_a_patch_request_and_saves_the_response_returned_from_the_apı_update_course_endpoint() {
        API_Methods.sendRequest("PATCH", patchRequestBody);
    }

    // *********************************************************************************************************
}
