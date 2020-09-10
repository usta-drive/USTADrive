package com.entrepreneurs.usta.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;

import com.entrepreneurs.usta.Repositories.AppUserRepository;

public class Initializer implements CommandLineRunner {
	@Autowired
	AppUserRepository appuserRepo;
	public void run(String... args) throws Exception {
		AppUser user1=new AppUser("mohamed@x.com", "firstName", " lastName", "Mypassword",12365498, "mohamed@x.com",
				"male", 33, "userPhoto", "address1", "address2","cityName",
				"stateName", 430154, "attributeName", "user_type", "user_role","securityQuestion");
		appuserRepo.save(user1);
		
	}
}
