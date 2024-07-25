package org.hj.model;

public class DeliveryDto {

	private int d_no;
	private String o_no;
	private String o_id;
	private String o_address;
	private Boolean d_complete;
	private String start;
	
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
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
	public Boolean getD_complete() {
		return d_complete;
	}
	public void setD_complete(Boolean d_complete) {
		this.d_complete = d_complete;
	}
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	@Override
	public String toString() {
		return "DeliveryDto [d_no=" + d_no + ", o_no=" + o_no + ", o_id=" + o_id + ", o_address=" + o_address
				+ ", d_complete=" + d_complete + ", start=" + start + "]";
	}
	
	
	
}
