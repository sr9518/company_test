package egovframework.example.sample.service;

import java.sql.Timestamp;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BookVO {
	private int id;
	private String used;
	private String useday;
	private int usecost;
	private String files;
	private String processed;
	private Timestamp proday;
	private int appcost;
	private String content;
}
