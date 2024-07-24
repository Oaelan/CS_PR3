package org.hj.model;

public class OListDto {

	//Orderlist자료
	private String o_no;
	private String o_id;
	private String o_address;
	private int sum_o_num;
	private String sum_o_total;
	private String o_date;
	private Boolean o_permit;
	
	//조인 위한 상품등록 자료 
	private int p_no;
	private int o_num;
	private String p_name;
	private String o_total;
	
	//출하 물품 종류의 개수
	private int p_count;
	
	
	
	
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
	public Boolean isO_permit() {
		return o_permit;
	}
	public void setO_permit(Boolean o_permit) {
		this.o_permit = o_permit;
	}
	public int getSum_o_num() {
		return sum_o_num;
	}
	public void setSum_o_num(int sum_o_num) {
		this.sum_o_num = sum_o_num;
	}
	public String getSum_o_total() {
		return sum_o_total;
	}
	public void setSum_o_total(String sum_o_total) {
		this.sum_o_total = sum_o_total;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}

	
	@Override
	public String toString() {
		return "OListDto [o_no=" + o_no + ", o_id=" + o_id + ", o_address=" + o_address + ", sum_o_num=" + sum_o_num
				+ ", sum_o_total=" + sum_o_total + ", o_date=" + o_date + ", o_permit=" + o_permit + ", p_no=" + p_no
				+ ", o_num=" + o_num + ", p_name=" + p_name + ", o_total=" + o_total + ", p_count=" + p_count + "]";
	}
	
	
	
}
