package com.entrepreneurs.usta.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;

import com.entrepreneurs.usta.Repositories.AppUserRepository;

public class Initializer implements CommandLineRunner {
	@Autowired
	AppUserRepository appuserRepo;
	public void run(String... args) throws Exception {
		AppUser user1=new AppUser("Sarah","***");
		appuserRepo.save(user1);
		
	}
}
