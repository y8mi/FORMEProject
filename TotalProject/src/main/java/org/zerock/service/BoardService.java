package org.zerock.service;

import java.util.List;

import org.zerock.domain.ApplicationVO;
import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PostingVO;
import org.zerock.domain.UploadVO;

public interface BoardService {

	// 상세보기 관련 메소드
	public void register(PostingVO posting);

	public PostingVO get(Long bno);

	public boolean modify(PostingVO posting);

	public boolean remove(Long bno);

	// 게시물 조회 시, 첨부파일 같이 조회
	public List<UploadVO> getUploadList(Long bno);

	// 게시글 불러오기
	public List<PostingVO> getList();

	// 카테고리 별 페이징 처리
	public List<PostingVO> getList(Criteria cri);

	// 통합검색 페이징 처리
	public List<PostingVO> getListTotal(Criteria cri);

	// 통합검색(전체) 데이터의 개수 처리
	public int getTotalCountAll(Criteria cri);

	// 카테고리별 데이터의 개수 처리
	public int getTotal(Criteria cri);

	// 수강신청
	public void applyinsert(ApplicationVO application);

	// 위시담기
	public void wishinsert(CartVO cart);

	// 위시 조회
	public List<CartVO> cartget(Long bno);

	// 위시 삭제
	public void wishremove(CartVO vo);

	// 리뷰 권한
	public List<PostingVO> reviewRight(Long bno);

//	//리뷰 평점
//	public ReviewVO reviewAvg(Long bno);

	// 인기 게시물
	public List<ApplicationVO> selectPopularPost();

//	//리뷰 카운트(메인-인기 게시물)
//	public int popularReviewCnt(Long bno);

	
}// c