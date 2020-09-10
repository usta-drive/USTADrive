package com.entrepreneurs.usta.Repositories;



import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.repository.CrudRepository;

import com.entrepreneurs.usta.Model.AppUser;

public interface AppUserRepository extends JpaRepository<AppUser, Long> {

	AppUser findByEmail(String email);
	

}
