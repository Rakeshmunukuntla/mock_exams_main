// Exam.java
package com.exam.exams_application.dto;

import java.util.List;

public class Exam {

	private String examName;

	private List<Question> question;

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public List<Question> getQuestion() {
		return question;
	}

	public void setQuestion(List<Question> question) {
		this.question = question;
	}

}