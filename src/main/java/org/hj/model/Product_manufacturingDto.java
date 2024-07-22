package org.hj.model;

public class Product_manufacturingDto {

	private String m_date;
	private int p_no;
	private String p_name;
	private int p_price;
	private int m_num;
	private String p_limitD;
	
	
	// getter setter
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getP_limitD() {
		return p_limitD;
	}
	public void setP_limitD(String p_limitD) {
		this.p_limitD = p_limitD;
	}
	
	
	@Override
	public String toString() {
		return "Product_manufacturingDto [m_date=" + m_date + ", p_no=" + p_no
				+ ", p_name=" + p_name + ", p_price=" + p_price + ", m_num="
				+ m_num + ", p_limitD=" + p_limitD + "]";
	}
	
	
	

}
