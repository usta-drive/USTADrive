package com.entrepreneurs.usta.Model;



import java.sql.Date;
import java.sql.Time;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;

import com.entrepreneurs.usta.Repositories.AppUserRepository;
import com.entrepreneurs.usta.Repositories.CalenderRepository;
import com.entrepreneurs.usta.Repositories.InstructerRepository;
import com.entrepreneurs.usta.Repositories.SessionRepository;
import com.entrepreneurs.usta.Repositories.StudEnrollRepository;

public class Initializer implements CommandLineRunner {
	@Autowired
	AppUserRepository appuserRepo;
	
	@Autowired
	InstructerRepository instructerRepo;
	
	@Autowired
	SessionRepository sessionRepo;
	
	@Autowired
	CalenderRepository calenderRepo;
	
	@Autowired
	StudEnrollRepository StudEnrollRepo;
	
	public void run(String... args) throws Exception {
		AppUser user1=new AppUser("mohamed@x.com", "firstName", " lastName", "Mypassword",12365498, "mohamed@x.com",
				"male", 33, "userPhoto", "address1", "address2","cityName",
				"stateName", 430154, "attributeName", "user_type", "user_role","securityQuestion");
		appuserRepo.save(user1);
		
		//Add instructor
		Instructer inst1 = new Instructer("inst1@x.com", "inst1", " lastName", "5676535",12365498, "inst1@gmil.com",
				"male", 29, "userPhoto", "address1", "address2","albany",
				"NY", 430154, "attributeName","securityQuestion");
		instructerRepo.save(inst1);
		//Add calendar to ints1
		Calender calenderInst1 = new Calender(inst1,new Date(0),new Time(0),true);
		calenderRepo.save(calenderInst1);
		//Add session 
		StudEnroll studEnroll1 =  new StudEnroll();
		StudEnrollRepo.save(studEnroll1);
		Session session = new Session(studEnroll1 , calenderInst1,"good at vocous",true);
		sessionRepo.save(session);
	}
}
