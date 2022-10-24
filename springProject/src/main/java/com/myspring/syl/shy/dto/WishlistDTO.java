package com.myspring.syl.shy.dto;

public class WishlistDTO {
	
	private String category;
	private String name;
	private String photo;
	private String price;
	private String link;
	private int seqNum;
	private String id;
	
	public WishlistDTO() {
		
	}
	
	public WishlistDTO(int seqNum, String category, String name, String photo, String price, String link, String id) {
		this.seqNum = seqNum;
		this.category = category;
		this.name = name;
		this.photo = photo;
		this.price = price;
		this.link = link;
		this.id = id;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	

}
