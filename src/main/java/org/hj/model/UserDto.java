package org.hj.model;

public class UserDto {

	 private String u_id;
	 private String u_name;
	 private String u_pw;
	 private String u_email;
	 private String u_address;
	 private String u_no;
	 
	 
	 
	//getter setter
	 
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_address() {
		return u_address;
	}
	public void setU_address(String u_address) {
		this.u_address = u_address;
	}
	public String getU_no() {
		return u_no;
	}
	public void setU_no(String u_no) {
		this.u_no = u_no;
	}
	
	
	@Override
	public String toString() {
		return "UserDto [u_id=" + u_id + ", u_name=" + u_name + ", u_pw=" + u_pw
				+ ", u_email=" + u_email + ", u_address=" + u_address
				+ ", u_no=" + u_no + "]";
	}	

	
	 
	 

}
