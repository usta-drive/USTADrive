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

import com.entrepreneurs.usta.Model.Instructer;
import com.entrepreneurs.usta.Repositories.InstructerRepository;

@RestController
@RequestMapping("/api")
public class InstructerController {

	@Autowired
	InstructerRepository instructerRepo;

	@GetMapping("/instructers")
	public Iterable<Instructer> getListOfInstructers() {
		return instructerRepo.findAll();
	}

	@GetMapping("/instructers/{id}")
	public Instructer getOneInstructerInfo(@PathVariable Long id) {
		return instructerRepo.findById(id).get();
	}

	@PostMapping("/instructers")
	
	public Instructer addInstructer(@RequestBody Instructer instructer) {
		instructerRepo.save(instructer);
		return instructerRepo.findById(instructer.getId()).get();
	}
	@PutMapping("/instructers/{id}")
	public ResponseEntity<Instructer> updateInstructer(@RequestBody Instructer instructer) {
		instructerRepo.save(instructer);
		return ResponseEntity.ok(instructer);
	}
	@DeleteMapping("instructers/{id}")
	public void deleteInstructer(@PathVariable Long id) {
		instructerRepo.deleteById(id);
	}

}
