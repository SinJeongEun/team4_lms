package com.team4.myapp.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team4.myapp.member.model.Lecture;
import com.team4.myapp.member.model.Member;
import com.team4.myapp.member.service.ILectureService;
import com.team4.myapp.member.service.IMemberService;

@Controller
public class MemberController {
	static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	IMemberService memberService;
	
	@Autowired
	ILectureService lectureService;
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String login(String memberId, String password, HttpSession session, Model model) {
		Member member = memberService.selectMember(memberId);
		if(member != null) {
			String dbPassword = member.getPassword();
			if(dbPassword==null) {
				model.addAttribute("message", "NOT_VALID_USER");
			} else {
				if(dbPassword.equals(password)) {
					session.setAttribute("memberid", memberId);
					session.setAttribute("membername",member.getMemberName());
					session.setAttribute("identity", member.getIdentity());
					session.setAttribute("lectureid", member.getLectureId());
					
					System.out.println("memberId: " + memberId);
					System.out.println("membername: " + member.getMemberName());
					System.out.println("identity: " + member.getIdentity());
					System.out.println("lectureid: " + member.getLectureId());
					if(member.getIdentity().equals("professor")) {
						List<Lecture> lectureList = lectureService.selectAllLecture();
						model.addAttribute("lectureList", lectureList);
						return "lecture/lectureList";
					} else {
						return "redirect:/attendance/main";
					}
				} else {
					model.addAttribute("message", "WRONG_PASSWORD");
				}
			}
		} else {
			model.addAttribute("message", "USER_NOT_FOUND");
		}
		session.invalidate();
		return "member/login";
	}
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "/member/login";
	}
}
