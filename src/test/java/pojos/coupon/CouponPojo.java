package pojos.coupon;

import java.io.Serializable;

public class CouponPojo implements Serializable {
	private String remark;
	private int status;
	private CouponDataPojo data;

	public void setRemark(String remark){
		this.remark = remark;
	}

	public String getRemark(){
		return remark;
	}

	public void setStatus(int status){
		this.status = status;
	}

	public int getStatus(){
		return status;
	}

	public void setData(CouponDataPojo data){
		this.data = data;
	}

	public CouponDataPojo getData(){
		return data;
	}

	@Override
 	public String toString(){
		return 
			"CouponPojo{" + 
			"remark = '" + remark + '\'' + 
			",status = '" + status + '\'' + 
			",data = '" + data + '\'' + 
			"}";
		}

	public CouponPojo() {
	}

	public CouponPojo(String remark, int status, CouponDataPojo data) {
		this.remark = remark;
		this.status = status;
		this.data = data;
	}
}