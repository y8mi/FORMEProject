package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ApplicationVO;
import org.zerock.domain.AttachFileDTO;
import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.PostingVO;
import org.zerock.domain.UploadVO;
import org.zerock.service.BoardService;
import org.zerock.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private ReviewService reviewService;

	// ■ 게시물 불러오기 , 페이징 처리, 전체 데이터 개수 처리
	@GetMapping("/boardcategory")
	public void list(Criteria cri, Model model) {

		log.info("--------------------------------------------------");
		log.info("*********** cri : " + cri);
		log.info("boardcategorylist---------------------------------");

		int total = service.getTotal(cri); // ex: keyword val1 이면 int total 값에 (104)값 담겨있음

		// ■ 매개변수가 cri 라는 boardserviceimple getList 를 호출한다
		model.addAttribute("list", service.getList(cri));
		log.info("list 값 : " + service.getList(cri));

		model.addAttribute("pageMaker", new PageDTO(cri, total)); // ${pageMaker} ex - cri : pagenum 1, amount 9,
																	// keyword 1 / total : 104

	}

	// ■ 통합검색
	@GetMapping("/boardTotal")
	public void totalList(Criteria cri, Model model) {

		log.info("--------------------------------------------------");
		log.info("*********** cri : " + cri);
		log.info("boardTotal---------------------------------");

		int total = service.getTotalCountAll(cri);

		log.info("total: " + total);

		model.addAttribute("tList", service.getListTotal(cri));
		log.info("tList 값 : " + service.getListTotal(cri));

		model.addAttribute("tpageMaker", new PageDTO(cri, total));
		log.info("tpagemaker: " + new PageDTO(cri, total));

	}

	// ■ 상세 페이지 이동 (조회)
	@GetMapping("/detail")
	public void get(@RequestParam("bno") Long bno, Model model, Criteria cri) {

		log.info("/detail 컨트롤러 동작");
		model.addAttribute("posting", service.get(bno));
		// 카트 추가해서..위시리스트에 담겨있는지까지 확인해야 js제대로 동작
		model.addAttribute("cart", service.cartget(bno));
		model.addAttribute("reviewRight", service.reviewRight(bno)); // 리뷰 권한
		model.addAttribute("reCnt", reviewService.getListPage(cri, bno)); // 리뷰 카운터

	}

	// ■ 수정 폼으로 이동
	@GetMapping("/modify")
	public void modify(@RequestParam("bno") Long bno, Model model) {

		log.info("/modify 컨트롤러 동작");
		model.addAttribute("posting", service.get(bno));
		// 카트 추가해서..위시리스트에 담겨있는지까지 확인해야 js제대로 동작
		model.addAttribute("cart", service.cartget(bno));
	}

	// ■ 상세 페이지 이동 (첨부파일도 함께 조회)
	@GetMapping(value = "/getUploadList", produces = MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<UploadVO>> getUploadList(Long bno) {

		log.info("컨트롤러 동작(getUploadList) :  " + bno);

		return new ResponseEntity<>(service.getUploadList(bno), HttpStatus.OK);

	}

	// ■ 작성 페이지 이동
	@GetMapping("/register")
	public void register() {

	}

	// ■ 글쓰기
	@PostMapping("/registerpost")
	public String registerpost(PostingVO posting, RedirectAttributes rttr) {

		log.info("register: " + posting);

		if (posting.getUploadList() != null) {

			posting.getUploadList().forEach(file -> log.info(file));
		}

		service.register(posting);

		rttr.addFlashAttribute("result", posting.getBno());

		return "redirect:/board/detail?bno=" + posting.getBno();

	}

	// ■ 게시글 수정
	@PostMapping("/modify")
	public String modify(PostingVO posting, RedirectAttributes rttr) {
		log.info("수정 : " + posting);

		if (service.modify(posting)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/detail?bno=" + posting.getBno();
	}

	// ■ 게시글 삭제
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {

		log.info("remove: " + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/main";
	}

//===================수강신청&위시 관련======================================

	// ■ 수강신청하면 application에 insert
	@PostMapping(value = "/apply", consumes = "application/json", produces = {
			MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE }) // 받을 땐 json 돌려줄 땐 text
	public ResponseEntity<String> applyinsert(@RequestBody ApplicationVO vo) { // @RequestBody : 넘어 온 데이터를 형변환

		log.info("ApplicationVO: " + vo);
		service.applyinsert(vo); // register 호출해서 vo를 넘겨준다

		return new ResponseEntity<>("success", HttpStatus.OK);
	}

	// ■ 위시리스트 insert
	@PostMapping(value = "/wishinsert", consumes = "application/json", produces = {
			MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE }) // 받을 땐 json 돌려줄 땐 text
	public ResponseEntity<String> wishinsert(@RequestBody CartVO vo) { // @RequestBody : 넘어 온 데이터를 형변환

		log.info("CartVO: " + vo);
		service.wishinsert(vo); // register 호출해서 vo를 넘겨준다

		return new ResponseEntity<>("success", HttpStatus.OK);
	}

	// ■ 위시리스트 remove
	@PostMapping(value = "/wishremove", consumes = "application/json", produces = {
			MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE })
	public ResponseEntity<String> wishremove(@RequestBody CartVO vo) {

		log.info("remove wish :" + vo);
		service.wishremove(vo);

		return new ResponseEntity<>("success", HttpStatus.OK);
	}

//===========================파일업로드 관련 ==============================

	// ■ 년,월,일 폴더 생성
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	// ■ ajax로 통해 들어오는 이미지 파일 판단
	private boolean checkImageType(File file) {

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (IOException e) {
			e.printStackTrace();
		}

		return false;
	}

	// ■ AttachFileDTO를 리스트로 반환
	@PostMapping(value = "/register", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> Thumbnailupload(MultipartFile[] uploadFile) {

		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";

		String uploadFolderPath = getFolder();

		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadFile) {

			AttachFileDTO attachDTO = new AttachFileDTO();

			String uploadFileName = multipartFile.getOriginalFilename();

			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("원래 파일명 : " + uploadFileName);
			attachDTO.setFileName(uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);

				if (checkImageType(saveFile)) {

					attachDTO.setFileType(true);

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 320, 260);

					thumbnail.close();
				}

				list.add(attachDTO);

				log.info("리스트에 담긴 attachDTO :" + list);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} // ■ end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	// ■ 썸네일 전송
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {

		log.info("filName: " + fileName);

		File file = new File("c:\\upload\\" + fileName);

		log.info("display실행완료 : " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content_type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();

		}

		return result;
	}// ■ getFile(썸네일)

	// ■ 썸네일 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {

		log.info("deleteFile : " + fileName);

		File file;

		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			if (type.equals("image")) {

				String largeFileName = file.getAbsolutePath().replace("s_", "");

				log.info("largeFileName: " + largeFileName);

				file = new File(largeFileName);

				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}// c
