package com.myspring.syl.lhj.dto;

import java.sql.Date;

public class ExerciseDTO {
	
	// Exercise 테이블
	private int seq_Exercise;
	private String exercise_Contents;
	private String exercise_Time;
	private Date exercise_Today;
	private String session_UserId;
	
	
	// Exercise_saying 테이블
	private int seq_Exercise_saying;
	private String exercise_saying_contents;
	
	public ExerciseDTO() {};
	
	public ExerciseDTO(int seq_Exercise, String exercise_Contents, String exercise_Time) {
		this.seq_Exercise = seq_Exercise;
		this.exercise_Contents = exercise_Contents;
		this.exercise_Time = exercise_Time;
	};
	
	public int getSeq_Exercise() {
		return seq_Exercise;
	}
	public void setSeq_Exercise(int seq_Exercise) {
		this.seq_Exercise = seq_Exercise;
	}
	public String getExercise_Contents() {
		return exercise_Contents;
	}
	public void setExercise_Contents(String exercise_Contents) {
		this.exercise_Contents = exercise_Contents;
	}
	public String getExercise_Time() {
		return exercise_Time;
	}
	public void setExercise_Time(String exercise_Time) {
		this.exercise_Time = exercise_Time;
	}
	public Date getExercise_Today() {
		return exercise_Today;
	}
	public void setExercise_Today(Date exercise_Today) {
		this.exercise_Today = exercise_Today;
	}
	public String getSession_UserId() {
		return session_UserId;
	}
	public void setSession_UserId(String session_UserId) {
		this.session_UserId = session_UserId;
	}

	// Exercise_saying get set
	public int getSeq_Exercise_saying() {
		return seq_Exercise_saying;
	}

	public void setSeq_Exercise_saying(int seq_Exercise_saying) {
		this.seq_Exercise_saying = seq_Exercise_saying;
	}

	public String getExercise_saying_contents() {
		return exercise_saying_contents;
	}

	public void setExercise_saying_contents(String exercise_saying_contents) {
		this.exercise_saying_contents = exercise_saying_contents;
	}

	
}
