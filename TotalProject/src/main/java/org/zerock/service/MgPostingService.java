package org.zerock.service;

import java.util.List;

import org.zerock.domain.ApplicationVO;
import org.zerock.domain.CsVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PagingCriteria;
import org.zerock.domain.PostingVO;

public interface MgPostingService {   
	               
	// 강습 심사 게시판 (페이징처리)
	public List<PostingVO> getManagerList(PagingCriteria cri);
	
	/* public List<PostingVO> getPosting(Criteria cri); */
	
	// 고객문의 게시판 
	public List<CsVO> getcs(PagingCriteria cri);
	
	//메인 페이지 동영상 끌고오기
	public List<MemberVO> getVideo(); 
	
	//심사요청 게시판 검색 토탈
	public int getTotal(PagingCriteria cri);
	
	//고객문의 게시판 토탈
	public int getCsTotal(PagingCriteria cri); 
	
	//심사 게시판 상세페이지
	public PostingVO get(Long bno);
	
	//고객문의 게시판 상세페이지
	public CsVO getCsDetail(Long bno);
	
	public boolean update(PostingVO posting);

	boolean update2(PostingVO posting2);
	
	//게시글 벌점 부여
	boolean postpenalty(PostingVO vo);

	boolean con5(PostingVO posting3);

	//메인 페이지 동영상 업로드
	boolean video(MemberVO video);
	
	//랭킹
	public List<ApplicationVO> selectPopularPost();
	
	//강습 게시글 삭제
	public boolean postdelete(Long bno);

}


