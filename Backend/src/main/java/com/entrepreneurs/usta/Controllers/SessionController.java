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

import com.entrepreneurs.usta.Model.Session;
import com.entrepreneurs.usta.Repositories.SessionRepository;

@RestController
@RequestMapping("/api")
public class SessionController {
	@Autowired
	SessionRepository sessionRepo;

	@GetMapping("/sessions")
	public Iterable<Session> getListOfSessions() {
		return sessionRepo.findAll();
	}

	@GetMapping("/sessions/{id}")
	public Session getOneSessionInfo(@PathVariable Long id) {
		return sessionRepo.findById(id).get();
	}

	@PostMapping("/sessions")
	
	public Session addSession(@RequestBody Session session) {
		sessionRepo.save(session);
		return sessionRepo.findById(session.getSessionId()).get();
	}
	@PutMapping("/sessions/{id}")
	public ResponseEntity<Session> updateSession(@RequestBody Session session) {
		sessionRepo.save(session);
		return ResponseEntity.ok(session);
	}
	@DeleteMapping("sessions/{id}")
	public void deleteSession(@PathVariable Long id) {
		sessionRepo.deleteById(id);
	}

}
