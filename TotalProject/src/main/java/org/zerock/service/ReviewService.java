package org.zerock.service;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReviewPageDTO;
import org.zerock.domain.ReviewVO;

public interface ReviewService {

	// 리뷰 등록
	public int insert(ReviewVO vo);

	public ReviewVO get(Long rno);

//	public int remove(Long rno);

	// 리뷰 불러오기
	public ReviewPageDTO getListPage(Criteria cri, Long bno);

}// c
