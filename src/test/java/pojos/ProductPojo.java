package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductPojo {
    /*
    {
  "type": "virtual",
  "price": 100,
  "category_id":2,
  "title": "Introduction to Yoga: A Beginner's Guide Video Course",
  "summary": "Discover the transformative power of yoga and embark on a journey to wellness.",
  "description": "Are you ready to embark on a journey to holistic wellness? 'Introduction to Yoga: A Beginner's Guide' is designed for individuals who want to explore the ancient practice of yoga and reap its numerous benefits. In this comprehensive course, you will learn the fundamentals of yoga, including basic poses, breathing techniques, and meditation practices. Led by experienced yoga instructors, you will develop strength, flexibility, and inner peace as you progress through the course. Whether you're a complete beginner or looking to deepen your practice, this course will empower you to cultivate a healthier mind, body, and spirit. Join us and unlock the transformative power of yoga today!"
}
     */

    private String type;
    private int price;
    private int category_id;
    private String title;
    private String summary;
    private String description;
}
