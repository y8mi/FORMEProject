package org.zerock.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Transactional
@Service

public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {

		return memberMapper.login(vo);
	}

	// 로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
	}

	// 아이디찾기
	public MemberVO findId(MemberVO memberVO) {

		return memberMapper.findId(memberVO);
	};

	// 비밀번호찾기
	@Override
	public void findPw(HttpServletResponse resp, MemberVO vo) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		MemberVO ck = memberMapper.readMember(vo.getId());
		PrintWriter out = resp.getWriter();
		// 가입된 아이디가 없으면
		if (memberMapper.readMember(vo.getId()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if (!vo.getEmail().equals(ck.getEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setPassword(pw);
			// 비밀번호 변경
			memberMapper.updatePw(vo);
			// 비밀번호 변경 메일 발
			sendEmail(vo, "temPw");

			log.info(vo);
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	// 임시 패스워드 이메일 발송
	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "qpdb002@gmail.com"; // 관리자 이메일 아이디
		String hostSMTPpw = "evrbwrcsxwlivvdk"; // 관리자 이메일 '앱-비밀번호'(일반 비밀번호 안됨) - 계정 2차 인증 후 앱비번 발급해야됨!

		// 보내는 사람
		String fromEmail = "qpdb002@gmail.com"; // 보내는 사람 이메일
		String fromName = "(주)포미"; // 보내는 사람 이름

		String subject = "포미의 임시비밀번호입니다."; // 메일 제목
		String msg = "";

		if (div.equals("temPw")) {
			msg += "<div align='lift'";
			msg += "<h3>";
			msg += "[ " + vo.getId() + " ]" + "님의 임시 비밀번호입니다. <br>로그인 후 비밀번호를 변경해 주세요</h3>";
			msg += "<p>임시 비밀번호: ";
			msg += vo.getPassword() + "</p></div>";
		}

		// email전송
		String mailRecipient = vo.getEmail();// 받는 사람 이메일 주소
		try {
			// 객체 선언
			HtmlEmail mail = new HtmlEmail();

			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);
			mail.setAuthentication(hostSMTPid, hostSMTPpw);
			mail.setStartTLSEnabled(true);
			mail.addTo(mailRecipient, charSet);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//=======================================================================================

	// 아이디 중복 체크
	@Override
	public int idCheck(String id) {

		int cnt = memberMapper.idCheck(id);
		return cnt;
	}

	// 맴버 인서트
	@Override
	public void memberInsert(MemberVO member) {
		memberMapper.memberInsert(member);
	}

//=======================================================================================

	// DB테스트용(DB불러오기)
	@Override
	public List<MemberVO> getList() {

		log.info("전체조회.....");

		return memberMapper.getList();
	}

}
