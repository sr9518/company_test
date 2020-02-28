/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.sample.service;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class SampleVO extends SampleDefaultVO {

	private static final long serialVersionUID = 1L;

	private String itemId;
	private String itemName;
	private String dealDate;
	private int priceOpen;
	private int priceHigh;
	private int priceLow;
	private int priceClose;
	private double priceAvg5;
	private double priceAvg10;
	private double priceAvg20;
	private double priceAvg60;
	private double priceAvg120;
	private double volume;
	private double volumeAvg5;
	private double volumeAvg20;
	private double volumeAvg60;
	private double volumeAvg120;
	private String priceAvg5tbl;
	private String priceAvg10tbl;
	private String priceAvg20tbl;
	private String priceAvg60tbl;
	private String volumeAvg5tbl;
	private String volumeAvg20tbl;
	private String volumeAvg60tbl;
	private String priceClosetbl;
	private String volumetbl;
	private String dayType;
	
	public SampleVO() {}
	
	public String getPriceClosetbl() {
		return priceClosetbl;
	}

	public void setPriceClosetbl(String priceClosetbl) {
		this.priceClosetbl = priceClosetbl;
	}

	public String getVolumetbl() {
		return volumetbl;
	}

	public void setVolumetbl(String volumetbl) {
		this.volumetbl = volumetbl;
	}

	public String getPriceAvg5tbl() {
		return priceAvg5tbl;
	}

	public void setPriceAvg5tbl(String priceAvg5tbl) {
		this.priceAvg5tbl = priceAvg5tbl;
	}

	public String getPriceAvg10tbl() {
		return priceAvg10tbl;
	}

	public void setPriceAvg10tbl(String priceAvg10tbl) {
		this.priceAvg10tbl = priceAvg10tbl;
	}

	public String getPriceAvg20tbl() {
		return priceAvg20tbl;
	}

	public void setPriceAvg20tbl(String priceAvg20tbl) {
		this.priceAvg20tbl = priceAvg20tbl;
	}

	public String getPriceAvg60tbl() {
		return priceAvg60tbl;
	}

	public void setPriceAvg60tbl(String priceAvg60tbl) {
		this.priceAvg60tbl = priceAvg60tbl;
	}

	public String getVolumeAvg5tbl() {
		return volumeAvg5tbl;
	}

	public void setVolumeAvg5tbl(String volumeAvg5tbl) {
		this.volumeAvg5tbl = volumeAvg5tbl;
	}

	public String getVolumeAvg20tbl() {
		return volumeAvg20tbl;
	}

	public void setVolumeAvg20tbl(String volumeAvg20tbl) {
		this.volumeAvg20tbl = volumeAvg20tbl;
	}

	public String getVolumeAvg60tbl() {
		return volumeAvg60tbl;
	}

	public void setVolumeAvg60tbl(String volumeAvg60tbl) {
		this.volumeAvg60tbl = volumeAvg60tbl;
	}

	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getDealDate() {
		return dealDate;
	}
	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}
	public int getPriceOpen() {
		return priceOpen;
	}
	public void setPriceOpen(int priceOpen) {
		this.priceOpen = priceOpen;
	}
	public int getPriceHigh() {
		return priceHigh;
	}
	public void setPriceHigh(int priceHigh) {
		this.priceHigh = priceHigh;
	}
	public int getPriceLow() {
		return priceLow;
	}
	public void setPriceLow(int priceLow) {
		this.priceLow = priceLow;
	}
	public int getPriceClose() {
		return priceClose;
	}
	public void setPriceClose(int priceClose) {
		this.priceClose = priceClose;
	}
	public double getPriceAvg5() {
		return priceAvg5;
	}
	public void setPriceAvg5(double priceAvg5) {
		this.priceAvg5 = priceAvg5;
	}
	public double getPriceAvg10() {
		return priceAvg10;
	}
	public void setPriceAvg10(double priceAvg10) {
		this.priceAvg10 = priceAvg10;
	}
	public double getPriceAvg20() {
		return priceAvg20;
	}
	public void setPriceAvg20(double priceAvg20) {
		this.priceAvg20 = priceAvg20;
	}
	public double getPriceAvg60() {
		return priceAvg60;
	}
	public void setPriceAvg60(double priceAvg60) {
		this.priceAvg60 = priceAvg60;
	}
	public double getPriceAvg120() {
		return priceAvg120;
	}
	public void setPriceAvg120(double priceAvg120) {
		this.priceAvg120 = priceAvg120;
	}
	public double getVolume() {
		return volume;
	}
	public void setVolume(double volume) {
		this.volume = volume;
	}
	public double getVolumeAvg5() {
		return volumeAvg5;
	}
	public void setVolumeAvg5(double volumeAvg5) {
		this.volumeAvg5 = volumeAvg5;
	}
	public double getVolumeAvg20() {
		return volumeAvg20;
	}
	public void setVolumeAvg20(double volumeAvg20) {
		this.volumeAvg20 = volumeAvg20;
	}
	public double getVolumeAvg60() {
		return volumeAvg60;
	}
	public void setVolumeAvg60(double volumeAvg60) {
		this.volumeAvg60 = volumeAvg60;
	}
	public double getVolumeAvg120() {
		return volumeAvg120;
	}
	public void setVolumeAvg120(double volumeAvg120) {
		this.volumeAvg120 = volumeAvg120;
	}
	public String getDayType() {
		return dayType;
	}
	public void setDayType(String dayType) {
		this.dayType = dayType;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public SampleVO(String itemId, String itemName, String dealDate, int priceOpen, int priceHigh, int priceLow,
			int priceClose, double priceAvg5, double priceAvg10, double priceAvg20, double priceAvg60,
			double priceAvg120, double volume, double volumeAvg5, double volumeAvg20, double volumeAvg60,
			double volumeAvg120, String priceAvg5tbl, String priceAvg10tbl, String priceAvg20tbl, String priceAvg60tbl,
			String volumeAvg5tbl, String volumeAvg20tbl, String volumeAvg60tbl, String priceClosetbl, String volumetbl,
			String dayType) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.dealDate = dealDate;
		this.priceOpen = priceOpen;
		this.priceHigh = priceHigh;
		this.priceLow = priceLow;
		this.priceClose = priceClose;
		this.priceAvg5 = priceAvg5;
		this.priceAvg10 = priceAvg10;
		this.priceAvg20 = priceAvg20;
		this.priceAvg60 = priceAvg60;
		this.priceAvg120 = priceAvg120;
		this.volume = volume;
		this.volumeAvg5 = volumeAvg5;
		this.volumeAvg20 = volumeAvg20;
		this.volumeAvg60 = volumeAvg60;
		this.volumeAvg120 = volumeAvg120;
		this.priceAvg5tbl = priceAvg5tbl;
		this.priceAvg10tbl = priceAvg10tbl;
		this.priceAvg20tbl = priceAvg20tbl;
		this.priceAvg60tbl = priceAvg60tbl;
		this.volumeAvg5tbl = volumeAvg5tbl;
		this.volumeAvg20tbl = volumeAvg20tbl;
		this.volumeAvg60tbl = volumeAvg60tbl;
		this.priceClosetbl = priceClosetbl;
		this.volumetbl = volumetbl;
		this.dayType = dayType;
	}

	
}
