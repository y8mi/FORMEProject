package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReviewPageDTO;
import org.zerock.domain.ReviewVO;
import org.zerock.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;

	// 리뷰 등록
	@Transactional // A와 B를 같이 실행시키기 위해 추가하는 어노테이션
	@Override
	public int insert(ReviewVO vo) {

		log.info("register....." + vo);

		return reviewMapper.insert(vo); // B = 신규 댓글 추가

	}

	// 리뷰 가져오기
	@Override
	public ReviewVO get(Long rno) {

		log.info("get....." + rno);

		return reviewMapper.read(rno);
	}

//	@Transactional // 위의 register메소드와 동일한 이유로 추가
//	@Override
//	public int remove(Long rno) { //*게시글(본글)에서 댓글 카운터를 감소 시켜야 되는데 해당 매개변수는 카운터 객체가 아니다 (bno에 영향을 줄 수 없다)
//		log.info("remove....." + rno);
//		ReviewVO vo = reviewMapper.read(rno); // rno 값을 이용해서 ReplyVO의 정보를 가져온는 역할 위의 문제(*)를 해결 (bno를 다룰 수 있다)
//		
//		return reviewMapper.delete(rno);  
//	}

	// 리뷰 불러오기+페이징 +리뷰 카운트(상세)
	@Override
	public ReviewPageDTO getListPage(Criteria cri, Long bno) {

		// log.info("get Reply List of a Board " + bno);

		return new ReviewPageDTO(reviewMapper.getCountByBno(bno), reviewMapper.getListWithPaging(cri, bno));
	}

}// c
