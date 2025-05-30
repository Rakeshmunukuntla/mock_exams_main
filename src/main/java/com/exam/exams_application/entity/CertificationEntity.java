// Certification.java
package com.exam.exams_application.entity;

import com.exam.exams_application.dto.Exam;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.util.Date;

@Entity
public class CertificationEntity
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long certId;

	private String id;
	private String exam;
	private int score;
	private int total;
	private Date start;
	private Date end;

	public String getExam() {
		return exam;
	}

	public void setExam(String exam) {
		this.exam = exam;
	}

	public Long getCertId() {
		return certId;
	}

	public void setCertId(Long certId) {
		this.certId = certId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}



	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}
}