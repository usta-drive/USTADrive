package com.entrepreneurs.usta.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class AppUser {
	@Id
	@GeneratedValue
	private Long id;
	private String userName;
	private String firstName;
	private String lastName;
	private String usrPassword;
	private Long phone;
	private String email;
	private String gender;
	private Integer age;
	private String userPhoto;
	private String address1;
	private String address2;
	private String cityName;
	private String stateName;
	private String zipCode;
	private String attributeName;
	private String userType;
	private String userRole;
	private String securityQuestion;
	private boolean flag=false;

	public AppUser() {}
	

	public AppUser(String userName, String firstName, String lastName, String usrPassword, Long phone, String email,
			String gender, Integer age, String userPhoto, String address1, String address2, String cityName,
			String stateName, String zipCode, String attributeName, String userType, String userRole,
			String securityQuestion) {
		super();
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.usrPassword = usrPassword;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.age = age;
		this.userPhoto = userPhoto;
		this.address1 = address1;
		this.address2 = address2;
		this.cityName = cityName;
		this.stateName = stateName;
		this.zipCode = zipCode;
		this.attributeName = attributeName;
		this.userType = userType;
		this.userRole = userRole;
		this.securityQuestion = securityQuestion;

	}


	public Long getId() {
		return id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsrPassword() {
		return usrPassword;
	}

	public void setUsrPassword(String usrPassword) {
		this.usrPassword = usrPassword;
	}

	public Long getPhone() {
		return phone;
	}

	public void setPhone(Long phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAttributeName() {
		return attributeName;
	}

	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getSecurityQuestion() {
		return securityQuestion;
	}

	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

}
