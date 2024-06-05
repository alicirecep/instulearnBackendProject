package pojos;

import java.io.Serializable;

public class TranslationsPojo implements Serializable {
	private int id;
	private int faqId;
	private String locale;
	private String title;
	private String answer;

	public void setId(int id){
		this.id = id;
	}

	public int getId(){
		return id;
	}

	public void setFaqId(int faqId){
		this.faqId = faqId;
	}

	public int getFaqId(){
		return faqId;
	}

	public void setLocale(String locale){
		this.locale = locale;
	}

	public String getLocale(){
		return locale;
	}

	public void setTitle(String title){
		this.title = title;
	}

	public String getTitle(){
		return title;
	}

	public void setAnswer(String answer){
		this.answer = answer;
	}

	public String getAnswer(){
		return answer;
	}

	@Override
 	public String toString(){
		return 
			"TranslationsPojo{" + 
			"id = '" + id + '\'' + 
			",faq_id = '" + faqId + '\'' + 
			",locale = '" + locale + '\'' + 
			",title = '" + title + '\'' + 
			",answer = '" + answer + '\'' + 
			"}";
		}

	public TranslationsPojo() {
	}

	public TranslationsPojo(int id, int faqId, String locale, String title, String answer) {
		this.id = id;
		this.faqId = faqId;
		this.locale = locale;
		this.title = title;
		this.answer = answer;
	}
}