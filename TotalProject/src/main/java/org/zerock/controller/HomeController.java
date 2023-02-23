package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.MemberVO;
import org.zerock.service.BoardService;
import org.zerock.service.MgPostingService;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {

	@Autowired
	private BoardService service;

	@Autowired
	private MgPostingService MgPostingservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	// ■ 메인 폼 & 인기 게시물 불러오기
	@RequestMapping("/main")
	public String main(Model model) {

		log.info("-----------------------------------------");
		log.info("-------selectPopularPost_List------------");

		model.addAttribute("popularList", service.selectPopularPost());
//			log.info("popularList 값 : " + service.selectPopularPost());

		model.addAttribute("rPosting", service.getList());
		log.info("rPosting 값 : " + service.getList());

		// 동영상
		List<MemberVO> video = MgPostingservice.getVideo();
		model.addAttribute("video", video);

		return "/main";
	}

	// ■ 인기랭킹 리뷰 카운터
//	@PostMapping(value = "/mainReview", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE }) //받을 땐 json 돌려줄 땐 text
//	public void  reviewCnt(Model model, Long bno) { // @RequestBody : 넘어 온 데이터를 형변환 
//		log.info("bno 값 :  " + bno);
//		model.addAttribute("popReCnt", service.popularReviewCnt(bno));
//		log.info("popReCnt 값 : " + service.popularReviewCnt(bno));
//	}

}
