package jj.j2.sh.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jj.j2.sh.model.Customer;
import jj.j2.sh.service.CustomerService;
import jj.j2.sh.service.PayService;
import jj.j2.sh.model.Company;
import jj.j2.sh.service.CompanyService;

@Controller
public class RootController {
	@Autowired
	CustomerService service;
	
	@Autowired
	CompanyService CompanySevice;
	
	@Autowired
	PayService PaySevice;
	
	
	@RequestMapping("/")
	String home() {
		
		return "home";
		
	}
	
	@RequestMapping("/signup")
	String signup() {
		
		return "/signup";
	}
			
			@GetMapping("/login2")
			String login() {
				 return "redirect:/";
			}
			
			@PostMapping("/login2")
			String login(Customer item, HttpSession session, Model model,
					HttpServletRequest request) {
				//레퍼러로 이전 url 가져와서 여기로 리다이텍트 하게 요청함
				String referer = request.getHeader("Referer");
				
				if(service.login(item)) {
					session.setAttribute("customer", item);
					
					model.addAttribute("loginmsg", item.getCustomerNnm()+"님 환영합니다.");
					model.addAttribute("url", referer);
					
					return "logintry";
				}
				
				model.addAttribute("loginmsg", "아이디나 패스워드를 다시 확인해주세요.");
				
				model.addAttribute("url", referer);
				
				return "logintry";
			}
			
			@GetMapping("/logout")
			String logout(HttpSession session) {
				//세션을 무효화(invalidate) 함
				session.invalidate();
				
				return "redirect:.";
			}
			
			@GetMapping("/login0")
			String login0() {
				return "login0";
			}

			@RequestMapping("/mypage") 
			String mypage() {
				return "mypage/mypage";
			}
			
			@RequestMapping("/userinfo") 
			String userinfo() {
				return "mypage/userinfo";
			}
			
			@PostMapping("/login0")
			String login0(Company item, HttpSession session, Model model,
					HttpServletRequest request) {
				//레퍼러로 이전 url 가져와서 여기로 리다이텍트 하게 요청함
				String referer = request.getHeader("Referer");
				
				if(CompanySevice.login0(item)) {
					session.setAttribute("company", item);
					
					model.addAttribute("loginmsg", item.getCompanyName()+"님 환영합니다.");
					model.addAttribute("url", referer);
					
					int sumCoin = PaySevice.sum(item.getCompanyId());
					session.setAttribute("sumCoin", sumCoin);
					
					return "logintry";
				}
				
				model.addAttribute("loginmsg", "아이디나 패스워드를 다시 확인해주세요.");
				
				model.addAttribute("url", referer);
				
				return "logintry";
			}
			
	///////////////////임시(pjh)////////////////////////
			@RequestMapping("/pjh")
			String pjh() {
				
				return "pjh";
				
			}
}
