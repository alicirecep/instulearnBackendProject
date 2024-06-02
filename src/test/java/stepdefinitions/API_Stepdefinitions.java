package stepdefinitions;

import com.google.gson.Gson;
import config_Requirements.ConfigReader;
import hooks.HooksAPI;
import io.cucumber.java.en.Given;
import io.restassured.path.json.JsonPath;
import pojos.PricePlanPojo;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.RequestBuilder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.*;

public class API_Stepdefinitions {

    JsonPath jsonPath;
    String requestBody;
    RequestBuilder builder = new RequestBuilder();
    HashMap<String, Object> responseMap;
    PricePlanPojo pricePlanPojo;
    Gson gson = new Gson(); // Gson kütüphanesini kullanarak bir POJO nesnesini JSON formatında bir Stringe dönüştürebilirsiniz.

    @Given("The api user constructs the base url with the {string} token.")
    public void the_api_user_constructs_the_base_url_with_the_token(String userType) {
        HooksAPI.setUpApi(userType);
    }

    @Given("The api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        API_Methods.pathParam(pathParam);
    }

    // ******************************************* /api/courses ************************************************
    @Given("The api user sends a {string} request and saves the returned response.")
    public void the_api_user_sends_a_request_and_saves_the_returned_response(String httpMethod) {
        API_Methods.sendRequest(httpMethod, null);
    }

