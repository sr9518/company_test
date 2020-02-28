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

import java.sql.Timestamp;

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

	private int id;
	private String usertype;
	private String bong;
	private String bun;
	private String staff;
    private String name;
    private String eng_name;
    private String userid;
    private String email;
    private String emailchk1;
    private String emailchk2;
    private String birth;
    private String birthchk;
    private String phone;
    private String phonechk;
    private String job;
    private String jobchk;
    private String juso1;
    private String juso2;
	private String jusochk;
	private String profile;
    private String profilechk;
    private String content;
    private String agree;
    private Timestamp writeday;
    private String gdsImg;
    private String gdsThumbImg;
    
    public SampleVO() {}
    
	public SampleVO(int id, String usertype, String bong, String bun, String staff, String name, String eng_name,
			String userid, String email, String emailchk1, String emailchk2, String birth, String birthchk,
			String phone, String phonechk, String job, String jobchk, String juso1, String juso2, String jusochk,
			String profile, String profilechk, String content, String agree, Timestamp writeday, String gdsImg,
			String gdsThumbImg) {
		super();
		this.id = id;
		this.usertype = usertype;
		this.bong = bong;
		this.bun = bun;
		this.staff = staff;
		this.name = name;
		this.eng_name = eng_name;
		this.userid = userid;
		this.email = email;
		this.emailchk1 = emailchk1;
		this.emailchk2 = emailchk2;
		this.birth = birth;
		this.birthchk = birthchk;
		this.phone = phone;
		this.phonechk = phonechk;
		this.job = job;
		this.jobchk = jobchk;
		this.juso1 = juso1;
		this.juso2 = juso2;
		this.jusochk = jusochk;
		this.profile = profile;
		this.profilechk = profilechk;
		this.content = content;
		this.agree = agree;
		this.writeday = writeday;
		this.gdsImg = gdsImg;
		this.gdsThumbImg = gdsThumbImg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getBong() {
		return bong;
	}
	public void setBong(String bong) {
		this.bong = bong;
	}
	public String getBun() {
		return bun;
	}
	public void setBun(String bun) {
		this.bun = bun;
	}
	public String getStaff() {
		return staff;
	}
	public void setStaff(String staff) {
		this.staff = staff;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailchk1() {
		return emailchk1;
	}
	public void setEmailchk1(String emailchk1) {
		this.emailchk1 = emailchk1;
	}
	public String getEmailchk2() {
		return emailchk2;
	}
	public void setEmailchk2(String emailchk2) {
		this.emailchk2 = emailchk2;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getBirthchk() {
		return birthchk;
	}
	public void setBirthchk(String birthchk) {
		this.birthchk = birthchk;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhonechk() {
		return phonechk;
	}
	public void setPhonechk(String phonechk) {
		this.phonechk = phonechk;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getJobchk() {
		return jobchk;
	}
	public void setJobchk(String jobchk) {
		this.jobchk = jobchk;
	}
	public String getJuso1() {
		return juso1;
	}
	public void setJuso1(String juso1) {
		this.juso1 = juso1;
	}
	public String getJuso2() {
		return juso2;
	}
	public void setJuso2(String juso2) {
		this.juso2 = juso2;
	}
	public String getJusochk() {
		return jusochk;
	}
	public void setJusochk(String jusochk) {
		this.jusochk = jusochk;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getProfilechk() {
		return profilechk;
	}
	public void setProfilechk(String profilechk) {
		this.profilechk = profilechk;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public String getGdsImg() {
		return gdsImg;
	}
	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
	}
	public String getGdsThumbImg() {
		return gdsThumbImg;
	}
	public void setGdsThumbImg(String gdsThumbImg) {
		this.gdsThumbImg = gdsThumbImg;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    
    

}
