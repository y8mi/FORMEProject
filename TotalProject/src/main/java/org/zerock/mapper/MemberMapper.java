package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

	// ======== 로그인 ===========
	public MemberVO login(MemberVO vo) throws Exception;

	// ======= ID 찾기 ===========
	public MemberVO findId(MemberVO memberVO);

	// ======= PW 찾기 ===========

		// 비밀번호 변경
		public void updatePw(MemberVO vo) throws Exception;
	
		// 멤버 조회
		public MemberVO readMember(String id) throws Exception;

//=======================================================================================

	// 아이디 중복체크
	int idCheck(String id);

	// 맴버 인서트
	public void memberInsert(MemberVO member);

//=======================================================================================

	// ======= 전체 리뷰 데이터 갯수 ===========
	public int getTotalCount(Criteria cri);

	// DB테스트용(DB불러오기)
	public List<MemberVO> getList();

}
