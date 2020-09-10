package com.entrepreneurs.usta.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.entrepreneurs.usta.Model.AppUser;
import com.entrepreneurs.usta.Repositories.AppUserRepository;

@RestController
@RequestMapping("/api")

public class AppUserController {
	@Autowired
	AppUserRepository appuserRepo;

	@GetMapping("/users")
	public Iterable<AppUser> getListOfUsers() {
		return appuserRepo.findAll();
	}

	@GetMapping("/users/{id}")
	public AppUser getOneUserInfo(@PathVariable Long id) {
		return appuserRepo.findById(id).get();
	}
	@GetMapping("/users/{emailAddress}")
	public AppUser getOneUserInfoByEmail(@PathVariable String emailAddress) {
		return appuserRepo.findByEmail(emailAddress.toLowerCase());
	}

	@PostMapping("/users")
	public AppUser addAppUser(@RequestBody AppUser appUser) {
		appuserRepo.save(appUser);
		return appuserRepo.findById(appUser.getId()).get();
	}

	@DeleteMapping("users/{id}")
	public void deleteAppUser(@PathVariable Long id) {
		appuserRepo.deleteById(id);
	}
}
