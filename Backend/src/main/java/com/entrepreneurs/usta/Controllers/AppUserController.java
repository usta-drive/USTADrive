package com.entrepreneurs.usta.Controllers;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.entrepreneurs.usta.Model.AppUser;
import com.entrepreneurs.usta.Model.USTACustomError;
import com.entrepreneurs.usta.Repositories.AppUserRepository;

@RestController
@RequestMapping("/api")

public class AppUserController {

	@Autowired
	AppUserRepository appuserRepo;
	USTACustomError customerError;

	@GetMapping("/users")
	public Iterable<AppUser> getListOfUsers() {
		return appuserRepo.findAll();
	}

	@GetMapping("/users/{id}")
	public AppUser getOneUserInfo(@PathVariable Long id) throws SQLException {
		return appuserRepo.findById(id).get();
	}

	@GetMapping("/login/{emailAddress}/{password}")
	public ResponseEntity<Object> VerifyUserInfoByEmailandPassword(@PathVariable String emailAddress,
			@PathVariable String password) {
		AppUser userFound = appuserRepo.findByEmail(emailAddress.toLowerCase());
		String str = userFound.getUsrPassword();
		if (!userFound.getEmail().equalsIgnoreCase(emailAddress) || (!password.equals(str))) {
			return new ResponseEntity<>("Ivalid username/password", HttpStatus.UNAUTHORIZED);
		}
		return new ResponseEntity<>(userFound, HttpStatus.OK);
	}

	@PostMapping("/users")
	public AppUser addAppUser(@RequestBody AppUser appUser) throws SQLException {
		appuserRepo.save(appUser);
		return appuserRepo.findById(appUser.getId()).get();
	}

	@PutMapping("/users/{id}")
	public ResponseEntity<AppUser> updateUser(@RequestBody AppUser user) {
		appuserRepo.save(user);
		return ResponseEntity.ok(user);
	}

	@DeleteMapping("users/{id}")
	public void deleteAppUser(@PathVariable Long id) {
		appuserRepo.deleteById(id);
	}
}
