package kr.or.fms.hq.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.fms.dto.MenuVO;
import kr.or.fms.exception.InvalidPasswordException;
import kr.or.fms.exception.NotFoundIdException;
import kr.or.fms.hq.dto.HqEmpVO;
import kr.or.fms.hq.service.EmpService;
import kr.or.fms.service.MenuService;

@Controller
@RequestMapping("/hq")
public class HqController {
	@Autowired
	MenuService menuService;
	
	@Autowired
	EmpService empService;
	
	private static final Logger logger = LoggerFactory.getLogger(HqController.class);
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String home(Model model) {
		String url = "hq/index_hq";
		try {
			List<MenuVO> menuList = menuService.getMainMenuList();
			model.addAttribute("menuList", menuList);
		} catch (SQLException e) {
			e.printStackTrace();
			url = null;
		}
		
		return url;
	}
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) throws SQLException {
		String url = "hq/hqhome";
		
		HqEmpVO loginEmp = (HqEmpVO) session.getAttribute("loginEmp");
		
		model.addAttribute("loginEmp", loginEmp);
		 
		return url;
	}
	
	@RequestMapping(value = "/common/loginFormHq.do", method = RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="")String error, HttpServletResponse response) {
		String url = "common/loginFormHq";
		if (error.equals("1")) {
			response.setStatus(302);
		}
		return url;
	}
	
	@RequestMapping("/common/loginTimeOut")
	public String loginTimeOut(Model model)throws Exception{
		
		String url ="/common/loginFormHq";
		
		model.addAttribute("message","세션이 만료되었습니다.\n 다시 로그인 하세요!");
		return url;
	}
	
	@RequestMapping("/common/loginExpired")
	public String loginExpired(Model model)throws Exception{
		String url ="security/sessionOut";

		model.addAttribute("message", "중복 로그인이 확인되었습니다. \\n"+"다시 로그인하면 다른 장치에서 로그인은 취소됩니다.");
		
		return url;
		
	}
	
}