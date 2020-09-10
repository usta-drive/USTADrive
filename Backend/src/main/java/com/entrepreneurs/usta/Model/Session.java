package com.entrepreneurs.usta.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;


@Entity
public class Session {
	
	@Id
	@GeneratedValue
	private Long sessionId;
	
	@ManyToOne
	private StudEnroll studEnroll;
	
	@OneToOne
	private Calender calender;
	
	private String instReview;
	private boolean flag = false;
	
	
	public Session() {
		super();
		
	}


	public Session(StudEnroll studEnroll, Calender calender, String instReview, boolean flag) {
		super();
		this.studEnroll = studEnroll;
		this.calender = calender;
		this.instReview = instReview;
		this.flag = flag;
	}


	public String getInstReview() {
		return instReview;
	}


	public void setInstReview(String instReview) {
		this.instReview = instReview;
	}


	public boolean isFlag() {
		return flag;
	}


	public void setFlag(boolean flag) {
		this.flag = flag;
	}


	public Long getSessionId() {
		return sessionId;
	}


	public StudEnroll getStudEnroll() {
		return studEnroll;
	}


	public Calender getCalender() {
		return calender;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((sessionId == null) ? 0 : sessionId.hashCode());
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
		Session other = (Session) obj;
		if (sessionId == null) {
			if (other.sessionId != null)
				return false;
		} else if (!sessionId.equals(other.sessionId))
			return false;
		return true;
	}
	
	
	
	
	
	
	

}
