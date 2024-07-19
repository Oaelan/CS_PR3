package org.hj.model;

public class MasterDto {

	private String  m_id;
	private String  m_pw;
	
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	
	
	@Override
	public String toString() {
		return "MasterDto [m_id=" + m_id + ", m_pw=" + m_pw + "]";
	}
	

	
}
