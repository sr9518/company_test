package kr.co.project.model;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("memberInfo")
public class MemberInfoVO {
	public MemberInfoVO() {}
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
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd [HH:mm:ss]", timezone="Asia/Seoul")
    private Timestamp writeday;
    

    
}
