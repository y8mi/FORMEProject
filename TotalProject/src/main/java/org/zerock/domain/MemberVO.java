package org.zerock.domain;


import lombok.Data;

@Data
public class MemberVO {

	private String id; // 아이디
	private String password; // 비밀번호	
	private String name; //이름
	private int right; // 강사권한 (권한 default는 0으로 하고, 전환하기 누르면 1으로 값이 update(query) 되면서 글쓰기 hidden버튼 show되도록. 관리자 3')
	private String email; //이메일
	private String phone; // 전화번호
	private String video;
	

	
}//c
