package com.entrepreneurs.usta.Repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.http.ResponseEntity;

import com.entrepreneurs.usta.Model.AppUser;

public interface AppUserRepository extends CrudRepository<AppUser, Long> {

	AppUser findByEmail(String email);
	

}
