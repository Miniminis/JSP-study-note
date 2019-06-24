package web;

public class Member {
	private String name;
	private String id;
	private String pnum;

	public Member(String name, String id, String pnum) {
		this.name = name;
		this.id = id;
		this.pnum = pnum;
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String toString() {
		return "Member [name = "+name+"/ id = "+id+"/ pnum="+pnum+"]";
	}
}
