package pojos.coupon;

import java.io.Serializable;

public class CouponDataPojo implements Serializable {
	private int id;
	private int creatorId;
	private String title;
	private String discountType;
	private String source;
	private String code;
	private int percent;
	private int amount;
	private int maxAmount;
	private int minimumOrder;
	private int count;
	private String userType;
	private String productType;
	private int forFirstPurchase;
	private String status;
	private int expiredAt;
	private int createdAt;

	public void setId(int id){
		this.id = id;
	}

	public int getId(){
		return id;
	}

	public void setCreatorId(int creatorId){
		this.creatorId = creatorId;
	}

	public int getCreatorId(){
		return creatorId;
	}

	public void setTitle(String title){
		this.title = title;
	}

	public String getTitle(){
		return title;
	}

	public void setDiscountType(String discountType){
		this.discountType = discountType;
	}

	public String getDiscountType(){
		return discountType;
	}

	public void setSource(String source){
		this.source = source;
	}

	public String getSource(){
		return source;
	}

	public void setCode(String code){
		this.code = code;
	}

	public String getCode(){
		return code;
	}

	public void setPercent(int percent){
		this.percent = percent;
	}

	public int getPercent(){
		return percent;
	}

	public void setAmount(int amount){
		this.amount = amount;
	}

	public int getAmount(){
		return amount;
	}

	public void setMaxAmount(int maxAmount){
		this.maxAmount = maxAmount;
	}

	public int getMaxAmount(){
		return maxAmount;
	}

	public void setMinimumOrder(int minimumOrder){
		this.minimumOrder = minimumOrder;
	}

	public int getMinimumOrder(){
		return minimumOrder;
	}

	public void setCount(int count){
		this.count = count;
	}

	public int getCount(){
		return count;
	}

	public void setUserType(String userType){
		this.userType = userType;
	}

	public String getUserType(){
		return userType;
	}

	public void setProductType(String productType){
		this.productType = productType;
	}

	public String getProductType(){
		return productType;
	}

	public void setForFirstPurchase(int forFirstPurchase){
		this.forFirstPurchase = forFirstPurchase;
	}

	public int getForFirstPurchase(){
		return forFirstPurchase;
	}

	public void setStatus(String status){
		this.status = status;
	}

	public String getStatus(){
		return status;
	}

	public void setExpiredAt(int expiredAt){
		this.expiredAt = expiredAt;
	}

	public int getExpiredAt(){
		return expiredAt;
	}

	public void setCreatedAt(int createdAt){
		this.createdAt = createdAt;
	}

	public int getCreatedAt(){
		return createdAt;
	}

	@Override
 	public String toString(){
		return 
			"DataPojo{" + 
			"id = '" + id + '\'' + 
			",creator_id = '" + creatorId + '\'' + 
			",title = '" + title + '\'' + 
			",discount_type = '" + discountType + '\'' + 
			",source = '" + source + '\'' + 
			",code = '" + code + '\'' + 
			",percent = '" + percent + '\'' + 
			",amount = '" + amount + '\'' + 
			",max_amount = '" + maxAmount + '\'' + 
			",minimum_order = '" + minimumOrder + '\'' + 
			",count = '" + count + '\'' + 
			",user_type = '" + userType + '\'' + 
			",product_type = '" + productType + '\'' + 
			",for_first_purchase = '" + forFirstPurchase + '\'' + 
			",status = '" + status + '\'' + 
			",expired_at = '" + expiredAt + '\'' + 
			",created_at = '" + createdAt + '\'' + 
			"}";
		}

	public CouponDataPojo() {
	}

	public CouponDataPojo(int id, int creatorId, String title, String discountType, String source, String code, int percent, int amount, int maxAmount, int minimumOrder, int count, String userType, String productType, int forFirstPurchase, String status, int expiredAt, int createdAt) {
		this.id = id;
		this.creatorId = creatorId;
		this.title = title;
		this.discountType = discountType;
		this.source = source;
		this.code = code;
		this.percent = percent;
		this.amount = amount;
		this.maxAmount = maxAmount;
		this.minimumOrder = minimumOrder;
		this.count = count;
		this.userType = userType;
		this.productType = productType;
		this.forFirstPurchase = forFirstPurchase;
		this.status = status;
		this.expiredAt = expiredAt;
		this.createdAt = createdAt;
	}
}