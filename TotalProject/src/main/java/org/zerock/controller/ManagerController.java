package org.zerock.controller;

import java.text.DateFormat;		
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.CsVO;
import org.zerock.domain.CsreplyVO;
import org.zerock.domain.PagingDTO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PageDTO;
import org.zerock.domain.PagingCriteria;
import org.zerock.domain.PagingDTO;
import org.zerock.domain.PostingVO;
import org.zerock.domain.UploadVO;
import org.zerock.service.BoardService;
import org.zerock.service.CsreplyService;
import org.zerock.service.MgPostingService;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/manager/*")
@Log4j
public class ManagerController {
	
	@Autowired
	private MgPostingService service;
	
	@Autowired
	private CsreplyService replyservice;
	

	@GetMapping("/manager")
	public String manager() {
	
		return "/manager/manager";
	}
	
	//메인 폼 & 인기 게시물 불러오기  
	   @RequestMapping("/manager")
	   public String main(Model model) {
	      
	      log.info("-----------------------------------------");
	      log.info("-------selectPopularPost_List------------");
	         
	      model.addAttribute("popularList", service.selectPopularPost());   
	      log.info("popularList 값 : " + service.selectPopularPost());
	   
		/*
		 * model.addAttribute("rPosting", service.getList()); log.info("rPosting 값 : " +
		 * service.getList());
		 */
	   
	      return "/main";
	   }
	
	
	@RequestMapping("/managermemo")
	public String managermemo() {
		return "/manager/managermemo";
	}
	

	@GetMapping("/videolink")
	   public String videolink() {
	      return "/manager/videolink";

	}
	
	//고객 문의 게시판
	
	 @GetMapping("/csboard") 
	 public void getcs(PagingCriteria cri, Model model) {
	 
	 log.info("고객 문의 게시글 끌고오기" + cri); 
	 int total = service.getCsTotal(cri);
	 
	 model.addAttribute("getcs", service.getcs(cri));
	 model.addAttribute("pageMaker", new PagingDTO(cri, total));
	 }
	 
	 
	 
	 //고객 문의 상세페이지
	 @GetMapping("/csdetail")
	 	public void getCsDetail(@RequestParam("csbno") Long csbno, PagingCriteria cri, Model model) {

	 		
	 		int total = replyservice.getReplyTotal(cri);
	 		log.info("문의 상세페이지" + csbno + cri + total);
	 	
	 		//문의 게시글 끌고오기
	 		model.addAttribute("menu", service.getCsDetail(csbno));
	 		//댓글 끌고오기
	 		model.addAttribute("reply", service.replyList(cri));
	 		model.addAttribute("pageMaker", new PagingDTO(cri, total));
	 	}
	 
	 //강습 게시물 벌점 부여
	 @PostMapping("/postpenalty")
	 public String postpenalty(PostingVO vo, RedirectAttributes rttr){
		 log.info("벌점부여" + vo);
		 
		 if(service.postpenalty(vo)) { rttr.addFlashAttribute("result", "success"); }
		 return "redirect:/manager/csboard";
	 }
	 

	
	//강사 심사 게시판 끌고오기 (페이징처리)
	 @GetMapping("/mgposting")
	 public void getManagerList(PagingCriteria cri, Model model) {
		 
		 log.info("게시글 끌고오기" + cri);
		 int total2 = service.getTotal(cri);
		 
		 model.addAttribute("mgpostingList", service.getManagerList(cri));
		 model.addAttribute("pageMaker", new PagingDTO(cri, total2));
	 }
	 
	
     // 강습 심사 상세페이지
    @GetMapping("/managerdetail")
 	public void get(@RequestParam("bno") Long bno, Model model) {

 		log.info("/detail 컨트롤러 동작");
 		model.addAttribute("posting", service.get(bno));
 	}
	
	 
	
     // 심사 승인
	 @PostMapping("/managerupdate")
	 
	 public String update(PostingVO posting , RedirectAttributes rttr){
	 log.info("제발" + posting);
	 
	 if(service.update(posting)) { rttr.addFlashAttribute("result", "success"); }
	 return "redirect:/manager/mgposting";
	 
	 }
	 	 
 
	 
	 // 심사 반려
	 @PostMapping("/managerupdate2")
	 
	 public String con5(PostingVO posting3 , RedirectAttributes rttr){
	 log.info("반려사유" + posting3);
	 
	 if(service.con5(posting3)) { rttr.addFlashAttribute("result", "success"); }
	 return "redirect:/manager/mgposting";
	 
	 }
	 
	 
	
	 // 메인 페이지 동영상 업로드
	 @PostMapping("/video") 
	 public String video(MemberVO member, RedirectAttributes rttr){
	 
		 log.info("비디오 업로드"); 
		 
		 if(service.video(member)) {
			 rttr.addFlashAttribute("result", "success"); } 
		 return "/manager/videolink"; 
	 }
	 
	
	 //강습 게시글 삭제
	
	 @PostMapping("/postdelete") 
	 public String postdelete(@RequestParam("bno")
	 Long bno, RedirectAttributes rttr) {
	 
	 log.info("강습 게시글 삭제" + bno); if (service.postdelete(bno)) {
	 rttr.addFlashAttribute("result", "success"); } return
	 "redirect:/manager/csboard"; 
	 }
	 
	 //문의 게시글 삭제
	 @PostMapping("/csdelete") 
	 public String csdelete(@RequestParam("csbno")Long csbno, RedirectAttributes rttr) {
	 
	 log.info("문의 게시글 삭제" + csbno); if (service.csdelete(csbno)) {
	 rttr.addFlashAttribute("result", "success"); } 
	 return "redirect:/manager/csboard"; 
	 }
	
	 
	 //문의 게시글 댓글 입력
	 @PostMapping("/csreply")
		public String csreply(CsreplyVO reply, RedirectAttributes rttr) {

			log.info(reply);
			
		     service.csreply(reply);
				/* rttr.addAttribute("id", board.getCsid()); */ // getCsId() 메서드를 사용하여 id 값을 가져옴
	    return "redirect:/manager/csdetail?csbno=" + reply.getCsbno(); // 리턴 경로 수정
		}	 
	 
	 
	 //댓글 삭제
	 @PostMapping("/replyremove")
	 public String replyremove(CsreplyVO reply, RedirectAttributes rttr){
		 	log.info("댓글 삭제" + reply); 
	
		 	if (service.replyremove(reply)) {
			 rttr.addFlashAttribute("result", "success"); 
			 } 
		 	return
			 "redirect:/manager/csdetail?csbno=" + reply.getCsbno(); 
	 	
		 
	 }
	 

	/*
	 * @RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, value =
	 * "/{rno}", consumes = "application/json", produces = {
	 * MediaType.TEXT_PLAIN_VALUE }) public ResponseEntity<String>
	 * replyupdate(@RequestBody CsreplyVO vo, @PathVariable("rno") Long rno) {
	 * vo.setRno(rno); log.info("rno : " + rno); log.info("modify : " + vo);
	 * 
	 * return service.replymodify(vo) == 1 ? new ResponseEntity<>("success",
	 * HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); }
	 */

		
	
}
	 
	

