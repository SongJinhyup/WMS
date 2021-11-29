package kr.or.fms.hq.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.hq.dto.LogisStockTakingVO;
import kr.or.fms.hq.service.StockListService;

@Controller
@RequestMapping("/hq")
public class StockController {
	
	@Autowired
	StockListService stockListService;
	
	@RequestMapping(value = "/stock/detail", method = RequestMethod.GET)
	public ModelAndView stockFran(SearchCriteria cri, ModelAndView mnv) throws SQLException {
		String url = "hq/stockFranList";
		cri.setPerPageNum(20);
		Map<String, Object> dataMap= stockListService.getFranStockList(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/stock/searchfran.do", method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> stockSearchFran(@RequestBody Map<String, String> data) throws SQLException {
		ResponseEntity<Map<String,Object>> entity = null;
		SearchCriteria criMap = new SearchCriteria();
		criMap.setKeywordMap(data);
		criMap.setPage(data.get("page"));
		criMap.setPerPageNum(20);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		try {
			
			dataMap= stockListService.getFranStockSearch(criMap);
			
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping(value = "/stock/logisdetail", method = RequestMethod.GET)
	public ModelAndView stockLogis(SearchCriteria cri, ModelAndView mnv) throws SQLException {
		String url = "hq/stockLogisList";
		cri.setPerPageNum(20);
		Map<String, Object> dataMap= stockListService.getLogisStockList(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	@ResponseBody
	@RequestMapping(value = "/stock/searchlogis.do", method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> stockSearchLogis(@RequestBody Map<String, String> data) throws SQLException {
		ResponseEntity<Map<String,Object>> entity = null;
		SearchCriteria criMap = new SearchCriteria();
		criMap.setKeywordMap(data);
		criMap.setPage(data.get("page"));
		criMap.setPerPageNum(20);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		try {
			
			dataMap= stockListService.getLogisStockSearch(criMap);
			
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}

	@RequestMapping(value = "/stock/checkList", method = RequestMethod.GET)
	public ModelAndView stockLogisTaking(SearchCriteria cri, ModelAndView mnv) throws SQLException {
		String url = "hq/stockLogisTaking";
		cri.setPerPageNum(20);
		Map<String, Object> dataMap = stockListService.getLogisStockTakingList(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	@ResponseBody
	@RequestMapping(value = "/stock/searchlogistaking.do", method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> stockSearchLogisTaking(@RequestBody Map<String, String> data) throws SQLException {
		
		ResponseEntity<Map<String,Object>> entity = null;
		SearchCriteria criMap = new SearchCriteria();
		
		criMap.setKeywordMap(data);
		criMap.setPage(data.get("page"));
		criMap.setPerPageNum(20);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		try {
			
			dataMap= stockListService.getLogisStockTakingSearchList(criMap);
			
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = "/stock/logistakingdetail.do", method = RequestMethod.POST)
	public ResponseEntity<List<LogisStockTakingVO>> stockLogisTakingDetail(@RequestBody String takingCode) throws SQLException {
		takingCode = takingCode.substring(0,6);
		ResponseEntity<List<LogisStockTakingVO>> entity = null;
		try {
			
			List<LogisStockTakingVO> takingDetail = stockListService.getLogisStockTakingDetail(takingCode);
			
			entity = new ResponseEntity<List<LogisStockTakingVO>>(takingDetail, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<LogisStockTakingVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
}
