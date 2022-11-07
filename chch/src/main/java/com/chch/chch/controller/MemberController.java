package com.chch.chch.controller;

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
	@Autowired
	private JavaMailSender jms;
	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder bpe; //비밀번호 암호화
	private String emailChk;
	
	@RequestMapping("main")
	public String main() {
		return "main";
	}
	
	//초기 회원가입 화면
	@RequestMapping("/member/joinForm")
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
			else msg = "이미 사용중이니 다른 아이디를 사용하세요";
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
		@RequestMapping("/member/join")
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
	@RequestMapping("/member/loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}
	
	//로그인
	@RequestMapping("/member/login")
	public String login(Member member, Model model, HttpSession session) {
		int result = 0;
		Member member2 = ms.select(member.getId());
		if (member2 == null || member2.getDel().equals("y")) result = -1; //없는 아이디
		//bpe.matches db의 비밀번호와 받아온 비밀번호를 모두 암호화 한 상태로 같은지 비교
		else if (bpe.matches(member.getPassword(), member2.getPassword())) {
			result = 1; //성공 -> 아이디와 비밀번호가 일치한다
			session.setAttribute("id", member.getId());
		}
		model.addAttribute("result", result);
		return "/member/login";
	}
	
	//로그아웃
	   @RequestMapping("/member/logout")
	   public String logout(HttpSession session) {
	      session.invalidate();
	      return "/member/logout";
	   }

}