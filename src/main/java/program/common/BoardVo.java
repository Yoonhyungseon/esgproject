package program.common;

public class BoardVo {
	private String ssn;
	private String name;
	private String title;
	private String contents;
	private String insert_time;
	private String delete_yn;
	private String view_count;
	
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getInsert_time() {
		return insert_time;
	}
	public void setInsert_time(String insert_time) {
		this.insert_time = insert_time;
	}
	public String getDelete_yn() {
		return delete_yn;
	}
	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}
	public String getView_count() {
		return view_count;
	}
	public void setView_count(String view_count) {
		this.view_count = view_count;
	}
	@Override
	public String toString() {
		return "BoardVo [ssn=" + ssn + ", name=" + name + ", title=" + title + ", contents=" + contents
				+ ", insert_time=" + insert_time + ", delete_yn=" + delete_yn + ", view_count=" + view_count + "]";
	}






}
