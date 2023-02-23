package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
@AllArgsConstructor
public class MemberController {

	// 자동DI
	@Autowired
	private MemberService memberService;

	// ======== 로그인 폼 띄우기 ===========
	@GetMapping("/loginForm") // 해당 주소로 요청 시 로그인뷰를 띄워 줌
	public String loginForm() {
		log.info("로그인폼으로 이동...");

		return "/member/login"; // jsp로 이동 (리다이렉트 쓰면 페이지이동, 없으면 뷰를 보임)
	}

	// ======== 로그인 ===========
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {

		HttpSession session = req.getSession();
		MemberVO login = memberService.login(vo);

		if (login == null) {

			log.info("계정 없다~~");
			session.setAttribute("member_s", null);
			rttr.addFlashAttribute("msg_s", false);

			return "redirect:/member/loginForm";

		} else {
			log.info("계정 있네~~");
			session.setAttribute("member_s", login);
		}

		return "redirect:/main"; // localhost:8081/main으로 가짐
		// return "redirect:main"; // => localhost:8081/member/main으로 가짐(main 앞에 '/'가
		// 없으면)
		// redirect를 안 쓰면 뷰를 찾아준다, 쓰면 페이지이동

		// 또 다른 외부 요청 방법 1: return "redirect: http://localhost:8081/main";
		// 또 다른 외부 요청 방법 2: return "redirect:"+"/main";

	}

	// ========ID 찾기 폼 띄우기 ===========
	@GetMapping(value = "findIdForm")
	public String find_id_form() {
		log.info("아이디 찾기 폼으로 이동...");
		return "/member/findid";
	}

	// ======== ID 찾기 ===========
	@RequestMapping(value = "findId", method = RequestMethod.POST)
	public String findUserId(@RequestParam(required = true, value = "name") String name,
			@RequestParam(required = true, value = "email") String email, Model model, MemberVO vo) {
		log.info("아이디 찾기 실행...");

		try {

			vo.setName(name);
			vo.setEmail(email);
			MemberVO memberSearch = memberService.findId(vo);

			log.info("memberSearch : " + memberSearch);

			model.addAttribute("Idinfo", memberSearch);

		} catch (Exception e) {
			model.addAttribute("msg", "오류발생");
		}

		return "/member/findid_result";
	}

	// ========PW 찾기 폼 띄우기 ===========
	@GetMapping(value = "/findPwForm")
	public String find_pw_form() {
		log.info("비번 찾기 폼으로 이동...");
		return "/member/findpw";
	}

	// ======== PW 찾기 ===========
	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public void findPwPOST(@ModelAttribute MemberVO vo, HttpServletResponse resp) throws Exception {
		log.info("비번 찾기 POST...");
		memberService.findPw(resp, vo);
	}

//	@RequestMapping(value = "/member/findpw", method = RequestMethod.GET)
//	public void findPwGET() throws Exception{
//		log.info("비번 찾기 GET...");
//	}

	// ======== 회원가입 폼 띄우기 ===========
	@GetMapping("/memberForm") // 해당 주소로 요청 시 로그인뷰를 띄워 줌
	public String memberForm() {
		log.info("회원가입폼으로 이동");

		return "/member/member"; //
	}

	// ======== 로그아웃 ===========
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		log.info("로그아웃...");

		session.invalidate();

		return "redirect:/main";
	}

	// ======== 마이페이지 폼 띄우기 ===========
	@GetMapping("/mypageForm") // 해당 주소로 요청 시 로그인뷰를 띄워 줌
	public String myPageForm() {
		log.info("마이페이지폼으로 이동");

		return "redirect: /mypage/buyermypage"; // jsp로 이동 (리다이렉트 쓰면 페이지이동, 없으면 뷰를 보임)
	}

//=======================================================================================================	

	// 아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		int cnt = memberService.idCheck(id);

		System.out.println("cnt: " + cnt);
		return cnt;
	}

	// 맴버 인서트
	@PostMapping("/memberForm")
	public String memberInsert(MemberVO member) {

		log.info(member);
		memberService.memberInsert(member);
		System.out.println(member);
		return "redirect:/member/loginForm";

	}

//=======================================================================================	 

	// DB테스트용(DB불러오기)
	@GetMapping("/list") // get방식으로 요청이 들어오면
	// http://localhost:8081/board/list 주소로 요청 시 실행
	public void list(Model model, String id) {
		log.info("list..........");
		log.info(model.addAttribute("list", memberService.getList()));
	} // Model 객체를 이용하여 데이터 전달 방식: 결과를 만들어서 실제 필요한 곳으로 전달하기 위해 씀

}// c
