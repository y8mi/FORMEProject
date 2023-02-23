package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ApplicationVO;
import org.zerock.domain.CartVO;
import org.zerock.domain.CsVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PagingCriteria;
import org.zerock.domain.PostingVO;

public interface MypagememberMapper {

	public int memberdelete(MemberVO id);
	
	public int memberupdate(MemberVO id);

	public int passwordupdate(MemberVO id);
	
	public int buyergrant(ApplicationVO id);
	
	public int buyercancel(ApplicationVO id);
	
	//게시글 조회
	public List<PostingVO> sellermypage(MemberVO id);
	
	public List<PostingVO> sellerpostingcheck(MemberVO id);
	
	public List<PostingVO> buyermypage(ApplicationVO id);
	
	public List<PostingVO> wishlist(CartVO id);
	
	public int memberright0(String id);
	
	public int memberright1(String id);
	
	public List<PostingVO> sellerbuyercheck(PostingVO id);

	public MemberVO loginid(String id) throws Exception;
	
	//어플리케이션 조회
	public List<ApplicationVO> getApplication(String id);
	
	// 고객 문의 게시판 (페이징처리)
	public List<CsVO> getcsList(PagingCriteria cri);

	// 고객 문의 게시판 (id 파라메터)
	public List<CsVO> getcs(String id);

	// 고객 문의 게시판 토탈
	public String getCsTotal(PagingCriteria cri);

	// 고객문의 상세페이지
	public CsVO csdetail(Long bno);

	// 고객 문의 등록
	public void csregister(CsVO board);

	
	}