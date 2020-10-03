package com.webforum.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webforum.model.Member;
import com.webforum.service.MemberService;


@Controller
public class WebController {
	//test
	@Autowired
	private MemberService service;
	
	@RequestMapping("/")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("loginForm");
		return mv;
	}
	
	@RequestMapping("/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("about");
		return mv;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout() {
		ModelAndView mv = new ModelAndView("loginForm");
		return mv;
	}
	
	@GetMapping("/page/{pageNumber}")
	public ModelAndView listByPage(@PathVariable("pageNumber") int currentPage) {
		ModelAndView mv = new ModelAndView("index");
		Page<Member> page = service.listAll(currentPage);
		long totalItems = page.getTotalElements();
		int totalPages = page.getTotalPages();
		
		List<Member> listMember = page.getContent();
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("totalItems", totalItems);
		mv.addObject("totalPages", totalPages);
		mv.addObject("listMember", listMember);
		return mv;		
	}
	
	
	@RequestMapping("/index")
	public ModelAndView home() {
		/*
		int currentPage = 1;
		ModelAndView mv = new ModelAndView("index");
		Page<Member> page = service.listAll();
		long totalItems = page.getTotalElements();
		int totalPages = page.getTotalPages();
		
		List<Member> listMember = page.getContent();
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("totalItems", totalItems);
		mv.addObject("totalPages", totalPages);
		mv.addObject("listMember", listMember);
		*/
		ModelAndView mv = new ModelAndView("redirect:/page/1");
		return mv;
		
	}
	
	
	@RequestMapping("/addMember")
	public String addMemberForm(Map<String, Object> model) {
		model.put("member",  new Member());
		return "addMemberForm";
	}
	
	@RequestMapping(value="/page/processAddMember", method=RequestMethod.POST)
	public String saveMember(@ModelAttribute("member")Member member) {
		service.save(member);			
		return "redirect:/index";
	}
	
	@RequestMapping("/page/editMember")
	public ModelAndView editMember(@RequestParam int id) {
		ModelAndView mv = new ModelAndView("editMemberForm");
		Member member = service.getMember(id);
		mv.addObject("member", member);
		
		//System.out.println(member.getName());		mv.addObject("Member", member);
		return mv;
	}
	
	@RequestMapping("/page/deleteMember")
	public String deleteMember(@RequestParam int id) {
		service.deleteMember(id);
		return "redirect:/index";
	}
	
	@RequestMapping("/page/searchMember")
	public ModelAndView searchMember(@RequestParam String keyword) {
		System.out.println(keyword);
		ModelAndView mv = new ModelAndView("searchMemberResult");
		List<Member> result = service.searchMember(keyword);
		System.out.println(result);
		mv.addObject("result", result);
		return mv;
	}
}
