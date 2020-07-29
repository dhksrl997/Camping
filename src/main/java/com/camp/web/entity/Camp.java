package com.camp.web.entity;

public class Camp {
	private int id;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String name;
	private String latitude;// 위도
	private String longitude; // 경도
	private String address;
	private String phone;
	private int acceptNum; // 수용인원
	private int parking; // 주차장
	private String faclity; // 편의시설
	private String safety; // 안전 시설
	private String open; // 영업시간
	private String price; // 가격

	public Camp() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getImg4() {
		return img4;
	}

	public void setImg4(String img4) {
		this.img4 = img4;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAcceptNum() {
		return acceptNum;
	}

	public void setAcceptNum(int acceptNum) {
		this.acceptNum = acceptNum;
	}

	public int getParking() {
		return parking;
	}

	public void setParking(int parking) {
		this.parking = parking;
	}

	public String getFaclity() {
		return faclity;
	}

	public void setFaclity(String faclity) {
		this.faclity = faclity;
	}

	public String getSafety() {
		return safety;
	}

	public void setSafety(String safety) {
		this.safety = safety;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Camp(int id, String img1, String img2, String img3, String img4, String name, String latitude,
			String longitude, String address, String phone, int acceptNum, int parking, String faclity, String safety,
			String open, String price) {
		super();
		this.id = id;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
		this.name = name;
		this.latitude = latitude;
		this.longitude = longitude;
		this.address = address;
		this.phone = phone;
		this.acceptNum = acceptNum;
		this.parking = parking;
		this.faclity = faclity;
		this.safety = safety;
		this.open = open;
		this.price = price;
	}

	@Override
	public String toString() {
		return "Camp [id=" + id + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4 + ", name="
				+ name + ", latitude=" + latitude + ", longitude=" + longitude + ", address=" + address + ", phone="
				+ phone + ", acceptNum=" + acceptNum + ", parking=" + parking + ", faclity=" + faclity + ", safety="
				+ safety + ", open=" + open + ", price=" + price + "]";
	}
}