package org.zerock.service;

import java.util.List;

import org.zerock.domain.ApplicationVO;
import org.zerock.domain.CartVO;
import org.zerock.domain.CsVO;
import org.zerock.domain.CsreplyVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PagingCriteria;
import org.zerock.domain.PostingVO;

public interface MypagememberService {

	public boolean memberupdate (MemberVO id);
	
	public boolean passwordupdate (MemberVO id);
	
	public boolean memberdelete (MemberVO id);
	
	public boolean buyergrant(ApplicationVO id);
	
	public boolean buyercancel(ApplicationVO id);

	//게시글 불러오기
	public List<PostingVO> sellermypage(MemberVO id);
	
	public List<PostingVO> sellerpostingcheck(MemberVO id);
	
	public List<PostingVO> buyermypage(ApplicationVO id);
	
	public List<PostingVO> wishlist(CartVO id);
	
	public boolean memberright0(String id);
	
	public boolean memberright1(String id);
	
	public List<PostingVO> sellerbuyercheck(PostingVO id);
	
	public MemberVO loginid(String id) throws Exception;
	
	public List<ApplicationVO> getApplication(String id);
	
	//고객문의  게시판(파라메터 받아오기)
	public List<CsVO> getcs(String id);
	
	//고객문의  게시판(페이징)
	public List<CsVO> getcsList(PagingCriteria cri);
	
	//고객 문의 게시판 토탈
	public int getCsTotal(PagingCriteria cri); 
	
	//고객문의 상세페이지
	public CsVO csdetail(CsVO vo);
	
	//고객 문의 등록
	public void csregister(CsVO board);
	
	// 강습 게시글 여부체크
	public int bnoCheck(Long postbno);
	
	public void update(CsreplyVO reply);
}

