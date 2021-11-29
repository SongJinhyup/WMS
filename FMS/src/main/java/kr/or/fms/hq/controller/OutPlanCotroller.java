package kr.or.fms.hq.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.fms.command.OutModifyCommand;
import kr.or.fms.command.OutRegistCommand;
import kr.or.fms.command.SearchCriteria;
import kr.or.fms.hq.dto.OutVO;
import kr.or.fms.hq.service.InOutService;

@Controller
@RequestMapping("/hq")
public class OutPlanCotroller {
	
	 @Autowired
		InOutService inOutService;
	  

	
	 @RequestMapping(value = "/inout/outRegist", method = RequestMethod.POST)
	 @ResponseBody
		public ResponseEntity<Map<String, Object>> outRegist(@RequestBody OutRegistCommand regReq) throws SQLException {
			
			// 데이터 insert 로직
			Map<String, Object> dataMap = new HashMap<>();
			ResponseEntity<Map<String, Object>> entity=null;
			
	 		OutVO out = regReq.toOutVO();
	 		
	 		try {
	 			// 등록 후 잘 등록된 출고계획을 받아옴 - 등록시 시퀀스로 생성된 출고번호를 이용해서! 서비스를 확인하세요~~!
	 			OutVO vo = inOutService.regist(out);
	 			dataMap.put("regist", "regist");
	 			dataMap.put("outDetail", out);
	 			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
	 			
	 		}catch (SQLException e) {
	 			e.printStackTrace();
	 			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
	 		}
	 		
	 		return entity;
		
		}
	 	
	 	@RequestMapping(value = "/inout/outmodify", method = RequestMethod.POST)
	 	@ResponseBody
	 	public ResponseEntity<String> outModify(@RequestBody OutModifyCommand regReq, String out_code) throws SQLException {
	 		
	 		ResponseEntity<String> entity=null;
	 		
	 		OutVO out = regReq.toOutMVO();
	 		
	 		try {
	 			inOutService.modifyOut(out);
	 			entity = new ResponseEntity<String>("modify", HttpStatus.OK);
			} catch (SQLException e) {
				e.printStackTrace();
	 			entity = new ResponseEntity<String>(e.getMessage(),
						HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			return entity;
		}
	 
	 	// 등록
	  	@RequestMapping("/inout/outRegistForm")
	  	public String registForm() {
	  		String url = "hq/OutPlanList2";
	  		return url;
	  	}
	  
	
		
	  	@RequestMapping(value = "/inout/Outdetail", method = RequestMethod.GET)
		public ModelAndView OutPlanTaking(SearchCriteria cri, ModelAndView mnv) throws SQLException {
			String url = "hq/outplanTaking";
			cri.setPerPageNum(10);
			Map<String, Object> dataMap = inOutService.getOutTakingList(cri);
			
			
			mnv.addAllObjects(dataMap);
			mnv.setViewName(url);
			
			return mnv;
		}

	  	@ResponseBody
		@RequestMapping(value = "/inout/search.do", method = RequestMethod.POST)
		public ResponseEntity<Map<String,Object>> outSearchTaking(@RequestBody Map<String, String> data) throws SQLException {
			
			ResponseEntity<Map<String,Object>> entity = null;
			SearchCriteria criMap = new SearchCriteria();
			
			
			criMap.setKeywordMap(data);
			criMap.setPage(data.get("page"));
			criMap.setPerPageNum(10);
			Map<String, Object> dataMap = new HashMap<String, Object>();
			try {
				dataMap = inOutService.getOutTakingSearchList(criMap);
				
				entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
			} catch (SQLException e) {
				e.printStackTrace();
				entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			return entity;
		}
	  	
	 
	  
	  	@ResponseBody
		@RequestMapping(value = "/inout/outtakingdetail", method = RequestMethod.POST)
		public ResponseEntity<List<OutVO>> outTakingDetail(@RequestBody String ocode) throws SQLException {
	  		System.out.println(ocode);
	  		ocode = ocode.substring(0,6);
	  		System.out.println(ocode);
			ResponseEntity<List<OutVO>> entity = null;
			try {
				
				List<OutVO> outDetail = inOutService.getOutTakingDetail(ocode);
				
				entity = new ResponseEntity<List<OutVO>>(outDetail, HttpStatus.OK);
			} catch (SQLException e) {
				e.printStackTrace();
				entity = new ResponseEntity<List<OutVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			return entity;
		}
	  	
	  	
}
