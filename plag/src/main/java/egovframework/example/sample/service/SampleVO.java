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

import lombok.Data;
import lombok.ToString;

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
@ToString
@Data
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
    private String search;
    private Timestamp writeday;
    private String gdsImg;
    private String gdsThumbImg;

}
