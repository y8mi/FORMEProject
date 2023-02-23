package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.PostingVO;
import org.zerock.domain.ReviewVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j	
public class ReviewMapperTests {
	
	@Autowired
	private ReviewMapper reviewMapper;

	@Autowired
	private BoardMapper mapper;

//	@Test
//	public void replyEnrollTests() {
//
//		String id = "aaa";
//		long bno = 6;
//		double score = 3.5;
//		String rcontent = "댓글 테스트2";
//		
//		ReviewVO vo = new ReviewVO();
//
//		vo.setBno(bno);
//		vo.setId(id);
//		vo.setScore(score);
//		vo.setRcontent(rcontent);
//		
//		reviewMapper.insert(vo);
//	}
	
	
//	@Test
//	public void testList(){
//		
//		Criteria cri = new Criteria(1,10);
//		
//		List<ReviewVO> reviwes = reviewMapper.getListWithPaging(cri, 6L);
//		reviwes.forEach(review -> System.out.println(review));
//	}
//	
	

//	@Test
//	public void replyTest2() {
//
//
//		List<ApplicationVO> reviwes = reviewMapper.reviewRight((long) 6);
//		reviwes.forEach(review -> System.out.println(review));
//	}

	@Test
	public void poppularTest() {

		
//		List<ApplicationVO> reviwes = mapper.selectPopularPost();
//		reviwes.forEach(review -> System.out.println(review));
//		long bno = 6;
//		
//		ReviewVO reviwes = reviewMapper.reviewAvg(bno);
//		System.out.println("reviwes--------: " + reviwes);
	}
	
	
}//c
