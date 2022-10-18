package com.myspring.syl.lhj.dto;

import java.sql.Date;

public class ExerciseDTO {
	
	private int seq_Exercise;
	private String exercise_Contents;
	private String exercise_Time;
	private Date exercise_Today;
	private String session_UserId;
	
	
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

	
}
