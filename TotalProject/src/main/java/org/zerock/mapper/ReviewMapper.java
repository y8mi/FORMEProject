package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.PostingVO;
import org.zerock.domain.ReviewVO;

public interface ReviewMapper {

	// 리뷰 등록
	public int insert(ReviewVO vo);

	// 리뷰 가져오기
	public ReviewVO read(Long rno);

//	public int delete(Long rno);

	// 리뷰,리뷰페이지
	// Mybatis의 SQL 문장에 다수(2개 이상)의 파라미터를 전달할 때는 전달되는 변수들에 꼭 @Param 어노테이션을 붙여줘야한다.
	public List<ReviewVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);

	// 리뷰 카운트(게시물 상세)
	public int getCountByBno(Long bno);

	// 리뷰 권한
	public List<PostingVO> reviewRight(Long bno);

//	//리뷰 카운트(메인 인기게시물)
//	public List<ReviewVO> getCountByBno();
	
//	//리뷰 평점
//	public ReviewVO reviewAvg(Long bno);

}
