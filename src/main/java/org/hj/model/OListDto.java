package org.hj.model;

public class OListDto {

	private String o_no;
	private String o_id;
	private String o_address;
	private int p_no;
	private int o_num;
	private String o_total;
	private String o_date;
	private boolean o_permit;
	
	
	public String getO_no() {
		return o_no;
	}
	public void setO_no(String o_no) {
		this.o_no = o_no;
	}
	public String getO_id() {
		return o_id;
	}
	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
	public String getO_address() {
		return o_address;
	}
	public void setO_address(String o_address) {
		this.o_address = o_address;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public String getO_total() {
		return o_total;
	}
	public void setO_total(String o_total) {
		this.o_total = o_total;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public boolean isO_permit() {
		return o_permit;
	}
	public void setO_permit(boolean o_permit) {
		this.o_permit = o_permit;
	}
	
	@Override
	public String toString() {
		return "OListDto [o_no=" + o_no + ", o_id=" + o_id + ", o_address=" + o_address + ", p_no=" + p_no + ", o_num="
				+ o_num + ", o_total=" + o_total + ", o_date=" + o_date + ", o_permit=" + o_permit + "]";
	}
	
	
}
