package stepdefinitions;

import com.google.gson.Gson;
import config_Requirements.ConfigReader;
import hooks.HooksAPI;
import io.cucumber.java.en.Given;
import io.restassured.path.json.JsonPath;
import pojos.coupon.CouponDataPojo;
import pojos.coupon.CouponPojo;
import pojos.coupon.CouponPojoRequest;
import pojos.coursefaq.CoursefaqPojo;
import pojos.coursefaq.DataPojo;
import pojos.coursefaq.TranslationsPojo;
import pojos.pricePlan.PricePlanPojo;
import pojos.product.ProductPojo;
import pojos.productfaq.ProductfaqPojo;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.RequestBuilder;
import utilities.API_Utilities.TestData;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.*;

public class API_Stepdefinitions {

    JsonPath jsonPath;
    String requestBody;
    RequestBuilder builder = new RequestBuilder();
    HashMap<String, Object> responseMap;
    PricePlanPojo requestPricePlan;
    ProductPojo requestProduct;
    CoursefaqPojo responseCoursefaq;
    ProductfaqPojo requestProductFaq;
    CouponPojoRequest requestCoupon;
    Gson gson = new Gson(); // Gson kütüphanesini kullanarak bir POJO nesnesini JSON formatında bir Stringe dönüştürebilirsiniz.
    int adddedId;

    @Given("The api user constructs the base url with the {string} token.")
    public void the_api_user_constructs_the_base_url_with_the_token(String userType) {
        HooksAPI.setUpApi(userType);
    }