    @Given("The api user verifies that the status code is {int}.")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        API_Methods.statusCodeAssert(code);
    }

    @Given("The api user verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        API_Methods.assertBody(key, value);
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {int}, {int}, {string}, {int}, {string}, {int}, {int}, {int}, {string}, {string}, {string}, and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, int teacher_id, int creator_id, int category_id, String type, int privateValue, String slug, int duration, int id, int webinar_id, String locale, String title, String seo_description, String description) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(teacher_id, jsonPath.getInt("AddedCourseID.webinars[" + dataIndex + "].teacher_id"));
        assertEquals(creator_id, jsonPath.getInt("AddedCourseID.webinars[" + dataIndex + "].creator_id"));
        assertEquals(category_id, jsonPath.getInt("AddedCourseID.webinars[" + dataIndex + "].category_id"));
        assertEquals(type, jsonPath.getString("AddedCourseID.webinars[" + dataIndex + "].type"));
        assertEquals(privateValue, jsonPath.getInt("AddedCourseID.webinars[" + dataIndex + "].private"));
        assertEquals(slug, jsonPath.getString("AddedCourseID.webinars[" + dataIndex + "].slug"));
        assertNull(jsonPath.get("AddedCourseID.webinars[" + dataIndex + "].start_date"));
        assertEquals(duration, jsonPath.getInt("AddedCourseID.webinars[" + dataIndex + "].duration"));
        assertEquals(id, jsonPath.getInt("AddedCourseID.webinars[" + dataIndex + "].translations[0].id"));
        assertEquals(webinar_id, jsonPath.getInt("AddedCourseID.webinars[" + dataIndex + "].translations[0].webinar_id"));
        assertEquals(locale, jsonPath.getString("AddedCourseID.webinars[" + dataIndex + "].translations[0].locale"));
        assertEquals(title, jsonPath.getString("AddedCourseID.webinars[" + dataIndex + "].translations[0].title"));
        assertTrue(jsonPath.getString("AddedCourseID.webinars[" + dataIndex + "].translations[0].seo_description").contains(seo_description));
        assertTrue(jsonPath.getString("AddedCourseID.webinars[" + dataIndex + "].translations[0].description").contains(description));
    }

    @Given("The api user sends a {string} request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String httpMethod) {
        assertEquals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api"), API_Methods.tryCatchRequest(httpMethod, null));
    }
    // *********************************************************************************************************

    // ***************************************** /api/course/{id} **********************************************
    @Given("The API user verifies that the data in the response body includes {int}, {int}, {int}, {int}, {string}, {int}, {string}, {int}, {int}, {int}, {int}, {string}, {string}, {string} and {string}.")
    public void the_apı_user_verifies_that_the_data_in_the_response_body_includes_and(int data_id, int teacher_id, int creator_id, int category_id, String type, int valuePrivate, String slug, int start_date, int duration, int translations_id, int webinar_id, String locale, String title, String seo_description, String description) {
        API_Methods.response.then()
                .assertThat()
                .body("data.id", equalTo(data_id),
                        "data.teacher_id", equalTo(teacher_id),
                        "data.creator_id", equalTo(creator_id),
                        "data.category_id", equalTo(category_id),
                        "data.type", equalTo(type),
                        "data.private", equalTo(valuePrivate),
                        "data.slug", equalTo(slug),
                        "data.start_date", equalTo(start_date),
                        "data.duration", equalTo(duration),
                        "data.translations[0].id", equalTo(translations_id),
                        "data.translations[0].webinar_id", equalTo(webinar_id),
                        "data.translations[0].locale", equalTo(locale),
                        "data.translations[0].title", equalTo(title),
                        "data.translations[0].seo_description", equalTo(seo_description),
                        "data.translations[0].description", containsString(description));
    }
    // *********************************************************************************************************

    // ******************************************* /api/addCourse **********************************************
    @Given("The api user prepares a POST request to send to the api addCourse endpoint containing the information {string}, {string}, {string}, {string}, {int}, {int}, {int}, {string} and {int}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_add_course_endpoint_containing_the_information_and(String title, String type, String slug, String start_date, int duration, int capacity, int price, String description, int teacher_id) {
        requestBody = builder
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

        System.out.println("POST Request Body : " + requestBody);
    }

    @Given("The api user sends a {string} request body and saves the returned response.")
    public void the_api_user_sends_a_request_body_and_saves_the_returned_response(String httpMethod) {
        API_Methods.sendRequest(httpMethod, requestBody);
    }

    @Given("The api user prepares a POST request to send to the api addCourse endpoint containing the information {string}, {string}, {string}, {string}, {int}, {int}, {int} and {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_add_course_endpoint_containing_the_information_and(String title, String type, String slug, String start_date, int duration, int capacity, int price, String description) {
        requestBody = builder
                .addParameterForMap("title", title)
                .addParameterForMap("type", type)
                .addParameterForMap("slug", slug)
                .addParameterForMap("start_date", start_date)
                .addParameterForMap("duration", duration)
                .addParameterForMap("capacity", capacity)
                .addParameterForMap("price", price)
                .addParameterForMap("description", description)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }

    @Given("The api user prepares a POST request that contains no data.")
    public void the_api_user_prepares_a_post_request_that_contains_no_data() {
        requestBody = builder.buildUsingMap();
    }
    // *********************************************************************************************************

    // *************************************** /api/updateCourse/{id} ******************************************
    @Given("The api user prepares a PATCH request to send to the API updateCourse endpoint containing the information {int}, {int}, {int} and {string}.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_apı_update_course_endpoint_containing_the_information_and(int duration, int capacity, int price, String title) {
        requestBody = builder
                .addParameterForJSONObject("duration", duration)
                .addParameterForJSONObject("capacity", capacity)
                .addParameterForJSONObject("price", price)
                .addParameterForJSONObject("title", title)
                .buildUsingJSONObject();

        System.out.println("PATCH Request Body : " + requestBody);
    }

    @Given("The api user prepares a PATCH request without containing any data.")
    public void the_api_user_prepares_a_patch_request_without_containing_any_data() {
        requestBody = builder.buildUsingJSONObject();
    }

    @Given("The api user sends a {string} request, saves the response, and verifies that the status code is '401' with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_request_saves_the_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String httpMethod) {
        assertEquals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api"), API_Methods.tryCatchRequest(httpMethod, requestBody));
    }

    @Given("The api user verifies that the {string} information in the returned response body is the same as the id path parameter written in the endpoint.")
    public void the_api_user_verifies_that_the_information_in_the_returned_response_body_is_the_same_as_the_id_path_parameter_written_in_the_endpoint(String reponseId) {
        responseMap = API_Methods.response.as(HashMap.class);

        Object idValue = responseMap.get(reponseId);

        int id = 0;
        if (idValue instanceof String) {
            id = Integer.parseInt((String) idValue);
        } else {
            id = (int) idValue;
        }
        assertEquals(API_Methods.id, id);
    }

    @Given("The api user confirms that the title information in the response body is {string}.")
    public void the_api_user_confirms_that_the_title_information_in_the_response_body_is(String titleValue) {
        API_Methods.response.then()
                .assertThat()
                .body("data.translations[0].title", equalTo(titleValue));
    }
    // ************************************************************************************************************

    // ******************************************* /api/categories ************************************************
    @Given("The api user verifies that the information for the entry with the specified {int} in the response body includes {string}, {string}, {int}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_that_the_information_for_the_entry_with_the_specified_in_the_response_body_includes_and(int dataIndex, String slug, String icon, int order, int id, int category_id, String locale, String title) {
        API_Methods.response.then()
                .assertThat()
                .body("data.categories[" + dataIndex + "].slug", equalTo(slug),
                        "data.categories[" + dataIndex + "].parent_id", nullValue(),
                        "data.categories[" + dataIndex + "].icon", equalTo(icon),
                        "data.categories[" + dataIndex + "].order", equalTo(order),
                        "data.categories[" + dataIndex + "].title", nullValue(),
                        "data.categories[" + dataIndex + "].translations[0].id", equalTo(id),
                        "data.categories[" + dataIndex + "].translations[0].category_id", equalTo(category_id),
                        "data.categories[" + dataIndex + "].translations[0].locale", equalTo(locale),
                        "data.categories[" + dataIndex + "].translations[0].title", equalTo(title));
    }
    // ************************************************************************************************************

    // **************************************** /api/category/{id} ************************************************
    @Given("The api user verifies that the data in the response body includes {int}, {string}, {string}, {int}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int data_id, String slug, String icon, int order, int translations_id, int category_id, String locale, String title) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(data_id, jsonPath.getInt("data.id"));
        assertEquals(slug, jsonPath.getString("data.slug"));
        assertNull(jsonPath.get("data.parent_id"));
        assertEquals(icon, jsonPath.getString("data.icon"));
        assertEquals(order, jsonPath.getInt("data.order"));
        assertNull(jsonPath.get("data.title"));
        assertEquals(translations_id, jsonPath.getInt("data.translations[0].id"));
        assertEquals(category_id, jsonPath.getInt("data.translations[0].category_id"));
        assertEquals(locale, jsonPath.getString("data.translations[0].locale"));
        assertEquals(title, jsonPath.getString("data.translations[0].title"));
    }
    // ************************************************************************************************************

    // ******************************************* /api/addCategory ***********************************************
    @Given("The api user prepares a POST request to send to the API addCategory endpoint containing the {string} information.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_apı_add_category_endpoint_containing_the_information(String title) {
        requestBody = builder
                .addParameterForJSONObject("title", title)
                .buildUsingJSONObject();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // *************************************** /api/updateCategory/{id} *******************************************
    @Given("The api user prepares a PATCH request containing the {string} information to send to the api updateCategory endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_information_to_send_to_the_api_update_category_endpoint(String title) {
        requestBody = builder
                .addParameterForMap("title", title)
                .buildUsingMap();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ******************************************* /api/pricePlans ************************************************
    @Given("The api user verifies that the information for the entry at the specified {int} in the response body includes {int}, {int}, {int}, {int}, {int}, {int}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_that_the_information_for_the_entry_at_the_specified_in_the_response_body_includes_and(int dataIndex, int creator_id, int webinar_id, int start_date, int end_date, int discount, int created_at, int id, int ticket_id, String locale, String title) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(creator_id, jsonPath.getInt("data[" + dataIndex + "].creator_id"));
        assertEquals(webinar_id, jsonPath.getInt("data[" + dataIndex + "].webinar_id"));
        assertNull(jsonPath.get("data[" + dataIndex + "].bundle_id"));
        assertEquals(start_date, jsonPath.getInt("data[" + dataIndex + "].start_date"));
        assertEquals(end_date, jsonPath.getInt("data[" + dataIndex + "].end_date"));
        assertEquals(discount, jsonPath.getInt("data[" + dataIndex + "].discount"));
        assertNull(jsonPath.get("data[" + dataIndex + "].capacity"));
        assertNull(jsonPath.get("data[" + dataIndex + "].order"));
        assertEquals(created_at, jsonPath.getInt("data[" + dataIndex + "].created_at"));
        assertEquals(id, jsonPath.getInt("data[" + dataIndex + "].translations[0].id"));
        assertEquals(ticket_id, jsonPath.getInt("data[" + dataIndex + "].translations[0].ticket_id"));
        assertEquals(locale, jsonPath.getString("data[" + dataIndex + "].translations[0].locale"));
        assertEquals(title, jsonPath.getString("data[" + dataIndex + "].translations[0].title"));
    }
    // ************************************************************************************************************

    // ***************************************** /api/pricePlan/{id} **********************************************
    @Given("The api user verifies the contents of {int}, {int}, {int}, {int}, {int}, {int}, {int}, {int}, {int}, {int}, {string} and {string} in the response body's data.")
    public void the_api_user_verifies_the_contents_of_and_in_the_response_body_s_data(int data_id, int creator_id, int webinar_id, int start_date, int end_date, int discount, int capacity, int created_at, int translations_id, int ticket_id, String locale, String title) {
        responseMap = API_Methods.response.as(HashMap.class);

        assertEquals(data_id, ((Map) (responseMap.get("data"))).get("id"));
        assertEquals(creator_id, ((Map) (responseMap.get("data"))).get("creator_id"));
        assertEquals(webinar_id, ((Map) (responseMap.get("data"))).get("webinar_id"));
        assertNull(((Map) (responseMap.get("data"))).get("bundle_id"));
        assertEquals(start_date, ((Map) (responseMap.get("data"))).get("start_date"));
        assertEquals(end_date, ((Map) (responseMap.get("data"))).get("end_date"));
        assertEquals(discount, ((Map) (responseMap.get("data"))).get("discount"));
        assertEquals(capacity, ((Map) (responseMap.get("data"))).get("capacity"));
        assertNull(((Map) (responseMap.get("data"))).get("order"));
        assertEquals(created_at, ((Map) (responseMap.get("data"))).get("created_at"));
        assertEquals(translations_id, ((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("translations"))).get(0)).get("id"));
        assertEquals(ticket_id, ((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("translations"))).get(0)).get("ticket_id"));
        assertEquals(locale, ((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("translations"))).get(0)).get("locale"));
        assertEquals(title, ((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("translations"))).get(0)).get("title"));
    }
    // ************************************************************************************************************

    // ******************************************* /api/addPricePlan **********************************************
    @Given("The api user prepares a POST request to send to the api addPricePlan endpoint, containing the information {string}, {string}, {int}, {int} and {int}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_add_price_plan_endpoint_containing_the_information_and(String title, String dateRange, int discount, int capacity, int webinar_id) {
        pricePlanPojo = new PricePlanPojo(title, dateRange, discount, capacity, webinar_id);
        requestBody = gson.toJson(pricePlanPojo); // Burada POJO nesnesini JSON formatında bir Stringe dönüştürdük.
        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // *************************************** /api/updatePricePlan/{id} ******************************************
    @Given("The api user prepares a PATCH request to send to the api updatePricePlan endpoint, containing the information {string}, {string}, {int}, {int} and {int}.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_update_price_plan_endpoint_containing_the_information_and(String title, String dateRange, int discount, int capacity, int webinar_id) {
        pricePlanPojo = new PricePlanPojo(title, dateRange, discount, capacity, webinar_id);
        requestBody = gson.toJson(pricePlanPojo); // Burada POJO nesnesini JSON formatında bir Stringe dönüştürdük.
        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ************************************************************************************************************
}
