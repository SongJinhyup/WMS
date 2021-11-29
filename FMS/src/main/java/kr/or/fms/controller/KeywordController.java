package kr.or.fms.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.fms.fran.dto.FranVO;
import kr.or.fms.hq.dto.HqGoodsVO;
import kr.or.fms.logis.dto.LogisVO;
import kr.or.fms.logis.dto.LogisWhVO;
import kr.or.fms.service.KeywordService;
import kr.or.fms.sup.dto.SupVO;

@Controller
@RequestMapping("/keyword")
public class KeywordController {
	
	@Autowired
	KeywordService keywordService;
	
	@RequestMapping("/hqgoods.do")
	@ResponseBody
	public ResponseEntity<List<HqGoodsVO>> hqGoods() {
		ResponseEntity<List<HqGoodsVO>> entity = null;
		try {
			List<HqGoodsVO> goodsList = keywordService.goods();
			entity = new ResponseEntity<List<HqGoodsVO>>(goodsList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<HqGoodsVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		 
		return entity;
	}
	@RequestMapping("/logisGoodsTaking.do")
	@ResponseBody
	public ResponseEntity<LogisWhVO>hqGoodsDetail(@RequestParam Map<String, String> data) {
		ResponseEntity<LogisWhVO> entity = null;
		try {
			LogisWhVO goodsList = keywordService.getlogisGoods(data);
			entity = new ResponseEntity<LogisWhVO>(goodsList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<LogisWhVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping("/local.do")
	@ResponseBody
	public ResponseEntity<List<String>> local() {
		ResponseEntity<List<String>> entity = null;
		try {
			List<String> localList = keywordService.local();
			entity = new ResponseEntity<List<String>>(localList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<String>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping("/logis.do")
	@ResponseBody
	public ResponseEntity<List<LogisVO>> logis() {
		ResponseEntity<List<LogisVO>> entity = null;
		try {
			List<LogisVO> franList = keywordService.logis();
			entity = new ResponseEntity<List<LogisVO>>(franList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<LogisVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping("/fran.do")
	@ResponseBody
	public ResponseEntity<List<FranVO>> fran() {
		ResponseEntity<List<FranVO>> entity = null;
		try {
			List<FranVO> franList = keywordService.fran();
			entity = new ResponseEntity<List<FranVO>>(franList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<FranVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping("/sup.do")
	@ResponseBody
	public ResponseEntity<List<SupVO>> sup() {
		ResponseEntity<List<SupVO>> entity = null;
		try {
			List<SupVO> supList = keywordService.sup();
			entity = new ResponseEntity<List<SupVO>>(supList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<SupVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping("/laca.do")
	@ResponseBody
	public ResponseEntity<List<String>> laca() {
		ResponseEntity<List<String>> entity = null;
		try {
			List<String> lacaList = keywordService.laca();
			entity = new ResponseEntity<List<String>>(lacaList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<String>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping("/smca.do")
	@ResponseBody
	public ResponseEntity<List<String>> smca() {
		ResponseEntity<List<String>> entity = null;
		try {
			List<String> smcaList = keywordService.smca();
			entity = new ResponseEntity<List<String>>(smcaList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<String>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}

	@RequestMapping("/log.do")
	@ResponseBody
	public ResponseEntity<List<LogisVO>> log() {
		ResponseEntity<List<LogisVO>> entity = null;
		try {
			List<LogisVO> logList = keywordService.log();
			entity = new ResponseEntity<List<LogisVO>>(logList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<LogisVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping("/hq.do")
	@ResponseBody
	public ResponseEntity<List<HqGoodsVO>> hq() {
		ResponseEntity<List<HqGoodsVO>> entity = null;
		try {
			List<HqGoodsVO> hqList = keywordService.hq();
			entity = new ResponseEntity<List<HqGoodsVO>>(hqList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<HqGoodsVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		 
		return entity;
	}
	@RequestMapping("/outFran.do")
	@ResponseBody
	public ResponseEntity<List<FranVO>> outFran() {
		ResponseEntity<List<FranVO>> entity = null;
		try {
			List<FranVO> outFranList = keywordService.outFran();
			entity = new ResponseEntity<List<FranVO>>(outFranList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<FranVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping("/outLogis.do")
	@ResponseBody
	public ResponseEntity<List<LogisVO>> outLogis() {
		ResponseEntity<List<LogisVO>> entity = null;
		try {
			List<LogisVO> outLogisList = keywordService.outLogis();
			entity = new ResponseEntity<List<LogisVO>>(outLogisList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<LogisVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping(value="/wh.do", method= RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<LogisWhVO>> wh(@RequestBody Map<String, String> data) {
		String fmsLogis = data.get("fms_logis");
		ResponseEntity<List<LogisWhVO>> entity = null;
		try {
			List<LogisWhVO> whList = keywordService.wh(fmsLogis);
			entity = new ResponseEntity<List<LogisWhVO>>(whList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<LogisWhVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping(value="/whcn.do", method= RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<LogisWhVO>> whcn(@RequestBody Map<String, String> data) {
		String fmsLogis = data.get("fms_logis");
		ResponseEntity<List<LogisWhVO>> entity = null;
		try {
			List<LogisWhVO> whList = keywordService.whcn(fmsLogis);
			entity = new ResponseEntity<List<LogisWhVO>>(whList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<LogisWhVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
/////////////////////////////////////웅//////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/logisWh.do")
	@ResponseBody
	public ResponseEntity<List<LogisWhVO>> logisWh() {
		ResponseEntity<List<LogisWhVO>> entity = null;
		try {
			List<LogisWhVO> logisWhList = keywordService.logisWh();
			entity = new ResponseEntity<List<LogisWhVO>>(logisWhList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<LogisWhVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
}
