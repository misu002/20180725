package BeanModel;

import java.util.List;

public class userinfo {
	private String id;
	private String pw;
	private String name;
	private String year;
	private String month;
	private String day;
	private String gender;
	private String phone;
	private String email;
	private String imgname;
	private List<userinfo> userinfoList;
	
	public userinfo() {}

	public userinfo(String id, String pw, String name, String year, String month, String day, String gender,
			String phone, String email, String imgname, List<userinfo> userinfoList) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.year = year;
		this.month = month;
		this.day = day;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.imgname = imgname;
		this.userinfoList = userinfoList;
	}

	public String getImgname() {
		return imgname;
	}

	public void setImgname(String imgname) {
		this.imgname = imgname;
	}

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getYear() {
		return year;
	}


	public void setYear(String year) {
		this.year = year;
	}


	public String getMonth() {
		return month;
	}


	public void setMonth(String month) {
		this.month = month;
	}


	public String getDay() {
		return day;
	}


	public void setDay(String day) {
		this.day = day;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public List<userinfo> getUserinfoList() {
		return userinfoList;
	}


	public void setUserinfoList(List<userinfo> userinfoList) {
		this.userinfoList = userinfoList;
	}


	@Override
	public String toString() {
		return "userinfo [id=" + id + ", pw=" + pw + ", name=" + name + ", year=" + year + ", month=" + month + ", day="
				+ day + ", gender=" + gender + ", phone=" + phone + ", email=" + email + "]";
	}
	
	
	
}
