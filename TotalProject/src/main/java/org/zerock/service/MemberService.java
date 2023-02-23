package org.zerock.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.zerock.domain.MemberVO;

public interface MemberService {

	// ======== 로그인 ===========
	public MemberVO login(MemberVO vo) throws Exception;

	// ======== 로그아웃===========
	public void logout(HttpSession session);

	// ======== ID 찾기===========
	public MemberVO findId(MemberVO membervo);

	// ======== PW 찾기===========
	public void findPw(HttpServletResponse resp, MemberVO vo) throws Exception;

	// ======== 이메일 발송===========
	public void sendEmail(MemberVO vo, String div) throws Exception;

//=======================================================================================

	// 아이디 중복체크
	public int idCheck(String id);

	// 회원가입
	public void memberInsert(MemberVO member);

//=======================================================================================	

	// DB테스트용(DB불러오기)
	public List<MemberVO> getList();

}// c
