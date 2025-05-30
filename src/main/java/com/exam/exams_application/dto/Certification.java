// Certification.java
package com.exam.exams_application.dto;

import java.util.Date;

public class Certification
{
	private String id;
	private Exam exam;
	private int score;
	private int total;
	private Date start;
	private Date end;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
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