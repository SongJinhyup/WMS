package kr.or.fms.logis.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.logis.dto.LStockTakingVO;
import kr.or.fms.logis.dto.LogisVO;
import kr.or.fms.logis.dto.LogisWhVO;
import kr.or.fms.logis.service.LogisStockService;

@Controller
@RequestMapping("/logis")
public class LogisStockChekController {
	
	@Autowired
	LogisStockService logisStockService;
	
	@RequestMapping("/stockcheck/list")
	public ModelAndView list(SearchCriteria cri, String wh, String keyword, ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "logis/taking/list";
		cri.setPerPageNum(20);
		
		cri.getKeywordMap().put("wh", wh);
		cri.getKeywordMap().put("keyword", keyword);
		Map<String, Object> dataMap= logisStockService.getTakingList(cri, session);
		mnv.addObject("dataMap",dataMap);
//		System.out.println(((List<LogisWhVO>) dataMap.get("whComboList")).size());
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	// 문자전송
	@RequestMapping(value = "/message", method = RequestMethod.POST)
	@ResponseBody
	public String sendSMS(@RequestBody Map<String, String> data, HttpSession session) throws Exception {
		System.out.println(data.get("whCode"));
		System.out.println(data.get("logisCode"));
		System.out.println(data.get("takingCode"));
		String url = "https://192.168.45.40:8001/fms/qrtaking.jsp?whCode="+data.get("whCode")+"&logisCode="+data.get("logisCode")+"&takingCode="+data.get("takingCode");
		String cellNum = null;
		if (data.get("phoneNum") == null || data.get("phoneNum").equals("")) {
			LogisVO logis = (LogisVO) session.getAttribute("loginLogis");
			cellNum = logis.getLogis_tel();
		} else {
			cellNum = data.get("phoneNum"); 
		}
		System.out.println("수신자 번호 : " + cellNum);
		
//		logisStockService.certifiedPhoneNumber(cellNum, url);

		return "success";
    }
	
	//페이지 상세
	@RequestMapping("/stockcheck/detail")
	public ModelAndView detail(ModelAndView mnv, LStockTakingVO takingVO, String taking_code) throws SQLException{
		String url="logis/taking/detail";		
		
		List<LStockTakingVO> detailList = logisStockService.getCode(takingVO);
		mnv.addObject("detailList", detailList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@ResponseBody
	@RequestMapping("/stockcheck/newSeq")
	public ResponseEntity<Integer> newSeq() throws SQLException{
		ResponseEntity<Integer> entity = null;
		try {
			int newCode = logisStockService.getNewCode();
			entity = new ResponseEntity<Integer>(newCode, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	//실사 등록
	@RequestMapping("/stockcheck/takingregist")
	public ModelAndView regist(ModelAndView mnv, LStockTakingVO takingVO) throws SQLException{
		System.out.println(takingVO.getLogis_code());
		System.out.println(takingVO.getWh_code());
		
		//데이터를 넘길 주소
		String url="logis/taking/detail";
		
		
		//웹소켓 start
		mnv.setViewName(url);
		mnv.addObject("whName", takingVO.getWh_name());
		mnv.addObject("takingCode", takingVO.getTaking_code());
		return mnv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/stockcheck/regist", method = RequestMethod.POST)
	public ResponseEntity<String> regist(@RequestBody Map<String, String> data) throws SQLException {
		ResponseEntity<String> entity = null;
		try {
			logisStockService.registTemp(data);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	@ResponseBody
	@RequestMapping(value = "/stockcheck/update", method = RequestMethod.POST)
	public ResponseEntity<String> update(@RequestBody Map<String, String> data) throws SQLException {
		ResponseEntity<String> entity = null;
		System.out.println("데이터가 넘어오나요?" + data);
		
		try {
			logisStockService.updateTemp(data);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	@ResponseBody
	@RequestMapping(value = "/stockcheck/savetaking", method = RequestMethod.POST)
	public ResponseEntity<String> saveTaking(@RequestBody Map<String, String> data) throws SQLException {
		ResponseEntity<String> entity = null;
		try {
			logisStockService.registData(data);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}

}
