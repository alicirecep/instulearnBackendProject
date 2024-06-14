package pojos.coupon;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CouponPojoRequest {

    /*
    {
       "title":"Test Coupon",
       "discount_type":"percentage",
       "source":"course",
       "code":"TST78945",
       "percent":15,
       "amount":10,
       "max_amount":200,
       "minimum_order":1,
       "count":50,
       "product_type":"all",
       "for_first_purchase":0,
       "expired_at":"2024-06-06"
     }
     */

    private String title;
    private String discount_type;
    private String source;
    private String code;
    private int percent;
    private int amount;
    private int max_amount;
    private int minimum_order;
    private int count;
    private String product_type;
    private int for_first_purchase;
    private String expired_at;
}
