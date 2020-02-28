package egovframework.example.sample.service;

import java.sql.Timestamp;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class MamberVO2 {
	private int id;
	private String processed;
	private Timestamp proday;
	private int appcost;
	private String content;
}
