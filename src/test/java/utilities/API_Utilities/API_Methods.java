package utilities.API_Utilities;

import config_Requirements.ConfigReader;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.json.JSONObject;

import java.util.Arrays;
import java.util.HashMap;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertEquals;

public class API_Methods {

    public static Response response = null;
    public static int id;
    public static String fullPath;
    public static HashMap<String, Object> responseMap;

    public static void pathParam(String rawPaths) {
        String[] paths = rawPaths.split("/");

        System.out.println(Arrays.toString(paths));

        StringBuilder tempPath = new StringBuilder("/{");


        for (int i = 0; i < paths.length; i++) {

            String key = "pp" + i;
            String value = paths[i].trim();

            spec.pathParam(key, value);

            tempPath.append(key + "}/{");

            if (value.matches("\\d+")) {  // value.matches("\\d+") burada value rakam iceriyorsa dedik
                id = Integer.parseInt(value);
            }
        }
        tempPath.deleteCharAt(tempPath.lastIndexOf("/"));
        tempPath.deleteCharAt(tempPath.lastIndexOf("{"));

        fullPath = tempPath.toString();
        System.out.println("fullPath = " + fullPath);
        System.out.println("id : " + id);
    }

    public static Response sendRequest(String httpMethod, Object requestBody) {

        switch (httpMethod.toUpperCase()) {
            case "GET":
                response = given()
                        .spec(spec)
                        .when()
                        .get(fullPath);
                break;
            case "POST":
                response = given()
                        .spec(spec)
                        .contentType(ContentType.JSON)
                        .when()
                        .body(requestBody)
                        .post(fullPath);
                break;
            case "PATCH":
                response = given()
                        .spec(spec)
                        .contentType(ContentType.JSON)
                        .when()
                        .body(requestBody)
                        .patch(fullPath);
                break;
            case "DELETE":
                response = given()
                        .spec(spec)
                        .when()
                        .delete(fullPath);
                break;
        }

        if (response != null) {
            response.prettyPrint();
        }

        return response;
    }


    public static String tryCatchRequest(String httpMethod, Object requestBody) {
        String exceptionMesaj = null;
        try {
            switch (httpMethod.toUpperCase()) {
                case "GET":
                    response = given()
                            .spec(spec)
                            .when()
                            .get(fullPath);
                    break;
                case "DELETE":
                    response = given()
                            .spec(spec)
                            .when()
                            .delete(fullPath);
                    break;
                case "PATCH":
                    response = given()
                            .spec(spec)
                            .contentType(ContentType.JSON)
                            .when()
                            .body(requestBody)
                            .patch(fullPath);
                    break;
            }
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("Exception Mesaj : " + exceptionMesaj);
        return exceptionMesaj;
    }

    public static void statusCodeAssert(int statusCode) {
        response.then()
                .assertThat()
                .statusCode(statusCode);
    }

    public static void assertBody(String path, String value) {
        response.then()
                .assertThat()
                .body(path, equalTo(value));
    }

    public static void assertPathParam(String reponseId) {
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

    public static void verification(String pp1, String pp2, String idKey, String path, Object value) {
        responseMap = API_Methods.response.as(HashMap.class);

        Object idValue = responseMap.get(idKey);

        int id = 0;
        if (idValue instanceof String) {
            id = Integer.parseInt((String) idValue);
        } else {
            id = (int) idValue;
        }
        System.out.println(idKey + " : " + id);

        spec = new RequestSpecBuilder().setBaseUri(ConfigReader.getProperty("base_url", "api")).build();
        spec.pathParams("pp1", pp1, "pp2", pp2, "pp3", id);


        response = given()
                .spec(spec)
                .header("Accept", "application/json")
                .header("x-api-key", "1234")
                .header("Authorization", "Bearer " + Authentication.generateToken("admin"))
                .when()
                .get("/{pp1}/{pp2}/{pp3}");

        response.then()
                .assertThat()
                .body(path, equalTo(value));
    }

    public static int addedId(String pp2, String folder, String idKey) {

        spec = new RequestSpecBuilder().setBaseUri(ConfigReader.getProperty("base_url", "api")).build();
        spec.pathParams("pp1", "api", "pp2", pp2);
        TestData testData = new TestData();

        HashMap<String, Object> requestBody = testData.requestBody(folder);

        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .header("Accept", "application/json")
                .header("x-api-key", "1234")
                .header("Authorization", "Bearer " + Authentication.generateToken("admin"))
                .when()
                .body(requestBody)
                .post("/{pp1}/{pp2}");

        responseMap = API_Methods.response.as(HashMap.class);
        int id = (int) responseMap.get(idKey);
        System.out.println(idKey + " : " + id);

        return id;
    }
}
