package org.hj.model;

public class FactoryTempDto {

	private double	now_temp;
	private String 	time;
	private String	state;
	
	//getter setter
	public double getNow_temp() {
		return now_temp;
	}
	public void setNow_temp(double now_temp) {
		this.now_temp = now_temp;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	@Override
	public String toString() {
		return "FactoryTempDto [now_temp=" + now_temp + ", time=" + time
				+ ", state=" + state + "]";
	}
	

	
	
}
