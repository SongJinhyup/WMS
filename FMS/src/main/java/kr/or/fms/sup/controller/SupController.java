package kr.or.fms.sup.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.fms.dto.MenuVO;
import kr.or.fms.service.MenuService;
import kr.or.fms.sup.dto.SalesGoodsVO;
import kr.or.fms.sup.dto.SupGoodsVO;
import kr.or.fms.sup.dto.SupVO;
import kr.or.fms.sup.service.SupService;

@Controller
@RequestMapping("/sup")
public class SupController {
	
	@Autowired
	MenuService menuService;
	@Autowired
	SupService supService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(SupController.class);
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(@RequestParam(defaultValue="MS00000")String mCode, Model model) throws SQLException{
		String url = "sup/index_sup";
		try {
			List<MenuVO> menuList = menuService.getSupMenuList();
			model.addAttribute("menuList", menuList);
		} catch (SQLException e) {
			e.printStackTrace();
			url = null;
		}
		
		return url;
	}
	
	@RequestMapping(value = "/common/loginFormSup", method = RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="")String error, HttpServletResponse response) {
		String url = "common/loginFormSup";
		if (error.equals("1")) {
			response.setStatus(302);
		}
		return url;
	}
	
	@RequestMapping(value = "/main", method=RequestMethod.GET)
	public ModelAndView main(ModelAndView mnv, HttpSession session) throws Exception{
		String url ="sup/suphome";
		
		SupVO sup = (SupVO)session.getAttribute("loginSup");
		String sup_code = sup.getSup_code();
		
		List<SupGoodsVO> supGoodsList = supService.getSupGoods(sup_code);
		int totalCount = supService.getTotalCount(sup_code);
		
		List<SalesGoodsVO> salesGoodsList = supService.getSalesGoods(sup_code);
		int totalCnt = supService.getTotalSalesGoodsCount(sup_code);
		
		
		mnv.addObject("totalCnt", totalCnt);
		mnv.addObject("salesGoodsList", salesGoodsList);
		mnv.addObject("totalCount", totalCount);
		mnv.addObject("supGoodsList", supGoodsList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/subMenu")
	@ResponseBody
	public ResponseEntity<List<MenuVO>> subMenuToJSON(String mCode) throws Exception {
		ResponseEntity<List<MenuVO>> entity=null;
	
		List<MenuVO> subMenu = null;
		try {
			subMenu = menuService.getSubMenuList(mCode);			
		
			entity  = new ResponseEntity<List<MenuVO>>(subMenu,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<MenuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}
	
	@RequestMapping("/getMcode")
	@ResponseBody
	public ResponseEntity<MenuVO> getMcode(String mName)throws Exception{
		
		ResponseEntity<MenuVO> entity = null;
		try {
				MenuVO menu = menuService.getMenuByMname(mName);
				
				entity = new ResponseEntity<MenuVO>(menu, HttpStatus.OK) ;
		}catch(SQLException e) {
				entity = new ResponseEntity<MenuVO>(HttpStatus.INTERNAL_SERVER_ERROR) ;
		}
	
		
		return entity;
	}
	
	@RequestMapping("/common/loginTimeOut")
	public String loginTimeOut(Model model) throws Exception {
		String url = "security/sessionOutSup";
		
		model.addAttribute("message", "세션이 만료되었습니다.다시 로그인하세요.");
				
		return url;
	}
	
	@RequestMapping("/common/loginExpired")
	public String loginExpired(Model model) throws Exception {
		String url = "security/sessionOutSup";
		model.addAttribute("message", "중복로그인이 확인되었습니다. \\n 다시 로그인하면 다른 장치에서 로그인은 취소됩니다.");
				
		return url;
	}

	@RequestMapping(value = "/common/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		String url = "redirect:/sup";
		session.invalidate();

		return url;
	}
	
	
	
	
}