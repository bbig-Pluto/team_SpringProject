package com.myspring.syl.shy.dto;

public class WishlistDTO {
	
	private String category;
	private String name;
	private String photo;
	private int price;
	private String link;
	private int seqNum;
	
	public WishlistDTO() {
		
	}
	
	public WishlistDTO(int seqNum, String category, String name, String photo, int price, String link) {
		this.seqNum = seqNum;
		this.category = category;
		this.name = name;
		this.photo = photo;
		this.price = price;
		this.link = link;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getSeqNum() {
		return seqNum;
	}
	public void setSeqNum(int seqNum) {
		this.seqNum = seqNum;
	}
	

}
