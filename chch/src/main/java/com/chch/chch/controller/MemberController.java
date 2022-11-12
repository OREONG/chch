package com.chch.chch.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chch.chch.model.Member;
import com.chch.chch.service.MailSendService;
import com.chch.chch.service.MemberService;

@Controller
public class MemberController {
	//메일
	@Autowired
	private JavaMailSender jms;
	//서비스
	@Autowired
	private MemberService ms;
	//비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder bpe; 
	
	private String emailChk;
	
	@RequestMapping("main")
	public String main(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		model.addAttribute("id", id);
		return "/main/main";
	}
	
	//초기 회원가입 화면
	@RequestMapping("joinForm")
	public String joinForm() {
		return "/member/joinForm";
	}
	
	//아이디 중복검사
	@RequestMapping(value = "idDepChk", produces = "text/html;charset=utf-8")
	@ResponseBody //jsp로 가지말고 바로 본문을 전달
	public String idDepChk(String id, Model model) {
		String msg = "";
		Member member = ms.select(id);
		if(member == null) msg = "사용 가능한 아이디 입니다";
		else msg = "이미 사용중인 아이디 입니다";
		return msg;
	}
	
	//회원가입 폼에 적은 이메일을 가져와 이메일 전송
	@RequestMapping(value="emailChk", produces="text/html;charset=utf-8")
	@ResponseBody
	public String emailChk(String email, Model model) {
		String msg = "";
		Member member = ms.selectEmail(email);
		if(member == null) {
			MailSendService mailsend = new MailSendService();
			emailChk = mailsend.joinEmail(email, jms);
			System.out.println("Controller에 넘어온 인증코드 : " + emailChk);			
		}else {
			msg = "중복된 이메일 입니다";
		}
		return msg;
	}
	
	//회원가입 폼에 적은 인증번호와 메일로 전송한 인증번호가 일치하는지 확인
	@RequestMapping(value="emailConfirm", produces="text/html;charset=utf-8")
	@ResponseBody
	public String emailConfirm(String emailConfirm, Model model) {
		System.out.println("적은 인증번호 : " + emailConfirm);
		System.out.println("메일로 보낸 인증번호 : " + emailChk);
		String msg = "";
		if(emailChk.equals(emailConfirm)) {
			msg = "y";
		}else  {
			msg = "n";
		}
		return msg;
	}
	
	//회원가입
	@RequestMapping("join")
	public String join(Member member, Model model, HttpSession session){
		int result = 0;
		//member는 화면 입력한 데이터, member2는 db에 있는 데이터
		Member member2 = ms.select(member.getId());
		if(member2 == null) {
			String encPass = bpe.encode(member.getPassword()); //비밀번호 암호화
			member.setPassword(encPass);
			result = ms.insert(member);
		}else result = -1;//이미 있으니 입력하지마
		model.addAttribute("result", result);
		return "/member/join";
	}
	
	//로그인 화면
	@RequestMapping("loginForm")
	public String loginForm(Model model, HttpServletRequest request, String targetPage) {
		
		// 기존에 가려던 페이지 주소 전달
		model.addAttribute("targetPage", targetPage);
		
		return "/member/loginForm";
	}
	
