package com.entrepreneurs.usta.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.entrepreneurs.usta.Model.Calender;
import com.entrepreneurs.usta.Repositories.CalenderRepository;

@RestController
@RequestMapping("/api")
public class CalenderController {
	
	@Autowired
	CalenderRepository calenderRepo;

	@GetMapping("/calenders")
	public Iterable<Calender> getListOfCalenders() {
		return calenderRepo.findAll();
	}

	@GetMapping("/calenders/{id}")
	public Calender getOneCalenderInfo(@PathVariable Long id) {
		return calenderRepo.findById(id).get();
	}

	@PostMapping("/calenders")
	
	public Calender addCalender(@RequestBody Calender calender) {
		calenderRepo.save(calender);
		return calenderRepo.findById(calender.getCalenderId()).get();
	}
	@PutMapping("/calenders/{id}")
	public ResponseEntity<Calender> updateCalender(@RequestBody Calender calender) {
		calenderRepo.save(calender);
		return ResponseEntity.ok(calender);
	}
	@DeleteMapping("calenders/{id}")
	public void deleteCalender(@PathVariable Long id) {
		calenderRepo.deleteById(id);
	}

}
