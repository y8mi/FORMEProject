package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReviewPageDTO;
import org.zerock.domain.ReviewVO;
import org.zerock.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	//====== 리뷰 등록 =======
	@PostMapping(value = "/insert", 
			consumes = "application/json", // 받을 땐 json
			produces = { MediaType.TEXT_PLAIN_VALUE }) // 돌려줄 땐 text
												
	public ResponseEntity<String> insert(@RequestBody ReviewVO vo) { // @RequestBody : 넘어 온 데이터를 형변환

		log.info("ReviewVO: " + vo);
		int insertCount = reviewService.insert(vo); // register 호출해서 vo를 넘겨준다

		log.info("Reply INSERT COUNT: " + insertCount);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) // insert가 성공 시(코드: 200)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // insert가 실패 시 (코드: 500)
		// 삼항 연산자 처리
	}

	//====== 리뷰 불러오기 + 페이징 =======
	@GetMapping(value = "/pages/{bno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReviewPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno,
			Model model) {

		log.info("getList.................");
		Criteria cri = new Criteria(page, 10);
		log.info("cri: " + cri);

		model.addAttribute("reCnt", reviewService.getListPage(cri, bno));
		// log.info(model.addAttribute("reCnt", reviewService.getListPage(cri,bno)));

		return new ResponseEntity<>(reviewService.getListPage(cri, bno), HttpStatus.OK);
	}

//	@GetMapping(value = "/{rno}", produces = { MediaType.APPLICATION_XML_VALUE, 
//					     MediaType.APPLICATION_JSON_UTF8_VALUE })
//	public ResponseEntity<ReviewVO> get(@PathVariable("rno") Long rno) {
//
//		log.info("get: " + rno);
//
//		return new ResponseEntity<>(reviewService.get(rno), HttpStatus.OK);
//	}

//	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })  //@DeleteMapping: 요청방식이 delete일 경우 작동
//	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
//
//		log.info("remove: " + rno);
//
//		return reviewService.remove(rno) == 1 
//				? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}

}// c