    @Given("The api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        if (adddedId == 0) {
            API_Methods.pathParam(pathParam);
        } else {
            API_Methods.pathParam(pathParam + "/" + adddedId);
        }

    }

    @Given("The api user sends a {string} request and saves the returned response.")
    public void the_api_user_sends_a_request_and_saves_the_returned_response(String httpMethod) {
        if (requestBody == null || requestBody.isEmpty()) {
            API_Methods.sendRequest(httpMethod, null);
        } else {
            API_Methods.sendRequest(httpMethod, requestBody);
        }
    }

    @Given("The api user verifies that the status code is {int}.")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        API_Methods.statusCodeAssert(code);
    }

    @Given("The api user verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        API_Methods.assertBody(key, value);
    }

    @Given("The api user sends a {string} request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String httpMethod) {
        String response = (requestBody == null) ? API_Methods.tryCatchRequest(httpMethod, null) : API_Methods.tryCatchRequest(httpMethod, requestBody);
        assertEquals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api"), response);
    }

    @Given("The api user prepares a POST request that contains no data.")
    public void the_api_user_prepares_a_post_request_that_contains_no_data() {
        requestBody = builder.buildUsingMap();
    }

    @Given("The api user prepares a PATCH request without containing any data.")
    public void the_api_user_prepares_a_patch_request_without_containing_any_data() {
        requestBody = builder.buildUsingJSONObject();
    }

    @Given("The api user verifies that the {string} information in the returned response body is the same as the id path parameter written in the endpoint.")
    public void the_api_user_verifies_that_the_information_in_the_returned_response_body_is_the_same_as_the_id_path_parameter_written_in_the_endpoint(String reponseId) {
        API_Methods.assertPathParam(reponseId);
    }

    @Given("The api user verifies that the {string} is {string} by sending a GET request to the {string} {string} endpoint with the {string} returned in the response body.")
    public void the_api_user_verifies_that_the_is_by_sending_a_get_request_to_the_endpoint_with_the_returned_in_the_response_body(String path, String value, String pp1, String pp2, String reponseId) {
        API_Methods.verification(pp1, pp2, reponseId, path, value);
    }

    @Given("The api user sends a POST request to the api {string} endpoint to create a new {string} record and records the {string} information.")
    public void the_api_user_sends_a_post_request_to_the_api_endpoint_to_create_a_new_record_and_records_the_information(String pp2, String folder, String addedId) {
        adddedId = API_Methods.addedId(pp2, folder, addedId);
    }

    // ******************************************* /api/courses ************************************************
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
        requestPricePlan = new PricePlanPojo(title, dateRange, discount, capacity, webinar_id);
        requestBody = gson.toJson(requestPricePlan); // Burada POJO nesnesini JSON formatında bir Stringe dönüştürdük.
        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // *************************************** /api/updatePricePlan/{id} ******************************************
    @Given("The api user prepares a PATCH request to send to the api updatePricePlan endpoint, containing the information {string}, {string}, {int}, {int} and {int}.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_update_price_plan_endpoint_containing_the_information_and(String title, String dateRange, int discount, int capacity, int webinar_id) {
        requestPricePlan = new PricePlanPojo(title, dateRange, discount, capacity, webinar_id);
        requestBody = gson.toJson(requestPricePlan); // Burada POJO nesnesini JSON formatında bir Stringe dönüştürdük.
        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ******************************************** /api/coursefaqs ***********************************************
    @Given("The api user verifies the {int}, {int}, {int}, {int}, {int}, {int}, {string}, {string} and {string} information of the item at the specified {int} index in the response body.")
    public void the_api_user_verifies_the_and_information_of_the_item_at_the_specified_index_in_the_response_body(int creator_id, int webinar_id, int created_at, int updated_at, int id, int faq_id, String locale, String title, String answer, int dataIndex) {
        responseMap = API_Methods.response.as(HashMap.class);

        assertEquals(creator_id, ((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("coursefaqs"))).get(dataIndex)).get("creator_id"));
        assertEquals(webinar_id, ((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("coursefaqs"))).get(dataIndex)).get("webinar_id"));
        assertNull(((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("coursefaqs"))).get(dataIndex)).get("bundle_id"));
        assertNull(((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("coursefaqs"))).get(dataIndex)).get("upcoming_course_id"));
        assertNull(((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("coursefaqs"))).get(dataIndex)).get("order"));
        assertEquals(created_at, ((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("coursefaqs"))).get(dataIndex)).get("created_at"));
        assertEquals(updated_at, ((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("coursefaqs"))).get(dataIndex)).get("updated_at"));
        assertEquals(id, ((Map) (((ArrayList) (((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("coursefaqs"))).get(dataIndex)).get("translations"))).get(0))).get("id"));
        assertEquals(faq_id, ((Map) (((ArrayList) (((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("coursefaqs"))).get(dataIndex)).get("translations"))).get(0))).get("faq_id"));
        assertEquals(locale, ((Map) (((ArrayList) (((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("coursefaqs"))).get(dataIndex)).get("translations"))).get(0))).get("locale"));
        assertEquals(title, ((Map) (((ArrayList) (((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("coursefaqs"))).get(dataIndex)).get("translations"))).get(0))).get("title"));
        assertEquals(answer, ((Map) (((ArrayList) (((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("coursefaqs"))).get(dataIndex)).get("translations"))).get(0))).get("answer"));
    }
    // ************************************************************************************************************

    // ****************************************** /api/coursefaq/{id} *********************************************
    @Given("The api user verifies the contents of {int}, {int}, {int}, {int}, {int}, {int}, {int}, {string}, {string}, and {string} in the response body's data.")
    public void the_api_user_verifies_the_contents_of_and_in_the_response_body_s_data(int dataId, int creator_id, int webinar_id, int created_at, int updated_at, int translations_id, int faq_id, String locale, String title, String answer) {
        TranslationsPojo translationsPojo = new TranslationsPojo(2, 14, "en", "What skills will I gain from this course?", "Throughout the course, you'll learn the complete project management process, including project initiation, planning, execution, monitoring and controlling, and closure. You'll also delve into essential skills such as stakeholder analysis, risk management, budgeting, scheduling, and communication.");
        List<TranslationsPojo> translationsPojoList = new ArrayList<>();
        translationsPojoList.add(translationsPojo);

        DataPojo dataPojo = new DataPojo(14, 1016, 1995, null, null, null, 1624908812, 1711967802, null, null, translationsPojoList);
        responseCoursefaq = new CoursefaqPojo("success", 200, dataPojo);

        assertEquals(dataId, responseCoursefaq.getData().getId());
        assertEquals(creator_id, responseCoursefaq.getData().getCreatorId());
        assertEquals(webinar_id, responseCoursefaq.getData().getWebinarId());
        assertNull(responseCoursefaq.getData().getBundleId());
        assertNull(responseCoursefaq.getData().getUpcomingCourseId());
        assertNull(responseCoursefaq.getData().getOrder());
        assertEquals(created_at, responseCoursefaq.getData().getCreatedAt());
        assertEquals(updated_at, responseCoursefaq.getData().getUpdatedAt());
        assertEquals(translations_id, responseCoursefaq.getData().getTranslations().get(0).getId());
        assertEquals(faq_id, responseCoursefaq.getData().getTranslations().get(0).getFaqId());
        assertEquals(locale, responseCoursefaq.getData().getTranslations().get(0).getLocale());
        assertTrue(responseCoursefaq.getData().getTranslations().get(0).getTitle().contains(title));
        assertTrue(responseCoursefaq.getData().getTranslations().get(0).getAnswer().contains(answer));
    }
    // ************************************************************************************************************

    // ******************************************** /api/addCoursefaq *********************************************
    @Given("The api user prepares a POST request containing the {string}, {string} and {int} information to send to the api addCoursefaq endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_and_information_to_send_to_the_api_add_coursefaq_endpoint(String title, String answer, int webinar_id) {
        requestBody = builder
                .addParameterForJSONObject("title", title)
                .addParameterForJSONObject("answer", answer)
                .addParameterForJSONObject("webinar_id", webinar_id)
                .buildUsingJSONObject();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ***************************************** /api/updateCoursefaq/{id} ****************************************
    @Given("The api user prepares a PATCH request containing the {string} and {string} information to send to the api updateCoursefaq endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_and_information_to_send_to_the_api_update_coursefaq_endpoint(String title, String answer) {
        requestBody = builder
                .addParameterForMap("title", title)
                .addParameterForMap("answer", answer)
                .buildUsingMap();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ************************************************ /api/products *********************************************
    @Given("The api user verifies that the information for the entry with the specified {int} index in the response body includes {int}, {string}, {string}, {int}, {int}, {int}, {int}, {int}, {int}, {int}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_that_the_information_for_the_entry_with_the_specified_index_in_the_response_body_includes_and(int dataIndex, int creator_id, String type, String slug, int category_id, int price, int point, int unlimited_inventory, int ordering, int id, int product_id, String locale, String title, String seo_description, String summary, String description) {
        API_Methods.response.then()
                .assertThat()
                .body("data.products[" + dataIndex + "].creator_id", equalTo(creator_id),
                        "data.products[" + dataIndex + "].type", equalTo(type),
                        "data.products[" + dataIndex + "].slug", equalTo(slug),
                        "data.products[" + dataIndex + "].category_id", equalTo(category_id),
                        "data.products[" + dataIndex + "].price", equalTo(price),
                        "data.products[" + dataIndex + "].point", equalTo(point),
                        "data.products[" + dataIndex + "].unlimited_inventory", equalTo(unlimited_inventory),
                        "data.products[" + dataIndex + "].ordering", equalTo(ordering),
                        "data.products[" + dataIndex + "].translations[0].id", equalTo(id),
                        "data.products[" + dataIndex + "].translations[0].product_id", equalTo(product_id),
                        "data.products[" + dataIndex + "].translations[0].locale", equalTo(locale),
                        "data.products[" + dataIndex + "].translations[0].title", equalTo(title),
                        "data.products[" + dataIndex + "].translations[0].seo_description", containsString(seo_description),
                        "data.products[" + dataIndex + "].translations[0].summary", containsString(summary),
                        "data.products[" + dataIndex + "].translations[0].description", containsString(description));
    }
    // ************************************************************************************************************

    // ********************************************* /api/product/{id} ********************************************
    @Given("The api user verifies the content of the data in the response body, including {int}, {int}, {string}, {string}, {int}, {int}, {int}, {int}, {int}, {int}, {int}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body_including_and(int data_id, int creator_id, String type, String slug, int category_id, int price, int point, int unlimited_inventory, int ordering, int translations_id, int product_id, String locale, String title, String seo_description, String summary, String description) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(data_id, jsonPath.getInt("data.id"));
        assertEquals(creator_id, jsonPath.getInt("data.creator_id"));
        assertEquals(type, jsonPath.getString("data.type"));
        assertEquals(slug, jsonPath.getString("data.slug"));
        assertEquals(category_id, jsonPath.getInt("data.category_id"));
        assertEquals(price, jsonPath.getInt("data.price"));
        assertEquals(point, jsonPath.getInt("data.point"));
        assertEquals(unlimited_inventory, jsonPath.getInt("data.unlimited_inventory"));
        assertEquals(ordering, jsonPath.getInt("data.ordering"));
        assertEquals(translations_id, jsonPath.getInt("data.translations[0].id"));
        assertEquals(product_id, jsonPath.getInt("data.translations[0].product_id"));
        assertEquals(locale, jsonPath.getString("data.translations[0].locale"));
        assertEquals(title, jsonPath.getString("data.translations[0].title"));
        assertTrue(jsonPath.getString("data.translations[0].seo_description").contains(seo_description));
        assertTrue(jsonPath.getString("data.translations[0].summary").contains(summary));
        assertTrue(jsonPath.getString("data.translations[0].description").contains(description));
    }
    // ************************************************************************************************************

    // *********************************************** /api/addProduct ********************************************
    @Given("The api user prepares a POST request to send to the api addProduct endpoint containing the information {string}, {int}, {int}, {string}, {string} and {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_add_product_endpoint_containing_the_information_and(String type, int price, int category_id, String title, String summary, String description) {
        requestProduct = new ProductPojo(type, price, category_id, title, summary, description);
        requestBody = gson.toJson(requestProduct); // Burada POJO nesnesini JSON formatında bir Stringe dönüştürdük.
        System.out.println("POST Request Body : " + requestBody);
    }

    // ************************************************************************************************************

    // **************************************** /api/updateProduct/{id} *******************************************
    @Given("The api user prepares a PATCH request to the api updateProduct endpoint containing the following information {string}, {int}, {int}, {string}, {string} and {string}")
    public void the_api_user_prepares_a_patch_request_to_the_api_update_product_endpoint_containing_the_following_information_and(String type, int price, int category_id, String title, String summary, String description) {
        requestProduct = new ProductPojo(type, price, category_id, title, summary, description);
        requestBody = gson.toJson(requestProduct); // Burada POJO nesnesini JSON formatında bir Stringe dönüştürdük.
        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ***************************************** /api/productCategories *******************************************
    @Given("The api user verifies the {string}, {int}, {int}, {string} and {string} information for the {int} index in the response body.")
    public void the_api_user_verifies_the_and_information_for_the_index_in_the_response_body(String icon, int id, int product_category_id, String locale, String title, int dataIndex) {
        API_Methods.response.then()
                .assertThat()
                .body("data.categories[" + dataIndex + "].parent_id", equalTo(null),
                        "data.categories[" + dataIndex + "].icon", equalTo(icon),
                        "data.categories[" + dataIndex + "].order", equalTo(null),
                        "data.categories[" + dataIndex + "].translations[0].id", equalTo(id),
                        "data.categories[" + dataIndex + "].translations[0].product_category_id", equalTo(product_category_id),
                        "data.categories[" + dataIndex + "].translations[0].locale", equalTo(locale),
                        "data.categories[" + dataIndex + "].translations[0].title", equalTo(title));
    }
    // ************************************************************************************************************

    // *************************************** /api/productCategory/{id} ******************************************
    @Given("The api user verifies the content of the response body data {int}, {string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_content_of_the_response_body_data_and(int data_id, String icon, int translations_id, int product_category_id, String locale, String title) {
        API_Methods.response.then()
                .assertThat()
                .body("data.id", equalTo(data_id),
                        "data.parent_id", equalTo(null),
                        "data.icon", equalTo(icon),
                        "data.order", equalTo(null),
                        "data.title", equalTo(null),
                        "data.translations[0].id", equalTo(translations_id),
                        "data.translations[0].product_category_id", equalTo(product_category_id),
                        "data.translations[0].locale", equalTo(locale),
                        "data.translations[0].title", equalTo(title));
    }
    // ************************************************************************************************************

    // *************************************** /api/addProductCategory ********************************************
    @Given("The api user prepares a POST request containing the {string} information to send to the api addProductCategory endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_information_to_send_to_the_api_add_product_category_endpoint(String title) {
        requestBody = builder
                .addParameterForJSONObject("title", title)
                .buildUsingJSONObject();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ************************************* /api/productCategory/{id} ********************************************
    @Given("The api user prepares a PATCH request containing the {string} information to send to the api updateProductCategory endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_information_to_send_to_the_api_update_product_category_endpoint(String title) {
        requestBody = builder
                .addParameterForJSONObject("title", title)
                .buildUsingJSONObject();

        System.out.println("PATCH Request Body : " + requestBody);
    }

    // ************************************************************************************************************

    // **************************************** /api/productfaqs **************************************************
    @Given("The api user verifies the details of the record at the {int} index in the response body {int}, {int}, {int}, {int}, {int}, {string}, {string}, and {string}.")
    public void the_api_user_verifies_the_details_of_the_record_at_the_index_in_the_response_body_and(int dataIndex, int creator_id, int product_id, int created_at, int id, int product_faq_id, String locale, String title, String answer) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(creator_id, jsonPath.getInt("data[" + dataIndex + "].creator_id"));
        assertEquals(product_id, jsonPath.getInt("data[" + dataIndex + "].product_id"));
        assertNull(jsonPath.get("data[" + dataIndex + "].order"));
        assertEquals(created_at, jsonPath.getInt("data[" + dataIndex + "].created_at"));
        assertEquals(id, jsonPath.getInt("data[" + dataIndex + "].translations[0].id"));
        assertEquals(product_faq_id, jsonPath.getInt("data[" + dataIndex + "].translations[0].product_faq_id"));
        assertEquals(locale, jsonPath.getString("data[" + dataIndex + "].translations[0].locale"));
        assertEquals(title, jsonPath.getString("data[" + dataIndex + "].translations[0].title"));
        assertTrue(jsonPath.getString("data[" + dataIndex + "].translations[0].answer").contains(answer));
    }
    // ************************************************************************************************************

    // ************************************* /api/productfaq/{id} *************************************************
    @Given("The api user verifies the content of the data {int}, {int}, {int}, {int}, {int}, {int}, {string}, {string} and {string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_and_in_the_response_body(int data_id, int creator_id, int product_id, int created_at, int translations_id, int product_faq_id, String locale, String title, String answer) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(data_id, jsonPath.getInt("data.id"));
        assertEquals(creator_id, jsonPath.getInt("data.creator_id"));
        assertEquals(product_id, jsonPath.getInt("data.product_id"));
        assertNull(jsonPath.get("data.order"));
        assertEquals(created_at, jsonPath.getInt("data.created_at"));
        assertEquals(translations_id, jsonPath.getInt("data.translations[0].id"));
        assertEquals(product_faq_id, jsonPath.getInt("data.translations[0].product_faq_id"));
        assertEquals(locale, jsonPath.getString("data.translations[0].locale"));
        assertTrue(jsonPath.getString("data.translations[0].title").contains(title));
        assertTrue(jsonPath.getString("data.translations[0].answer").contains(answer));
    }
    // ************************************************************************************************************

    // *************************************** /api/addProductfaq *************************************************
    @Given("The api user prepares a POST request to send to the api addProductfaq endpoint with the information {string}, {string} and {int}")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_add_productfaq_endpoint_with_the_information_and(String title, String answer, int product_id) {
        requestProductFaq = new ProductfaqPojo(title, answer, product_id);
        requestBody = gson.toJson(requestProductFaq); // Burada POJO nesnesini JSON formatında bir Stringe dönüştürdük.
        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // *********************************** /api/updateProductfaq/{id} *********************************************
    @Given("The api user prepares a PATCH request to send to the api updateProductfaq endpoint, containing the {string}, {string} and {int} information.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_update_productfaq_endpoint_containing_the_and_information(String title, String answer, int product_id) {
        requestProductFaq = new ProductfaqPojo(title, answer, product_id);
        requestBody = gson.toJson(requestProductFaq); // Burada POJO nesnesini JSON formatında bir Stringe dönüştürdük.
        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ********************************************** /api/blogs **************************************************
    @Given("The api user verifies the information in the response body at the {int} index, including {int}, {int}, {string}, {string}, {int}, {int}, {string}, {int}, {int}, {int}, {int}, {int}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_at_the_index_including_and(int dataIndex, int category_id, int author_id, String slug, String image, int visit_count, int enable_comment, String status, int created_at, int updated_at, int comments_count, int id, int blog_id, String locale, String title, String description, String content, String meta_description) {
        API_Methods.response.then()
                .assertThat()
                .body("data.blog[" + dataIndex + "].category_id", equalTo(category_id),
                        "data.blog[" + dataIndex + "].author_id", equalTo(author_id),
                        "data.blog[" + dataIndex + "].slug", equalTo(slug),
                        "data.blog[" + dataIndex + "].image", equalTo(image),
                        "data.blog[" + dataIndex + "].visit_count", equalTo(visit_count),
                        "data.blog[" + dataIndex + "].enable_comment", equalTo(enable_comment),
                        "data.blog[" + dataIndex + "].status", equalTo(status),
                        "data.blog[" + dataIndex + "].created_at", equalTo(created_at),
                        "data.blog[" + dataIndex + "].updated_at", equalTo(updated_at),
                        "data.blog[" + dataIndex + "].comments_count", equalTo(comments_count),
                        "data.blog[" + dataIndex + "].translations[0].id", equalTo(id),
                        "data.blog[" + dataIndex + "].translations[0].blog_id", equalTo(blog_id),
                        "data.blog[" + dataIndex + "].translations[0].locale", equalTo(locale),
                        "data.blog[" + dataIndex + "].translations[0].title", equalTo(title),
                        "data.blog[" + dataIndex + "].translations[0].description", equalTo(description),
                        "data.blog[" + dataIndex + "].translations[0].content", equalTo(content),
                        "data.blog[" + dataIndex + "].translations[0].meta_description", equalTo(meta_description));
    }
    // ************************************************************************************************************

    // ******************************************** /api/blog/{id} ************************************************
    @Given("The api user verifies the content of the data in the response body, which includes {int}, {int}, {int}, {string}, {string}, {int}, {int}, {string}, {int}, {int}, {int}, {int}, {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body_which_includes_and(int data_id, int category_id, int author_id, String slug, String image, int visit_count, int enable_comment, String status, int created_at, int updated_at, int translations_id, int blog_id, String locale, String title, String description, String content, String meta_description) {
        API_Methods.response.then()
                .assertThat()
                .body("data.id", equalTo(data_id),
                        "data.category_id", equalTo(category_id),
                        "data.author_id", equalTo(author_id),
                        "data.slug", equalTo(slug),
                        "data.image", equalTo(image),
                        "data.visit_count", equalTo(visit_count),
                        "data.enable_comment", equalTo(enable_comment),
                        "data.status", equalTo(status),
                        "data.created_at", equalTo(created_at),
                        "data.updated_at", equalTo(updated_at),
                        "data.translations[0].id", equalTo(translations_id),
                        "data.translations[0].blog_id", equalTo(blog_id),
                        "data.translations[0].locale", equalTo(locale),
                        "data.translations[0].title", equalTo(title),
                        "data.translations[0].description", equalTo(description),
                        "data.translations[0].content", equalTo(content),
                        "data.translations[0].meta_description", equalTo(meta_description));
    }
    // ************************************************************************************************************

    // ********************************************** /api/addBlog ************************************************
    @Given("The api user prepares a POST request to send to the api addBlog endpoint with the information {string}, {int}, {string} and {string}")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_add_blog_endpoint_with_the_information_and(String title, int category_id, String description, String content) {
        requestBody = builder
                .addParameterForMap("title", title)
                .addParameterForMap("category_id", category_id)
                .addParameterForMap("description", description)
                .addParameterForMap("content", content)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ******************************************* /api/updateBlog/{id} *******************************************
    @Given("The api user prepares a PATCH request to send to the api updateBlog endpoint with the {string}, {int}, {string} and {string} information.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_update_blog_endpoint_with_the_and_information(String title, int category_id, String description, String content) {
        requestBody = builder
                .addParameterForMap("title", title)
                .addParameterForMap("category_id", category_id)
                .addParameterForMap("description", description)
                .addParameterForMap("content", content)
                .buildUsingMap();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ******************************************** /api/blogCategories *******************************************
    @Given("The api user verifies the {string}, {string} and {int} information of the response body at the {int} index.")
    public void the_api_user_verifies_the_and_information_of_the_response_body_at_the_index(String title, String slug, int blog_count, int dataIndex) {
        responseMap = API_Methods.response.as(HashMap.class);

        assertEquals(title, ((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("blogCategories"))).get(dataIndex)).get("title"));
        assertEquals(slug, ((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("blogCategories"))).get(dataIndex)).get("slug"));
        assertEquals(blog_count, ((Map) ((ArrayList) (((Map) (responseMap.get("data"))).get("blogCategories"))).get(dataIndex)).get("blog_count"));
    }
    // ************************************************************************************************************

    // ***************************************** /api/blogCategory/{id} *******************************************
    @Given("The api user verifies the content of data {int}, {string} and {string} in the response body.")
    public void the_api_user_verifies_the_content_of_data_and_in_the_response_body(int data_id, String title, String slug) {
        responseMap = API_Methods.response.as(HashMap.class);

        assertEquals(data_id, ((Map) (responseMap.get("data"))).get("id"));
        assertEquals(title, ((Map) (responseMap.get("data"))).get("title"));
        assertEquals(slug, ((Map) (responseMap.get("data"))).get("slug"));
    }
    // ************************************************************************************************************

    // ******************************************* /api/addBlogCategory *******************************************
    @Given("The api user prepares a POST request containing the {string} information to send to the api addBlogCategory endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_information_to_send_to_the_api_add_blog_category_endpoint(String title) {
        requestBody = builder
                .addParameterForMap("title", title)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // **************************************** /api/updateBlogCategory/{id} **************************************
    @Given("The api user prepares a PATCH request containing the {string} information to send to the api updateBlogCategory endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_information_to_send_to_the_api_update_blog_category_endpoint(String title) {
        requestBody = builder
                .addParameterForMap("title", title)
                .buildUsingMap();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ************************************************ /api/coupons **********************************************
    @Given("The api user verifies the {int}, {string}, {string}, {string}, {string}, {int}, {int}, {int}, {int}, {int}, {string}, {string}, {int}, {string}, {int} and {int} information of the entry at the {int} index in the response body.")
    public void the_api_user_verifies_the_and_information_of_the_entry_at_the_index_in_the_response_body(int creator_id, String title, String discount_type, String source, String code, int percent, int amount, int max_amount, int minimum_order, int count, String user_type, String product_type, int for_first_purchase, String status, int expired_at, int created_at, int dataIndex) {
        API_Methods.response.then()
                .assertThat()
                .body("data.discounts[" + dataIndex + "].creator_id", equalTo(creator_id),
                        "data.discounts[" + dataIndex + "].title", equalTo(title),
                        "data.discounts[" + dataIndex + "].discount_type", equalTo(discount_type),
                        "data.discounts[" + dataIndex + "].source", equalTo(source),
                        "data.discounts[" + dataIndex + "].code", equalTo(code),
                        "data.discounts[" + dataIndex + "].percent", equalTo(percent),
                        "data.discounts[" + dataIndex + "].amount", equalTo(amount),
                        "data.discounts[" + dataIndex + "].max_amount", equalTo(max_amount),
                        "data.discounts[" + dataIndex + "].minimum_order", equalTo(minimum_order),
                        "data.discounts[" + dataIndex + "].count", equalTo(count),
                        "data.discounts[" + dataIndex + "].user_type", equalTo(user_type),
                        "data.discounts[" + dataIndex + "].product_type", equalTo(product_type),
                        "data.discounts[" + dataIndex + "].for_first_purchase", equalTo(for_first_purchase),
                        "data.discounts[" + dataIndex + "].status", equalTo(status),
                        "data.discounts[" + dataIndex + "].expired_at", equalTo(expired_at),
                        "data.discounts[" + dataIndex + "].created_at", equalTo(created_at));
    }

    // ************************************************************************************************************

    // ******************************************** /api/coupon/{id} **********************************************
    @Given("The api user verifies the content of data {int}, {int}, {string}, {string}, {string}, {string}, {int}, {int}, {int}, {int}, {int}, {string}, {string}, {int}, {string}, {int} and {int} in the response body.")
    public void the_api_user_verifies_the_content_of_data_and_in_the_response_body(int dataId, int creator_id, String title, String discount_type, String source, String code, int percent, int amount, int max_amount, int minimum_order, int count, String user_type, String product_type, int for_first_purchase, String status, int expired_at, int created_at) {
        CouponDataPojo couponDataPojo = new CouponDataPojo(dataId, creator_id, title, discount_type, source, code, percent, amount, max_amount, minimum_order, count, user_type, product_type, for_first_purchase, status, expired_at, created_at);

        CouponPojo responseCoupon = new CouponPojo("success", 200, couponDataPojo);

        assertEquals(dataId, responseCoupon.getData().getId());
        assertEquals(creator_id, responseCoupon.getData().getCreatorId());
        assertEquals(title, responseCoupon.getData().getTitle());
        assertEquals(discount_type, responseCoupon.getData().getDiscountType());
        assertEquals(source, responseCoupon.getData().getSource());
        assertEquals(code, responseCoupon.getData().getCode());
        assertEquals(percent, responseCoupon.getData().getPercent());
        assertEquals(amount, responseCoupon.getData().getAmount());
        assertEquals(max_amount, responseCoupon.getData().getMaxAmount());
        assertEquals(minimum_order, responseCoupon.getData().getMinimumOrder());
        assertEquals(count, responseCoupon.getData().getCount());
        assertEquals(user_type, responseCoupon.getData().getUserType());
        assertEquals(product_type, responseCoupon.getData().getProductType());
        assertEquals(for_first_purchase, responseCoupon.getData().getForFirstPurchase());
        assertEquals(status, responseCoupon.getData().getStatus());
        assertEquals(expired_at, responseCoupon.getData().getExpiredAt());
        assertEquals(created_at, responseCoupon.getData().getCreatedAt());
    }
    // ************************************************************************************************************

    // ********************************************** /api/addCoupon **********************************************
    @Given("The api user prepares a POST request to send to the api addCoupon endpoint containing the following information: {string}, {string}, {string}, {string}, {int}, {int}, {int}, {int}, {int}, {string}, {int} and {string}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_add_coupon_endpoint_containing_the_following_information_and(String title, String discount_type, String source, String code, int percent, int amount, int max_amount, int minimum_order, int count, String product_type, int for_first_purchase, String expired_at) {
        requestCoupon = new CouponPojoRequest(title, discount_type, source, code, percent, amount, max_amount, minimum_order, count, product_type, for_first_purchase, expired_at);
        requestBody = gson.toJson(requestCoupon); // Burada POJO nesnesini JSON formatında bir Stringe dönüştürdük.
        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ******************************************* /api/updateCoupon/{id} *****************************************
    @Given("The api user prepares a PATCH request to send to the api updateCoupon endpoint containing the following information: {string}, {string}, {string}, {int}, {int}, {int}, {int}, {int}, {string} and {int}.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_update_coupon_endpoint_containing_the_following_information_and(String title, String discount_type, String source, int percent, int amount, int max_amount, int minimum_order, int count, String product_type, int for_first_purchase) {
        requestBody = builder
                .addParameterForMap("title", title)
                .addParameterForMap("discount_type", discount_type)
                .addParameterForMap("source", source)
                .addParameterForMap("percent", percent)
                .addParameterForMap("amount", amount)
                .addParameterForMap("max_amount", max_amount)
                .addParameterForMap("minimum_order", minimum_order)
                .addParameterForMap("count", count)
                .addParameterForMap("product_type", product_type)
                .addParameterForMap("for_first_purchase", for_first_purchase)
                .buildUsingMap();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ********************************************** /api/supports ***********************************************
    @Given("The api user validates the {int}, {int}, {string}, {string}, {int}, {int}, {string}, {int}, {string} and {string} of the response body with index {int}.")
    public void the_api_user_validates_the_and_of_the_response_body_with_index(int user_id, int department_id, String title, String status, int created_at, int updated_at, String status_order, int id, String full_name, String role_name, int dataIndex) {
        API_Methods.response.then()
                .assertThat()
                .body("data.supports[" + dataIndex + "].user_id", equalTo(user_id),
                        "data.supports[" + dataIndex + "].webinar_id", equalTo(null),
                        "data.supports[" + dataIndex + "].department_id", equalTo(department_id),
                        "data.supports[" + dataIndex + "].title", equalTo(title),
                        "data.supports[" + dataIndex + "].status", equalTo(status),
                        "data.supports[" + dataIndex + "].created_at", equalTo(created_at),
                        "data.supports[" + dataIndex + "].updated_at", equalTo(updated_at),
                        "data.supports[" + dataIndex + "].status_order", equalTo(status_order),
                        "data.supports[" + dataIndex + "].user.id", equalTo(id),
                        "data.supports[" + dataIndex + "].user.full_name", equalTo(full_name),
                        "data.supports[" + dataIndex + "].user.role_name", equalTo(role_name));
    }
    // ************************************************************************************************************

    // ********************************************** /api/support/{id} *******************************************
    @Given("The api user validates the data {int}, {int}, {int}, {string}, {string}, {int}, {int}, {string}, {int}, {string} and {string} in the response body.")
    public void the_api_user_validates_the_data_and_in_the_response_body(int data_id, int user_id, int department_id, String title, String status, int created_at, int updated_at, String status_order, int userId, String full_name, String role_name) {
        API_Methods.response.then()
                .assertThat()
                .body("data.id", equalTo(data_id),
                        "data.user_id", equalTo(user_id),
                        "data.webinar_id", equalTo(null),
                        "data.department_id", equalTo(department_id),
                        "data.title", equalTo(title),
                        "data.status", equalTo(status),
                        "data.created_at", equalTo(created_at),
                        "data.updated_at", equalTo(updated_at),
                        "data.status_order", equalTo(status_order),
                        "data.user.id", equalTo(userId),
                        "data.user.full_name", equalTo(full_name),
                        "data.user.role_name", equalTo(role_name));
    }
    // ************************************************************************************************************

    // ************************************************ /api/addSupport *******************************************
    @Given("The api user prepares a post request with {string}, {int} and {string} to send to the api addSupport endpoint")
    public void the_api_user_prepares_a_post_request_with_and_to_send_to_the_api_add_support_endpoint(String title, int department_id, String message) {
        requestBody = builder
                .addParameterForMap("title", title)
                .addParameterForMap("department_id", department_id)
                .addParameterForMap("message", message)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ********************************************* /api/updateSupport/{id} **************************************
    @Given("The api user prepares a patch request with {string}, {int} and {string} to send to the api updateSupport endpoint.")
    public void the_api_user_prepares_a_patch_request_with_and_to_send_to_the_api_update_support_endpoint(String title, int department_id, String message) {
        requestBody = builder
                .addParameterForMap("title", title)
                .addParameterForMap("department_id", department_id)
                .addParameterForMap("message", message)
                .buildUsingMap();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // *********************************************** /api/departments *******************************************
    @Given("The API user validates the {int}, {int}, {int}, {int}, {string} and {string} of the response body with index {int}.")
    public void the_apı_user_validates_the_and_of_the_response_body_with_index(int created_at, int supports_count, int translations_id, int support_department_id, String locale, String title, int dataIndex) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(created_at, jsonPath.getInt("data.departments[" + dataIndex + "].created_at"));
        assertEquals(supports_count, jsonPath.getInt("data.departments[" + dataIndex + "].supports_count"));
        assertNull(jsonPath.get("data.departments[" + dataIndex + "].title"));
        assertEquals(translations_id, jsonPath.getInt("data.departments[" + dataIndex + "].translations[0].id"));
        assertEquals(support_department_id, jsonPath.getInt("data.departments[" + dataIndex + "].translations[0].support_department_id"));
        assertEquals(locale, jsonPath.getString("data.departments[" + dataIndex + "].translations[0].locale"));
        assertEquals(title, jsonPath.getString("data.departments[" + dataIndex + "].translations[0].title"));
    }
    // ************************************************************************************************************

    // ******************************************* /api/department/{id} *******************************************
    @Given("The api user validates the data {int}, {int}, {int}, {int}, {string} and {string} in the response body.")
    public void the_api_user_validates_the_data_and_in_the_response_body(int data_id, int created_at, int translations_id, int support_department_id, String locale, String title) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(data_id, jsonPath.getInt("data.id"));
        assertEquals(created_at, jsonPath.getInt("data.created_at"));
        assertNull(jsonPath.get("data.title"));
        assertEquals(translations_id, jsonPath.getInt("data.translations[0].id"));
        assertEquals(support_department_id, jsonPath.getInt("data.translations[0].support_department_id"));
        assertEquals(locale, jsonPath.getString("data.translations[0].locale"));
        assertEquals(title, jsonPath.getString("data.translations[0].title"));
    }
    // ************************************************************************************************************

    // ******************************************** /api/addDepartment ********************************************
    @Given("The api user prepares a POST request containing the {string} information to send to the addDepartment endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_information_to_send_to_the_add_department_endpoint(String title) {
        requestBody = builder
                .addParameterForMap("title", title)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ************************************* /api/updateDepartment/{id} *******************************************
    @Given("The api user prepares a PATCH request containing the {string} information to send to the api updateDepartment endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_information_to_send_to_the_api_update_department_endpoint(String title) {
        requestBody = builder
                .addParameterForMap("title", title)
                .buildUsingMap();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // *********************************************** /api/contacts **********************************************
    @Given("The api user verifies the {string}, {string}, {string}, {string}, {string}, {string}, and {int} information for the item at the {int} index in the response body.")
    public void the_api_user_verifies_the_and_information_for_the_item_at_the_index_in_the_response_body(String name, String email, String phone, String subject, String message, String status, int created_at, int datIndex) {
        API_Methods.response.then()
                .assertThat()
                .body("data.contacts[" + datIndex + "].name", equalTo(name),
                        "data.contacts[" + datIndex + "].email", equalTo(email),
                        "data.contacts[" + datIndex + "].phone", equalTo(phone),
                        "data.contacts[" + datIndex + "].subject", equalTo(subject),
                        "data.contacts[" + datIndex + "].message", equalTo(message),
                        "data.contacts[" + datIndex + "].reply", equalTo(null),
                        "data.contacts[" + datIndex + "].status", equalTo(status),
                        "data.contacts[" + datIndex + "].created_at", equalTo(created_at));
    }
    // ************************************************************************************************************

    // ***************************************** /api/contact/{id} ************************************************
    @Given("The api user verifies the content of {int}, {string}, {string}, {string}, {string}, {string}, {string}, and {int} in the response body.")
    public void the_api_user_verifies_the_content_of_and_in_the_response_body(int data_id, String name, String email, String phone, String subject, String message, String status, int created_at) {
        API_Methods.response.then()
                .assertThat()
                .body("data.id", equalTo(data_id),
                        "data.name", equalTo(name),
                        "data.email", equalTo(email),
                        "data.phone", equalTo(phone),
                        "data.subject", equalTo(subject),
                        "data.message", equalTo(message),
                        "data.reply", equalTo(null),
                        "data.status", equalTo(status),
                        "data.created_at", equalTo(created_at));
    }
    // ************************************************************************************************************

    // ******************************************* /api/addContact ************************************************
    @Given("The api user prepares a POST request containing the {string}, {string}, {string} and {string} information to send to the api addContact endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_and_information_to_send_to_the_api_add_contact_endpoint(String name, String email, String subject, String message) {

        String value = TestData.faker.phoneNumber().cellPhone();

        // Telefon numarasını Long'a çevir
        Long phoneNumber = Long.valueOf(value.replaceAll("[^\\d]", ""));

        requestBody = builder
                .addParameterForMap("name", name)
                .addParameterForMap("email", email)
                .addParameterForMap("phone", phoneNumber)
                .addParameterForMap("subject", subject)
                .addParameterForMap("message", message)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ********************************** /api/updateContact/{id} *************************************************
    @Given("The api user prepares a PATCH request containing the {string} and {string} information to send to the api updateContact endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_and_information_to_send_to_the_api_update_contact_endpoint(String subject, String message) {
        String value = TestData.faker.phoneNumber().cellPhone();

        // Telefon numarasını Long'a çevir
        Long phoneNumber = Long.valueOf(value.replaceAll("[^\\d]", ""));

        requestBody = builder
                .addParameterForMap("phone", phoneNumber)
                .addParameterForMap("subject", subject)
                .addParameterForMap("message", message)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ********************************************** /api/badges *************************************************
    @Given("The api user verifies the information for the entry with the {int} index in the response body, including {string}, {string}, {string}, {string}, {int}, {int}, {int}, {int}, {string}, {string}, and {string}.")
    public void the_api_user_verifies_the_information_for_the_entry_with_the_index_in_the_response_body_including_and(int dataIndex, String image, String type, String from, String to, int score, int created_at, int id, int badge_id, String locale, String title, String description) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(image, jsonPath.getString("data.badges[" + dataIndex + "].image"));
        assertEquals(type, jsonPath.getString("data.badges[" + dataIndex + "].type"));
        assertEquals(from, jsonPath.getString("data.badges[" + dataIndex + "].condition.from"));
        assertEquals(to, jsonPath.getString("data.badges[" + dataIndex + "].condition.to"));
        assertEquals(score, jsonPath.getInt("data.badges[" + dataIndex + "].score"));
        assertEquals(created_at, jsonPath.getInt("data.badges[" + dataIndex + "].created_at"));
        assertEquals(id, jsonPath.getInt("data.badges[" + dataIndex + "].translations[0].id"));
        assertEquals(badge_id, jsonPath.getInt("data.badges[" + dataIndex + "].translations[0].badge_id"));
        assertEquals(locale, jsonPath.getString("data.badges[" + dataIndex + "].translations[0].locale"));
        assertEquals(title, jsonPath.getString("data.badges[" + dataIndex + "].translations[0].title"));
        assertEquals(description, jsonPath.getString("data.badges[" + dataIndex + "].translations[0].description"));
    }
    // ************************************************************************************************************

    // ******************************************** /api/badge/{id} ***********************************************
    @Given("The API user verifies the contents of {int}, {string}, {string}, {string}, {string}, {int}, {int}, {int}, {int}, {string}, {string} and {string} in the response body data.")
    public void the_apı_user_verifies_the_contents_of_and_in_the_response_body_data(int data_id, String image, String type, String from, String to, int score, int created_at, int translations_id, int badge_id, String locale, String title, String description) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(data_id, jsonPath.getInt("data.id"));
        assertEquals(image, jsonPath.getString("data.image"));
        assertEquals(type, jsonPath.getString("data.type"));
        assertEquals(from, jsonPath.getString("data.condition.from"));
        assertEquals(to, jsonPath.getString("data.condition.to"));
        assertEquals(score, jsonPath.getInt("data.score"));
        assertEquals(created_at, jsonPath.getInt("data.created_at"));
        assertEquals(translations_id, jsonPath.getInt("data.translations[0].id"));
        assertEquals(badge_id, jsonPath.getInt("data.translations[0].badge_id"));
        assertEquals(locale, jsonPath.getString("data.translations[0].locale"));
        assertEquals(title, jsonPath.getString("data.translations[0].title"));
        assertEquals(description, jsonPath.getString("data.translations[0].description"));
    }
    // ************************************************************************************************************

    // ********************************************** /api/addBadge ***********************************************
    @Given("The api user prepares a POST request to send to the api addBadge endpoint with the following information {string}, {string}, {string}, {int}, {int} and {int}.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_add_badge_endpoint_with_the_following_information_and(String title, String description, String type, int from, int to, int score) {
        requestBody = builder
                .addParameterForJSONObject("title", title)
                .addParameterForJSONObject("description", description)
                .addParameterForJSONObject("type", type)
                .addParameterForJSONObject("from", from)
                .addParameterForJSONObject("to", to)
                .addParameterForJSONObject("score", score)
                .buildUsingJSONObject();

        System.out.println("POST Request Body : " + requestBody);
    }
    // ************************************************************************************************************

    // ******************************************* /api/updateBadge/{id} ******************************************
    @Given("The api user prepares a PATCH request containing {string} and {string} information to send to the api updateBadge endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_update_badge_endpoint(String title, String type) {
        requestBody = builder
                .addParameterForJSONObject("title", title)
                .addParameterForJSONObject("type", type)
                .buildUsingJSONObject();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ************************************************************************************************************
}
