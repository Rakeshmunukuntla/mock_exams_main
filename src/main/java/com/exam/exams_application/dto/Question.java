// Question.java
package com.exam.exams_application.dto;

import java.util.Map;
import java.util.Set;

public class Question {
	private Integer sno;
	private String qText;
	private String qnotes;
	private String module;
	private Map<String, String> options;
	private Set<String> correctAnswers;
	private Set<String> selectedAnswers;
	private boolean correct;

	public Integer getSno() {
		return sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}

	public String getqText() {
		return qText;
	}

	public void setqText(String qText) {
		this.qText = qText;
	}

	public String getQnotes() {
		return qnotes;
	}

	public void setQnotes(String qnotes) {
		this.qnotes = qnotes;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public Map<String, String> getOptions() {
		return options;
	}

	public void setOptions(Map<String, String> options) {
		this.options = options;
	}

	public Set<String> getCorrectAnswers() {
		return correctAnswers;
	}

	public void setCorrectAnswers(Set<String> correctAnswers) {
		this.correctAnswers = correctAnswers;
	}

	public Set<String> getSelectedAnswers() {
		return selectedAnswers;
	}

	public void setSelectedAnswers(Set<String> selectedAnswers) {
		this.selectedAnswers = selectedAnswers;
	}

	public boolean isCorrect() {
		return correct;
	}

	public void setCorrect(boolean correct) {
		this.correct = correct;
	}
}
