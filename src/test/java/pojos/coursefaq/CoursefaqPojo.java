package pojos.coursefaq;

import java.io.Serializable;

public class CoursefaqPojo implements Serializable {
	private String remark;
	private int status;
	private DataPojo data;

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

	public void setData(DataPojo data){
		this.data = data;
	}

	public DataPojo getData(){
		return data;
	}

	@Override
 	public String toString(){
		return 
			"CoursefaqPojo{" + 
			"remark = '" + remark + '\'' + 
			",status = '" + status + '\'' + 
			",data = '" + data + '\'' + 
			"}";
		}

	public CoursefaqPojo() {
	}

	public CoursefaqPojo(String remark, int status, DataPojo data) {
		this.remark = remark;
		this.status = status;
		this.data = data;
	}
}