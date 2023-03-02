package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.CsreplyDTO;
import org.zerock.domain.CsreplyVO;
import org.zerock.domain.PagingCriteria;
import org.zerock.service.CsreplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class CsreplyController {

	private CsreplyService service;
	
	
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody CsreplyVO vo) {

		log.info("ReplyVO: " + vo);

		int insertCount = service.register(vo);

		log.info("Reply INSERT COUNT: " + insertCount);

		return insertCount == 1  
				?  new ResponseEntity<>("success", HttpStatus.OK)  // 200
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);  // 500
	}
	
	/*
	 * @GetMapping(value = "/csdetail/{csbno}/{page}", produces = {
	 * MediaType.APPLICATION_JSON_VALUE }) public ResponseEntity<CsreplyDTO>
	 * getList(@PathVariable("page") int page , @PathVariable("csbno") Long csbno) {
	 * // @PathVariable : url로 넘겨받은 값 이용 log.info("getList....."); PagingCriteria
	 * cri = new PagingCriteria(page , 10); log.info(cri);
	 * 
	 * return new ResponseEntity<>(service.replyList(cri, csbno), HttpStatus.OK); //
	 * T<List<ReplyVO>> t = new T<>(); // 댓글 목록을 출ㄹ력하고, 정상 처리 상태를 리턴 }
	 */
	
	/*
	 * @GetMapping(value = "/{rno}", produces = { MediaType.APPLICATION_XML_VALUE,
	 * MediaType.APPLICATION_JSON_UTF8_VALUE }) public ResponseEntity<CsreplyVO>
	 * get(@PathVariable("rno") Long rno) {
	 * 
	 * log.info("get: " + rno);
	 * 
	 * return new ResponseEntity<>(service.get(rno), HttpStatus.OK); }
	 */
	
	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {

		log.info("remove: " + rno);

		return service.remove(rno) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{rno}", 
					consumes = "application/json", 
					produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(
			 @RequestBody CsreplyVO vo, 
			 @PathVariable("rno") Long rno) {

		vo.setRno(rno);

		log.info("rno: " + rno);
		log.info("modify: " + vo);

		return service.modify(vo) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

}


