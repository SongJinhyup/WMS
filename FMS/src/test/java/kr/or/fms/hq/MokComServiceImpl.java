package kr.or.fms.hq;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.or.fms.command.PageMaker;
import kr.or.fms.command.SearchCriteria;
import kr.or.fms.fran.dto.FranVO;
import kr.or.fms.hq.dao.FranListDAO;
import kr.or.fms.hq.dao.LogisListDAO;
import kr.or.fms.hq.service.ComListService;
import kr.or.fms.logis.dto.LogisVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:kr/or/fms/context/root-context.xml")
@Transactional
public class MokComServiceImpl {
	
	@Autowired
	private ComListService service;
	@Autowired
	private FranListDAO franListDAO;
	@Autowired
	private LogisListDAO logisListDAO;
	
	@Test
	public void franList() throws SQLException {
		SearchCriteria cri = new SearchCriteria();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> franMap = service.getFranList(cri);
		List<FranVO> franList= (List<FranVO>) franMap.get("franList");
		PageMaker pageMaker1 = (PageMaker) franMap.get("pageMaker1");
		Map<String, Object> logisMap = service.getLogisList(cri);
		List<LogisVO> logisList= (List<LogisVO>) logisMap.get("logisList");
		PageMaker pageMaker2 = (PageMaker) logisMap.get("pageMaker2");
		
		dataMap.put("franList", franList);
		List<LogisVO> list = (List<LogisVO>) dataMap.get("franList");
		System.out.println(list.size());
		dataMap.put("pageMaker1", pageMaker1);
		
	}
	@Test
	public void logisList() throws SQLException {
		SearchCriteria cri = new SearchCriteria();
		Map<String, Object> logisMap = service.getLogisList(cri);
		List<LogisVO> logisList= (List<LogisVO>) logisMap.get("logisList");
		PageMaker pageMaker = (PageMaker) logisMap.get("pageMaker2");
//		System.out.println(pageMaker.getEndPage());
		Assert.assertEquals(10, logisList.size());
//		System.out.println(logisList.size());
	}

}
