package program.common;

public class MemberVo {
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_email;
	private String user_gender;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	@Override
	public String toString() {
		return "MemberVo [user_id=" + user_id + ", user_password=" + user_password + ", user_name=" + user_name + ", user_email=" + user_email
				+ ", user_gender=" + user_gender + "]";
	}
}
