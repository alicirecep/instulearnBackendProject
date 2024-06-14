package pojos.productfaq;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductfaqPojo {
    /*
    {
      "title":"What payment methods do you accept for online purchases?",
      "answer":"We accept major credit cards such as Visa, Mastercard, and American Express, as well as PayPal for online purchases.",
      "product_id":10
    }
     */

    private String title;
    private String answer;
    private int product_id;

}
