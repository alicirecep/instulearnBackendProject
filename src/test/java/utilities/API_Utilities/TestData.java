package utilities.API_Utilities;

import org.json.JSONObject;

public class TestData {

    JSONObject requestBody;

    public JSONObject productRequestBody(){

        requestBody = new JSONObject();

        requestBody.put("type","virtual");
        requestBody.put("price",100);
        requestBody.put("category_id",2);
        requestBody.put("title","Introduction to Yoga: A Beginner's Guide Video Course");
        requestBody.put("summary","Discover the transformative power of yoga and embark on a journey to wellness.");
        requestBody.put("description","Are you ready to embark on a journey to holistic wellness? Introduction to Yoga: A Beginners Guide is designed for individuals who want to explore the ancient practice of yoga and reap its numerous benefits. In this comprehensive course, you will learn the fundamentals of yoga, including basic poses, breathing techniques, and meditation practices.");

        return requestBody;
    }
}
