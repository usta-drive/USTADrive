package com.entrepreneurs.usta.Model;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class Calender {

	@Id
	@GeneratedValue
	private Long calenderId;
	
	@ManyToOne
	private Instructer instructer;
	
	private Date startEndDate;
	private Time startEndTime;
	private boolean flag = false;
	
	
	
	public Calender() {
		super();
		
	}
	public Calender(Instructer instructer, Date startEndDate, Time startEndTime, boolean flag) {
		super();
		this.instructer = instructer;
		this.startEndDate = startEndDate;
		this.startEndTime = startEndTime;
		this.flag = flag;
	}
	public Date getStartEndDate() {
		return startEndDate;
	}
	public void setStartEndDate(Date startEndDate) {
		this.startEndDate = startEndDate;
	}
	public Time getStartEndTime() {
		return startEndTime;
	}
	public void setStartEndTime(Time startEndTime) {
		this.startEndTime = startEndTime;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public Long getCalenderId() {
		return calenderId;
	}
	public Instructer getInstructer() {
		return instructer;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((calenderId == null) ? 0 : calenderId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Calender other = (Calender) obj;
		if (calenderId == null) {
			if (other.calenderId != null)
				return false;
		} else if (!calenderId.equals(other.calenderId))
			return false;
		return true;
	}
	
	
	
}
