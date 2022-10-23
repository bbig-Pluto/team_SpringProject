package com.myspring.syl.shm.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {

	private String id;
	private String pwd;
	private String nickName;
	private String emailAdd;
	private String telNum;
	private String memberNum;
	private int memberClass;
	private Date joinDate;
	private int loginWhether;
	private String rn_ForAdminAdd;

	public MemberDTO() {

	}
	
	
	public MemberDTO(int loginWhether, String id, String memberNum, int memberClass) {
		this.loginWhether = loginWhether;
		this.id = id;
		this.memberNum = memberNum;
		this.memberClass = memberClass; 
	}
	
	// MemberController 의 'else if (action.equals("/pwdRewriteCheck.do"))'
	public MemberDTO(String memberNum) {
		this.pwd = memberNum;
	}
	
	// 세션 저장용
	public MemberDTO(int memberClass) {
		this.memberClass = memberClass;
	}
	
	public MemberDTO(String id, String pwd, String nickName, String emailAdd, String telNum, String memberNum, int memberClass) {
		this.id = id;
		this.pwd = pwd;
		this.nickName = nickName;
		this.emailAdd = emailAdd;
		this.telNum = telNum;
		this.memberNum = memberNum;
		this.memberClass = memberClass;
	}
	
	public MemberDTO(String id, String pwd, String nickName, String emailAdd, String telNum, int memberClass) {
		this.id = id;
		this.pwd = pwd;
		this.nickName = nickName;
		this.emailAdd = emailAdd;
		this.telNum = telNum;
		this.memberClass = memberClass;
	}
	
	// 회원정보 수정용
	public MemberDTO(String id, String pwd, String nickName, String emailAdd, String telNum, String memberNum, int memberClass, Date joinDate) {
		this.id = id;
		this.pwd = pwd;
		this.nickName = nickName;
		this.emailAdd = emailAdd;
		this.telNum = telNum;
		this.memberNum = memberNum;
		this.memberClass = memberClass;
		this.joinDate = joinDate;
	}
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getEmailAdd() {
		return emailAdd;
	}
	public void setEmailAdd(String emailAdd) {
		this.emailAdd = emailAdd;
	}
	
	public String getTelNum() {
		return telNum;
	}
	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}
	
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	
	public int getMemberClass() {
		return memberClass;
	}
	public void setMemberClass(int memberClass) {
		this.memberClass = memberClass;
	}
	
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	public int getLoginWhether() {
		return loginWhether;
	}
	public void setLoginWhether(int loginWhether) {
		this.loginWhether = loginWhether;
	}


	public String getRn_ForAdminAdd() {
		return rn_ForAdminAdd;
	}


	public void setRn_ForAdminAdd(String rn_ForAdminAdd) {
		this.rn_ForAdminAdd = rn_ForAdminAdd;
	}



}
