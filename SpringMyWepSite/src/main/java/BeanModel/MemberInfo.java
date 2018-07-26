package BeanModel;

public class MemberInfo {
	private String id;
	private String password;
	
	public MemberInfo() {
		
	}
	
	public MemberInfo(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "MemberInfo [id=" + id + ", password=" + password + "]";
	}
	
	
	
}
