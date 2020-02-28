package kr.co.project.model;

public class MemberVO {

	private String id;
	private String name;
	private String title;
	private String userid;
	
	public MemberVO() {}
	
	public MemberVO(String id, String name, String title, String userid) {
		super();
		this.id = id;
		this.name = name;
		this.title = title;
		this.userid = userid;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	
}
