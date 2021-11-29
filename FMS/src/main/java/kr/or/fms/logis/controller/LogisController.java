package kr.or.fms.logis.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.dto.MenuVO;
import kr.or.fms.dto.ReturnVO;
import kr.or.fms.logis.dto.LogisContractInfoVO;
import kr.or.fms.logis.dto.LogisVO;
import kr.or.fms.logis.dto.LogisWhVO;
import kr.or.fms.logis.service.LogisService;
import kr.or.fms.logis.service.ReturnService;
import kr.or.fms.service.MenuService;

@Controller
@RequestMapping("/logis")
public class LogisController {

	@Autowired
	MenuService menuService;
	@Autowired
	ReturnService returnService;
	@Autowired
	LogisService logisService;
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String home(@RequestParam(defaultValue="ML00000")String mCode, Model model, HttpSession session) throws SQLException{
		String url = "logis/index_logis";
		
		
		try {
			List<MenuVO> menuList = menuService.getLogisMenuList();

			model.addAttribute("menuList", menuList);
			
		} catch (SQLException e) {
			e.printStackTrace();
			url = null;
		}
		return url;
	}
	@RequestMapping(value="/common/loginFormLogis",method=RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="")String error,HttpServletResponse response) {
		
		String url = "common/loginFormLogis";//response가 화면결정인자
		if(error.equals("1")) {
			response.setStatus(302);
		}
		return url;
	}
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public ModelAndView main(ModelAndView mnv, HttpSession session) throws Exception{
		String url ="logis/logishome";
		
		LogisVO logis = (LogisVO)session.getAttribute("loginLogis");
		String logis_code = logis.getLogis_code();
		
		//1.logis정보
		LogisVO logisInfo = logisService.getLogis(logis_code);
		
		//2.반품개수
		int returnCount = logisService.getReturnCount();
		
		//3.창고정보
		List<LogisWhVO> logisWhInfoList = logisService.getLogisWh(logis_code);
		
		//4.계약업체수
		int hqCount = logisService.getLogisHq(logis_code);
		
		//5.물품 탑5
		List<LogisWhVO> topGoodsList = logisService.getTopGoods(logis_code);
		
		//6.계약중인 업체정보
		List<LogisContractInfoVO> contractHqList = logisService.getContractHq(logis_code);
		
		
		mnv.addObject("logisInfo", logisInfo);
		mnv.addObject("returnCount", returnCount);
		mnv.addObject("hqCount", hqCount);
		mnv.addObject("logisWhInfoList", logisWhInfoList);
		mnv.addObject("topGoodsList", topGoodsList);
		mnv.addObject("contractHqList", contractHqList);
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
	public String loginTimeOut(Model model)throws Exception{
		
		String url ="security/sessionOutLogis";
		
		model.addAttribute("message","세션이 만료되었습니다.\n 다시 로그인 하세요!");
		return url;
	}
	
	@RequestMapping("/common/loginExpired")
	public String loginExpired(Model model)throws Exception{
		String url ="security/sessionOutLogis";

		model.addAttribute("message", "중복 로그인이 확인되었습니다. \\n"+"다시 로그인하면 다른 장치에서 로그인은 취소됩니다.");
		
		return url;
		
	}
	
	@RequestMapping(value = "/common/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		String url = "redirect:/logis";
		session.invalidate();

		return url;
	}
	
	
	
	
}
