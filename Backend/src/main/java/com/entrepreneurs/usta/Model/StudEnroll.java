package com.entrepreneurs.usta.Model;

import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class StudEnroll {
	@Id
	@GeneratedValue
	private Long id;
	@ManyToOne
	private Student student;
	@OneToOne
	private InstOffering offerId;
	private int rating;
	private String StudComment;
	private String instComment;
	private String courseResult;
	private String certificateId;
// get date from sql or from java.util
	private Date startEndDate;
	

}
