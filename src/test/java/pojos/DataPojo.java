package pojos;

import java.util.List;
import java.io.Serializable;

public class DataPojo implements Serializable {
	private int id;
	private int creatorId;
	private int webinarId;
	private Object bundleId;
	private Object upcomingCourseId;
	private Object order;
	private int createdAt;
	private int updatedAt;
	private Object title;
	private Object answer;
	private List<TranslationsPojo> translations;

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

	public void setWebinarId(int webinarId){
		this.webinarId = webinarId;
	}

	public int getWebinarId(){
		return webinarId;
	}

	public void setBundleId(Object bundleId){
		this.bundleId = bundleId;
	}

	public Object getBundleId(){
		return bundleId;
	}

	public void setUpcomingCourseId(Object upcomingCourseId){
		this.upcomingCourseId = upcomingCourseId;
	}

	public Object getUpcomingCourseId(){
		return upcomingCourseId;
	}

	public void setOrder(Object order){
		this.order = order;
	}

	public Object getOrder(){
		return order;
	}

	public void setCreatedAt(int createdAt){
		this.createdAt = createdAt;
	}

	public int getCreatedAt(){
		return createdAt;
	}

	public void setUpdatedAt(int updatedAt){
		this.updatedAt = updatedAt;
	}

	public int getUpdatedAt(){
		return updatedAt;
	}

	public void setTitle(Object title){
		this.title = title;
	}

	public Object getTitle(){
		return title;
	}

	public void setAnswer(Object answer){
		this.answer = answer;
	}

	public Object getAnswer(){
		return answer;
	}

	public void setTranslations(List<TranslationsPojo> translations){
		this.translations = translations;
	}

	public List<TranslationsPojo> getTranslations(){
		return translations;
	}

	@Override
 	public String toString(){
		return 
			"DataPojo{" + 
			"id = '" + id + '\'' + 
			",creator_id = '" + creatorId + '\'' + 
			",webinar_id = '" + webinarId + '\'' + 
			",bundle_id = '" + bundleId + '\'' + 
			",upcoming_course_id = '" + upcomingCourseId + '\'' + 
			",order = '" + order + '\'' + 
			",created_at = '" + createdAt + '\'' + 
			",updated_at = '" + updatedAt + '\'' + 
			",title = '" + title + '\'' + 
			",answer = '" + answer + '\'' + 
			",translations = '" + translations + '\'' + 
			"}";
		}

	public DataPojo() {
	}

	public DataPojo(int id, int creatorId, int webinarId, Object bundleId, Object upcomingCourseId, Object order, int createdAt, int updatedAt, Object title, Object answer, List<TranslationsPojo> translations) {
		this.id = id;
		this.creatorId = creatorId;
		this.webinarId = webinarId;
		this.bundleId = bundleId;
		this.upcomingCourseId = upcomingCourseId;
		this.order = order;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.title = title;
		this.answer = answer;
		this.translations = translations;
	}
}