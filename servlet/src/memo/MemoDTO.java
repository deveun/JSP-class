package memo;

public class MemoDTO {
	private String id;
	private String email;
	private String content;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MemoDTO(String id, String email, String content) {
		super();
		this.id = id;
		this.email = email;
		this.content = content;
	}
	public MemoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
