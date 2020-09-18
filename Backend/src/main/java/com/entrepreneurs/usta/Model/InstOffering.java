package com.entrepreneurs.usta.Model;

import java.sql.Time;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class InstOffering {
	
	@Id
	@GeneratedValue
	private Long id;
	@ManyToOne
	private Instructer instructer;
//	@OneToOne
//	private Course course;
	private Time durationTime;
	private double price;
	private double discount;
	
	public InstOffering() {
		
	}
	
	public InstOffering(Instructer instructer, Time durationTime, double price, double discount) {
		super();
		this.instructer = instructer;
//		this.course = course;
		this.durationTime = durationTime;
		this.price = price;
		this.discount = discount;
	}

	public Long getId() {
		return id;
	}

	public Instructer getInstructer() {
		return instructer;
	}
	public void setInstructer(Instructer instructer) {
		this.instructer = instructer;
	}
//	public Course getCourse() {
//		return course;
//	}
//	public void setCourse(Course course) {
//		this.course = course;
//	}
	public Time getDurationTime() {
		return durationTime;
	}
	public void setDurationTime(Time durationTime) {
		this.durationTime = durationTime;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	} 
	
	
	
	
}
