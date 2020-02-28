package egovframework.example.sample.service;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class SearchCriteria extends Criteria{

	private String useday = "";
	private String used = "";
	private String processed = "";
	
}
