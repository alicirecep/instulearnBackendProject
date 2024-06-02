package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PricePlanPojo {

    /*
    {
      "title":"Test Price Plans",
      "dateRange":"2024-06-01 - 2024-06-30",
      "discount":20,
      "capacity":50,
      "webinar_id":2002
    }
     */

    private String title;
    private String dateRange;
    private int discount;
    private int capacity;
    private int webinar_id;
}
