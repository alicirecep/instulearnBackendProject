package utilities.API_Utilities;

import com.github.javafaker.Faker;

import java.util.HashMap;

public class TestData {
    HashMap<String, HashMap<String, Object>> reqBody = new HashMap<>();
    public static Faker faker = new Faker();

    public HashMap contactRequestBody() {

        String value = TestData.faker.phoneNumber().cellPhone();
        Long phoneNumber = Long.valueOf(value.replaceAll("[^\\d]", ""));

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("name", "John Brown");
        requestBody.put("email", "jbrown@gmail.com");
        requestBody.put("phone", phoneNumber);
        requestBody.put("subject", "Test Contact Subject");
        requestBody.put("message", "Test Contact Message");

        return requestBody;
    }

    public HashMap departmentRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("title", faker.book().title());

        return requestBody;
    }

    public HashMap supportRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("title", faker.book().title());
        requestBody.put("department_id", 2);
        requestBody.put("message", "The purchase price I canceled has still not been refunded.");

        return requestBody;
    }

    public HashMap couponRequestBody() {
        String code = faker.code().asin();

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("title", "Test Coupon");
        requestBody.put("discount_type", "percentage");
        requestBody.put("source", "course");
        requestBody.put("code", code);
        requestBody.put("percent", 15);
        requestBody.put("amount", 10);
        requestBody.put("max_amount", 200);
        requestBody.put("minimum_order", 1);
        requestBody.put("count", 50);
        requestBody.put("product_type", "all");
        requestBody.put("for_first_purchase", 0);
        requestBody.put("expired_at", "2024-06-06");

        return requestBody;
    }

    public HashMap blogCategoryRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("title", faker.book().title());

        return requestBody;
    }

    public HashMap blogRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("title", "The Growing Impact of Online Education");
        requestBody.put("category_id", 34);
        requestBody.put("description", "Online education has rapidly evolved from a niche alternative to a mainstream method of learning. This transformation has been driven by technological advancements, changing perceptions, and the need for flexible learning options.");
        requestBody.put("content", "Accessibility Through MOOCs:Massive Open Online Courses (MOOCs) pioneered accessible online learning, offering high-quality courses from prestigious universities to a global audience.");

        return requestBody;
    }

    public HashMap productFaqRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("title", "What payment methods do you accept for online purchases?");
        requestBody.put("answer", "We accept major credit cards such as Visa, Mastercard, and American Express, as well as PayPal for online purchases.");
        requestBody.put("product_id", 10);

        return requestBody;
    }

    public HashMap productCategoryRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("title", "Educational Equipment");

        return requestBody;
    }

    public HashMap coursefaqRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("title", "What are the key features that differentiate your online learning platform from others?");
        requestBody.put("answer", "The key features that distinguish our online learning platform from others include: a wide range of course content, interactive learning tools, student support services, personalized learning paths that provide a customized learning experience, and a team of up-to-date and qualified instructors");
        requestBody.put("webinar_id", 1995);

        return requestBody;
    }

    public HashMap pricePlanRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("title", "Test Price Plans");
        requestBody.put("dateRange", "2024-06-01 - 2024-06-30");
        requestBody.put("discount", 20);
        requestBody.put("capacity", 50);
        requestBody.put("webinar_id", 2002);

        return requestBody;
    }

    public HashMap categoryRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("title", "Online Education");

        return requestBody;
    }

    public HashMap courseRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("title", "Health And Fitness4");
        requestBody.put("type", "course");
        requestBody.put("slug", "Health-And");
        requestBody.put("start_date", "1625081400");
        requestBody.put("duration", 60);
        requestBody.put("capacity", 5);
        requestBody.put("price", 20);
        requestBody.put("description", "desc");
        requestBody.put("teacher_id", 870);

        return requestBody;
    }

    public HashMap productRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("type", "virtual");
        requestBody.put("price", 100);
        requestBody.put("category_id", 2);
        requestBody.put("title", "Introduction to Yoga: A Beginner's Guide Video Course");
        requestBody.put("summary", "Discover the transformative power of yoga and embark on a journey to wellness.");
        requestBody.put("description", "Are you ready to embark on a journey to holistic wellness? Introduction to Yoga: A Beginners Guide is designed for individuals who want to explore the ancient practice of yoga and reap its numerous benefits. In this comprehensive course, you will learn the fundamentals of yoga, including basic poses, breathing techniques, and meditation practices.");

        return requestBody;
    }

    public HashMap requestBody(String folder) {

        reqBody.put("course", courseRequestBody());
        reqBody.put("category", categoryRequestBody());
        reqBody.put("pricePlan", pricePlanRequestBody());
        reqBody.put("coursefaq", coursefaqRequestBody());
        reqBody.put("product", productRequestBody());
        reqBody.put("productCategory", productCategoryRequestBody());
        reqBody.put("productFaq", productFaqRequestBody());
        reqBody.put("blog", blogRequestBody());
        reqBody.put("blogCategory", blogCategoryRequestBody());
        reqBody.put("coupon", couponRequestBody());
        reqBody.put("support", supportRequestBody());
        reqBody.put("department", departmentRequestBody());
        reqBody.put("contact", contactRequestBody());

        return reqBody.get(folder);
    }
}
