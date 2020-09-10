package com.entrepreneurs.usta.Model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;


@Entity
public class Instructer extends AppUser {
	
	private String instBio;
	private String intTrainingLicense;
	private String intDrivingLicense;
	private List<String> instLangs;
	private String bankName;
	private Integer bankAccNo;
	private Integer bankRoutingNo;
	private String paypalAcc;
	private Double wallTotalAmount;
	private Double wallColdAmount;
	private Double wallAvailAmount;
	private Double wallNumOfWithdraw;
	private Boolean flag;
	
	
	
	
	
	public Instructer() {
		super();
	
	}





	public Instructer(String userName, String firstName, String lastName, String usrPassword, int phone, String email,
			String gender, int age, String userPhoto, String address1, String address2, String cityName,
			String stateName, int zipCode, String attributeName,
			String securityQuestion) {
		
		
			super(userName, firstName, lastName, usrPassword, phone, email,
					gender, age, userPhoto, address1, address2, cityName,
					 stateName, zipCode, attributeName,"instructer", "instructer",
						securityQuestion);
			this.instBio = null;
			this.intTrainingLicense = null;
			this.intDrivingLicense = null;
			this.instLangs = new ArrayList<>();
			this.bankName = null;
			this.bankAccNo = null;
			this.bankRoutingNo = null;
			this.paypalAcc = null;
			this.wallTotalAmount = null;
			this.wallColdAmount = null;
			this.wallAvailAmount = null;
			this.wallNumOfWithdraw = null;
			this.flag = false;
		
		
	}





	public String getInstBio() {
		return instBio;
	}





	public void setInstBio(String instBio) {
		this.instBio = instBio;
	}





	public String getIntTrainingLicense() {
		return intTrainingLicense;
	}





	public void setIntTrainingLicense(String intTrainingLicenses) {
		this.intTrainingLicense = intTrainingLicenses;
	}





	public String getIntDrivingLicense() {
		return intDrivingLicense;
	}





	public void setIntDrivingLicense(String intDrivingLicenses) {
		this.intDrivingLicense = intDrivingLicenses;
	}





	public List<String> getInstLangs() {
		return instLangs;
	}





	public void setInstLangs(List<String> instLangs) {
		this.instLangs = instLangs;
	}





	public String getBankName() {
		return bankName;
	}





	public void setBankName(String bankName) {
		this.bankName = bankName;
	}





	public Integer getBankAccNo() {
		return bankAccNo;
	}





	public void setBankAccNo(Integer bankAccNo) {
		this.bankAccNo = bankAccNo;
	}





	public Integer getBankRoutingNo() {
		return bankRoutingNo;
	}





	public void setBankRoutingNo(Integer bankRoutingNo) {
		this.bankRoutingNo = bankRoutingNo;
	}





	public String getPaypalAcc() {
		return paypalAcc;
	}





	public void setPaypalAcc(String paypalAcc) {
		this.paypalAcc = paypalAcc;
	}





	public Double getWallTotalAmount() {
		return wallTotalAmount;
	}





	public void setWallTotalAmount(Double wallTotalAmount) {
		this.wallTotalAmount = wallTotalAmount;
	}





	public Double getWallColdAmount() {
		return wallColdAmount;
	}





	public void setWallColdAmount(Double wallColdAmount) {
		this.wallColdAmount = wallColdAmount;
	}





	public Double getWallAvailAmount() {
		return wallAvailAmount;
	}





	public void setWallAvailAmount(Double wallAvailAmount) {
		this.wallAvailAmount = wallAvailAmount;
	}





	public Double getWallNumOfWithdraw() {
		return wallNumOfWithdraw;
	}





	public void setWallNumOfWithdraw(Double wallNumOfWithdraw) {
		this.wallNumOfWithdraw = wallNumOfWithdraw;
	}





	public Boolean getFlag() {
		return flag;
	}





	public void setFlag(Boolean flag) {
		this.flag = flag;
	}
	
	
	
	
}
