package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ApplicationVO;
import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PostingVO;


public interface BoardMapper {

	//■ 카테고리별 데이터의 개수 처리
	public int getTotalCount(Criteria cri);
	
	//■ 전체 데이터의 개수 처리
	public int getTotalCountAll(Criteria cri);
	
	//■ 페이징 처리
	public List<PostingVO> getListWithPaging(Criteria cri);
	
	//■ 토탈서치 게시물 페이징처리
	public List<PostingVO> getListTotal(Criteria cri);
	 
	//■ 게시글 조회
	public List<PostingVO> getList();
	
	//■ test용
	public void insert(PostingVO posting);
	
	//■ 게시글 등록 //■PK값 (bno미리처리)
	public void insertSelectKey(PostingVO posting);
	
	//■ 특정 게시글 조회
	public PostingVO read(Long bno);
	
	//■ 삭제 : 1, 아니면 : 0
	public int delete(Long bno);
	
	//■ 수정
	public int update(PostingVO posting);
	
	//■ 첨부파일 삭제
	public void deletefile(String uuid);
	
	//■ 수강신청 
	public void applyinsert(ApplicationVO application);
	
	//■ 위시담기
	public void wishinsert(CartVO cart);

	//■ 위시 삭제
	public void wishremove(CartVO cart);
	
	//■ 위시조회
	public List<CartVO> cartget(Long bno);
	
	//■ 인기 게시물
	public List<ApplicationVO> selectPopularPost();
	
	
	
}