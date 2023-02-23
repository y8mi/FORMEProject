package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ApplicationVO;
import org.zerock.domain.CartVO;
import org.zerock.domain.CsVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PagingCriteria;
import org.zerock.domain.PagingDTO;
import org.zerock.domain.PostingVO;
import org.zerock.service.MemberService;
import org.zerock.service.MypagememberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class MypageController {

	@Autowired
	private MypagememberService MypagememberService;
	
	@Autowired
	private MemberService memberService;
	
	
	// 마이페이지에서 로그아웃
	@RequestMapping("/logout.do")
	public String redirectTest(HttpSession session,String url){
		
		session.invalidate();
		
		return "redirect:" + "/main";
	}
	
	
	//-----------------------------고객 문의 관련 -------------------------------
	
	
	//고객 문의 게시판
		 @GetMapping("/buyercs")
		 public void getcs(@RequestParam("id") String id, PagingCriteria cri, Model model) {
			 
			 log.info("게시글 끌고오기" + cri);
			 int total = MypagememberService.getCsTotal(cri);
			 

			 model.addAttribute("list", MypagememberService.getcs(id));
			 model.addAttribute("menu", MypagememberService.getcsList(cri));
			 model.addAttribute("pageMaker", new PagingDTO(cri, total));
		 }
		 
		 //고객 문의 게시글 상세페이지
		 @GetMapping("/buyercsdetail")
		 	public void csdatail(@RequestParam("bno") Long bno, Model model) {

		 		log.info("고객문의 상세페이지");
		 		model.addAttribute("menu", MypagememberService.csdetail(bno));
		 }
		 
		 
		 // 고객 문의 글쓰기
		 @PostMapping("/csregisterForm")
		 public String csregister(CsVO board, RedirectAttributes rttr) {
		     log.info("문의글 입력");
		     MypagememberService.csregister(board);
		/* rttr.addAttribute("id", board.getCsid()); */ // getCsId() 메서드를 사용하여 id 값을 가져옴
		     return "redirect:/mypage/buyermypage?id=" + board.getCsid(); // 리턴 경로 수정
		 }
		
		@GetMapping("/csregisterForm") // 해당 주소로 요청 시 로그인뷰를 띄워 줌
		public String regiForm() {
			log.info("회원가입폼으로 이동");

			return "/mypage/buymypage"; // 
		}

		 // 고객 문의 글쓰기 (id 끌고오기)
		@RequestMapping("/buyercsregister")
		   public String buyercsregi() {
		      return "/mypage/buyercsregister";
		}

	
//	 	// 구매자용 마이페이지
//	@GetMapping("/buyermypage")
//	public void getbuyermypage(@RequestParam("id") String id, Model model, MemberVO vo, HttpServletRequest req, RedirectAttributes rttr)throws Exception{	
//		log.info("/buyermypage 컨트롤러 동작");
//		
//		CartVO cart = new CartVO();
//	    cart.setId(id);
//		model.addAttribute("list", MypagememberService.buyermypage(cart));
//		
//		 if (MypagememberService.memberright0(vo)) {
//			 	
//			 HttpSession session = req.getSession();
//	 		 MemberVO login = memberService.login(vo);
//	 		 session.setAttribute("member_s", login);
//	 		 rttr.addFlashAttribute("member", vo); 
//		 	
//		 	 }
//		
//		log.info("list 값 : " +MypagememberService.buyermypage(cart) );
//	}
	 
//	@Autowired
//	public void mypage(MemberVO vo,@RequestParam("id") String id, Model model, HttpServletRequest req, RedirectAttributes rttr)throws Exception {
//		
//		
//		if(vo.getRight()==0) {
//		// 구매자용 마이페이지
//				
//				public String getbuyermypage(){	
//	
//					log.info("/buyermypage 컨트롤러 동작");
//					
//					ApplicationVO app = new ApplicationVO();
//				    	app.setId(id);
//					model.addAttribute("list", MypagememberService.buyermypage(app));
//					
//					model.addAttribute(MypagememberService.memberright0(id));
//					MypagememberService.memberright0(id);
//					
//	//				MemberVO member = new MemberVO();
//	//				member.setId(id);
//	//			    
//	//			    HttpSession session = req.getSession();
//	//		 		MemberVO login = memberService.login(member);
//	//		 		session.setAttribute("member_s", login);
//	//		 		rttr.addFlashAttribute("member", member);
//	
//	
//					log.info("list 값 : " +MypagememberService.buyermypage(app) );
//				}
//		}else(vo.getRight()==1){
//	
//			// 전문가 마이페이지 (조회)
//			@GetMapping("/sellermypage")
//			public void getsellermypage() {
//	
//				log.info("/sellermypage 컨트롤러 동작");
//				
//			    MemberVO member = new MemberVO();
//			    member.setId(id);
//				model.addAttribute("list", MypagememberService.sellermypage(member));
//				
//				model.addAttribute(MypagememberService.memberright1(id));
//				MypagememberService.memberright1(id);
//	
//				log.info("list 값 : " +MypagememberService.sellermypage(member) );
//			}
//		}
//	}
	
		// 구매자용 마이페이지
					@GetMapping("/buyermypage")
					public String getbuyermypage(@RequestParam("id") String id, MemberVO member, HttpSession session, Model model, HttpServletRequest req, RedirectAttributes rttr)throws Exception {	

						log.info("/buyermypage 컨트롤러 동작");
					    
//						MemberVO login = memberService.login(member);
						
						MemberVO login = MypagememberService.loginid(id);
				 		session.setAttribute("member_s", login);
				 		rttr.addFlashAttribute("member", member);
						
						ApplicationVO app = new ApplicationVO();
					    app.setId(id);
						model.addAttribute("list", MypagememberService.buyermypage(app));
						
						model.addAttribute("application", MypagememberService.getApplication(id));
						/* log.info("application 값" + MypagememberService.getApplication(id)); */
						
						model.addAttribute(MypagememberService.memberright0(id));
						MypagememberService.memberright0(id);
						member.setId(id);
					    
				 		session.setAttribute("member_s", login);
				 		rttr.addFlashAttribute("member", member);

						log.info("list 값 : " +MypagememberService.buyermypage(app) );
						
//						String referer = req.getHeader("Referer"); 
//						return "redirect:"+ referer;
						
						return "redirect:" + "/mypage/buyermypager?id=" + id;
					}

				// 전문가 마이페이지 (조회)
				@GetMapping("/sellermypage")
				public String getsellermypage(@RequestParam("id") String id, MemberVO member, HttpSession session, Model model, HttpServletRequest req, RedirectAttributes rttr)throws Exception {

					log.info("/sellermypage 컨트롤러 동작");
					
//					MemberVO login = memberService.login(member);
					MemberVO login = MypagememberService.loginid(id);
			 		session.setAttribute("member_s", login);
			 		rttr.addFlashAttribute("member", member);
					
					model.addAttribute("list", MypagememberService.sellermypage(member));
					
					model.addAttribute(MypagememberService.memberright1(id));
					MypagememberService.memberright1(id);
					
					member.setId(id);
				    
			 		session.setAttribute("member_s", login);
			 		rttr.addFlashAttribute("member", member);

				/* log.info("list 값 : " +MypagememberService.sellermypage(member) );  잘됨 */ 
					
//					String referer = req.getHeader("Referer");.
//					return "redirect:"+ referer; 
					return "redirect:" + "/mypage/sellermypager?id=" + id;
				}
				
				// 구매자용 마이페이지 두번째 (세션값용)
					@GetMapping("/buyermypager")
					public String getbuyermypager(@RequestParam("id") String id, MemberVO member, HttpSession session, Model model, HttpServletRequest req, RedirectAttributes rttr)throws Exception {	

						log.info("/buyermypager 컨트롤러 동작");
					    
//								MemberVO login = memberService.login(member);
						
						MemberVO login = MypagememberService.loginid(id);
				 		session.setAttribute("member_s", login);
				 		rttr.addFlashAttribute("member", member);
						
						ApplicationVO app = new ApplicationVO();
					    app.setId(id);
						model.addAttribute("list", MypagememberService.buyermypage(app));
						log.info("postingVO : " + MypagememberService.buyermypage(app));
						
						
						model.addAttribute(MypagememberService.memberright0(id));
						MypagememberService.memberright0(id);
						member.setId(id);
						
						model.addAttribute("app", MypagememberService.getApplication(id));
						log.info("app 값" + MypagememberService.getApplication(id));
					    
				 		session.setAttribute("member_s", login);
				 		rttr.addFlashAttribute("member", member);

						//log.info("list 값 : " +MypagememberService.buyermypage(app) );
						
//								String referer = req.getHeader("Referer"); 
//								return "redirect:"+ referer;
						
						return "mypage/buyermypage";
					}

					// 전문가 마이페이지 (조회) 두번째 (세션값용)
					@GetMapping("/sellermypager")
					public String getsellermypager(@RequestParam("id") String id, MemberVO member, HttpSession session, Model model, HttpServletRequest req, RedirectAttributes rttr)throws Exception {

						log.info("/sellermypager 컨트롤러 동작");
						
//							MemberVO login = memberService.login(member);
						MemberVO login = MypagememberService.loginid(id);
				 		session.setAttribute("member_s", login);
				 		rttr.addFlashAttribute("member", member);
						
						model.addAttribute("list", MypagememberService.sellermypage(member));
						
						model.addAttribute(MypagememberService.memberright1(id));
						MypagememberService.memberright1(id);
						
						member.setId(id);
					    
				 		session.setAttribute("member_s", login);
				 		rttr.addFlashAttribute("member", member);

						//log.info("list 값 : " +MypagememberService.sellermypage(member) );
						
//							String referer = req.getHeader("Referer");.
//							return "redirect:"+ referer; 
						return "mypage/sellermypage";
					}
			
			// 전문가 게시물 등록여부 (조회)
			@GetMapping("/sellerpostingcheck")
			public void sellerpostingcheck(@RequestParam("id") String id, Model model) {

				log.info("/sellerpostingcheck 컨트롤러 동작");
				
			    MemberVO member = new MemberVO();
			    member.setId(id);
				model.addAttribute("list", MypagememberService.sellerpostingcheck(member));
				MypagememberService.memberright1(id);

				log.info("list 값 : " +MypagememberService.sellerpostingcheck(member) );
			}
	
	
	// 위시리스트
	@GetMapping("/wishlist")
	public void getwishlist(@RequestParam("id") String id, Model model) {	
		

		log.info("/wishlist 컨트롤러 동작");
		
		CartVO cart = new CartVO();
	    cart.setId(id);
		model.addAttribute("list", MypagememberService.wishlist(cart));

		log.info("wishlist 값 : " +MypagememberService.wishlist(cart) );
	}
	
	// 학생 창에서 뜰 비밀번호 변경
	@GetMapping("/buyerpasschange")
	public String buyerpasschange() {
		log.info("buyerpasschange");
		return "mypage/buyerpasschange";
	}
	
	// 전문가 창에서 뜰 비밀번호 변경
	@GetMapping("/sellerpasschange")
	public String sellerpasschange() {
		log.info("sellerinfochange");
		return "mypage/sellerpasschange";
	}
	
	// 비밀번호 변경 포스트
		@PostMapping("/mypage/passwordupdate")
		 public String passwordupdate(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
			
			log.info("update:" + vo);
		
		 	 if (MypagememberService.passwordupdate(vo)) {
		 	
		 		session.invalidate();
		 		rttr.addFlashAttribute("member", vo);		 
		 	
		 	 } 	 
		 
		 	 return "redirect:/member/loginForm";
		 }
	
	// 학생 창 개인정보 수정
	@GetMapping("/buyerinfochange")
	public String buyerinfochange() {
		log.info("buyerinfochange");
		
		
		return "mypage/buyerinfochange";
	}
	
	
//	// 마이페이지 개인정보 수정 포스트
//	@Transactional
//	@PutMapping("/memberupdate")
//	public String upadteUser(@PathVariable String id, @RequestBody MemberVO requestUser) { // Json 데이터를 요청 => Java Object(MessageConverter의 Jackson라이브러리로) 변환해서 받음
//
//	    MemberVO member = new MemberVO();
//	    member.setId(requestUser.getId());
//	    member.setPassword(requestUser.getPassword());
//	    member.setName(requestUser.getName());
//	    member.setRight(requestUser.getRight());
//	    member.setEmail(requestUser.getEmail());
//	    member.setPhone(requestUser.getPhone());
//	    
//	    
//	    return "redirect: mypage/buyerinfochange";
//	}
	
	// 마이페이지 개인정보 수정 포스트
	@PostMapping("/mypage/memberupdate")
	 public String Memberupdate(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		
		log.info("update:" + vo);
	
	 	 if (MypagememberService.memberupdate(vo)) {
	 		 
	 		 HttpSession session = req.getSession();
	 		 MemberVO login = memberService.login(vo);
	 		 session.setAttribute("member_s", login);
	 		 rttr.addFlashAttribute("member", vo);		 
	 	
	 	 } 	 
	 
	 	 HttpSession session = req.getSession();
	 	 return "redirect:/mypage/buyerinfochange";
	 }
	
	// 회원탈퇴
	@GetMapping("/memberdrop")
	public String memberdrop() {
		log.info("memberdrop");
		return "mypage/memberdrop";
	}
	
	// 회원탈퇴 delete post매핑
  @PostMapping("/mypage/memberdelete")
	 public String memberdelete(MemberVO id, HttpSession session, RedirectAttributes rttr)
	 {
	
	 	 log.info("delete..." + id);
	 	 try {
		 	 if (MypagememberService.memberdelete(id)) {
		 		 
		 		 session.invalidate();
		 				
		 		 rttr.addFlashAttribute("result", "success");
		 	 }
	 	 }catch(Exception e) {
	 		rttr.addFlashAttribute("msg", "비밀번호를 다시 확인해 주세요.");
	 		return "redirect:/mypage/memberdrop";
	 	 }
	 	 return "redirect:/main";
	 }
	
//	@RequestMapping(value = "/mypage/memberdelete", method = RequestMethod.GET)
//	public ModelAndView removeMember(HttpSession session, ModelAndView mv) 
//	{
//		MemberVO member = (MemberVO) session.getAttribute("loginUser");
//		String memberId = member.getId();
//
//		try {
//			int result = MypagememberService.memberdelete(id);
//
//			if (result == 1) {
//				mv.setViewName("redirect:/main");
//			}
//
//		} catch (Exception e) {
//
//			mv.addObject("오류가 발생했습니다", e.getMessage());
//			mv.setViewName("main");
//		}
//
//		return mv;
//	}
	
	
//	@PostMapping("/mypage/memberdelete")
//	 public String Memberdelete(@RequestParam("password") String password, String id, RedirectAttributes rttr)
//	 {
//		
//        model.addAttribute("id", id);
//        model.addAttribute("pwd", password);
//        
//	 	 log.info("delete..." + id);
//	 	 if (MypagememberService.memberdelete(id)) {
//	 		 rttr.addFlashAttribute("result", "success");
//	 	 }
//	 	 return "redirect:/main";
//	 }
	
	// 수강신청 목록 확인 페이지
  @GetMapping("/sellerbuyercheck")
	public void sellerbuyercheck(@RequestParam("id") String id, Model model) {	
	  
		log.info("/sellerbuyercheck 컨트롤러 동작");
		
		PostingVO post = new PostingVO();
	    post.setId(id);
		model.addAttribute("lista", MypagememberService.sellerbuyercheck(post));
//		MemberVO member = new MemberVO();
//	    member.setId(id);
//		model.addAttribute("polist", MypagememberService.sellerpostingcheck(member));

		log.info("list 값 : " +MypagememberService.sellerbuyercheck(post) );
	}
  
	
	// 전문가 창 개인정보 수정
	@GetMapping("/sellerinfochange")
	public String sellerinfochange(){
		log.info("sellerinfochange");
		return "mypage/sellerinfochange";
	}
	
	// 수강신청 수락 포스트
	@PostMapping("/mypage/buyergrant")
	 public String buyergrant(ApplicationVO id, MemberVO mv, HttpServletRequest req, RedirectAttributes rttr){
		
		log.info("/buyergrant 컨트롤러 동작");
		
		log.info("update:" + id);
	
		String ids = mv.getId();
		
	 	 if (MypagememberService.buyergrant(id)) {
	 		 
	 		rttr.addFlashAttribute("result", "success");		 
	 	
	 	 } 	 
	 	 
	 	 return "redirect:/mypage/sellerbuyercheck?id=" + ids;
	 }
	
	// 수강신청 거절 포스트
		@PostMapping("/mypage/buyercancel")
		 public String buyercancel(ApplicationVO id, MemberVO mv, HttpServletRequest req, RedirectAttributes rttr){
			
			log.info("/buyercancel 컨트롤러 동작");
			
			log.info("delete:" + id);
		
			String ids = mv.getId();
			
		 	 if (MypagememberService.buyercancel(id)) {
		 		 
		 		rttr.addFlashAttribute("result", "success");		 
		 	
		 	 } 	 
		 	 
		 	 return "redirect:/mypage/sellerbuyercheck?id=" + ids;
		 }


	
	
}
