package com.entrepreneurs.usta.Model;

public class USTACustomError {
	String ErrorCode;
	  String ErrorDescription;
  public USTACustomError(String str1, String str2) {
		this.ErrorCode=str1;
		this.ErrorDescription=str2;
	}

  
	  public void invalidLogin(String x, String y) {
		this.ErrorCode=x;
		this.ErrorDescription=y; 
	
  }
                  
}