	//로그인
	@RequestMapping("login")
	public String login(Member member, Model model, HttpSession session, String targetPage) {
		int result = 0;
		Member member2 = ms.select(member.getId());
		if (member2 == null || member2.getDel().equals("y")) result = -1; //없는 아이디
		//bpe.matches db의 비밀번호와 받아온 비밀번호를 모두 암호화 한 상태로 같은지 비교
		else if (bpe.matches(member.getPassword(), member2.getPassword())) {
			result = 1; //성공 -> 아이디와 비밀번호가 일치한다
			session.setAttribute("id", member.getId());
		}
		
		System.out.println("로그인에서의 targetPage : "+targetPage);
		// 
		if (targetPage.equals("") || targetPage == null) {
			targetPage = "main.do";
		}
		
		model.addAttribute("targetPage", targetPage);
		model.addAttribute("result", result);
		return "/member/login";
	}

	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/member/logout";
	}
	
	//회원 정보 수정 폼
	@RequestMapping("updateForm")
	public String updateForm(Model model,HttpSession session) {
		String id= (String)session.getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
		return "/member/updateForm";
	}
	
	//회원 정보 수정
	@RequestMapping("update")
	public String update(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		
		//사진을 수정 할 수도 있고, 안할 수도 있음(안하면 fileName에 null 또는 공란이 넘어옴)
		String fileName = member.getFile().getOriginalFilename();
		//사진이 넘어왔을 때만 파일을 넣어 줌
		if(fileName != null && !fileName.equals("")) {
			member.setFileName(fileName);
			String real = session.getServletContext().getRealPath("/resources/images/memberImg");
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			fos.write(member.getFile().getBytes());
			fos.close();
		}
		result = ms.update(member);
		model.addAttribute("result", result);
		return "/member/update";
	}
	
	//회원정보 삭제 폼
	@RequestMapping("deleteForm")
	public String deleteForm(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		model.addAttribute("id", id);
		return "/member/deleteForm";
	}
	
	//회원정보 삭제
	@RequestMapping("delete")
	public String delete(Member member, Model model, HttpSession session) {
		int result = 0;
		String id = (String)session.getAttribute("id");
		Member member2 = ms.select(id);
		//matches(평문의 오리지널 패스워드, db의 암호화된 패스워드)
		System.out.println("db" + member2.getPassword());
		System.out.println("view" + member.getPassword());
		if(bpe.matches(member.getPassword(), member2.getPassword())){
			result = ms.delete(id);
		}else result = -1;
		//세션 날리기
		if(result > 0) session.invalidate();
		model.addAttribute("result", result);
		return "/member/delete";
	}

	//아이디 찾기
	@RequestMapping("findIdForm")
	public String findIdForm() {
		return "/member/findIdForm";
	}
	
	//아이디 찾기 이메일 인증
	@RequestMapping(value="emailChkFindId", produces="text/html;charset=utf-8")
	@ResponseBody
	public String emailChkFindId(String email, Model model) {
		String msg = "";
		Member member = ms.selectEmail(email);
		if(member == null) {
			msg = "존재하지 않는 이메일 입니다";	
		}else {
			MailSendService mailsend = new MailSendService();
			emailChk = mailsend.joinEmail(email, jms);
			System.out.println("Controller에 넘어온 인증코드 : " + emailChk);		
		}
		return msg;
	}
	
	//아이디 찾기 아이디 보여주는 화면
	@RequestMapping("findId")
	public String findId(Model model, String email) {
		Member member = ms.selectEmail(email);
		model.addAttribute("member", member);
		return "/member/findId";
	}
	
	//비밀번호 찾기 아이디 입력 단계
	@RequestMapping("findPasswordForm")
	public String findPasswordForm() {
		return "/member/findPasswordForm";
	}
	
	//비밀번호 찾기 아이디 일치 여부
	@RequestMapping("findPassword")
	public String findPasswordForm(Member member, Model model) {
		int result = 0;
		Member member2 = ms.select(member.getId());
		if(member2 == null || member2.getDel().equals("y")) {
			result = -1;
		}
		model.addAttribute("result", result);
		return "/member/findPassword";
	}
	
	//비밀번호 찾기 이메일 인증 단계 폼
	@RequestMapping("findPasswordForm2")
	public String findPasswordForm2(Member member, Model model) {
		model.addAttribute(member.getId());
		return "/member/findPasswordForm2";
	}
	
	//비밀번호 찾기 이메일 인증
	@RequestMapping(value="emailChkFindPass", produces="text/html;charset=utf-8")
	@ResponseBody
	public String emailChkFindPass(String email, String id, Model model) {
		String msg = "";
		Member member = ms.selectEmail(email);
		if(member != null) {
			if(member.getId().equals(id)) {
				MailSendService mailsend = new MailSendService();
				emailChk = mailsend.joinEmail(email, jms);
				System.out.println("Controller에 넘어온 인증코드 : " + emailChk);		
				msg = "y";
			}else if(!member.getId().equals(id)) {
				msg = "n";
			}
		} else msg = "null";

		return msg;
	}
	
	
	//비밀번호 재설정 폼
	@RequestMapping("inputPasswordForm")
	public String inputPasswordForm(Member member, Model model) {
		model.addAttribute(member);
		return "/member/inputPasswordForm";
	}
	
	@RequestMapping("inputPassword")
	public String inputPassword(Member member, Model model) {
		int result = 0;
		String encPass = bpe.encode(member.getPassword()); //비밀번호 암호화
		member.setPassword(encPass);
		result = ms.updatePassword(member);
		model.addAttribute("result", result);
		return "/member/inputPassword";
	}
}
