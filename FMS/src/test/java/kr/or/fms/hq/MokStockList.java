package kr.or.fms.hq;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.or.fms.command.PageMaker;
import kr.or.fms.command.SearchCriteria;
import kr.or.fms.hq.dao.StockDAO;
import kr.or.fms.hq.dto.FranStockVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:kr/or/fms/context/root-context.xml")
@Transactional
public class MokStockList {
	
	@Autowired
	SqlSession session;
	
	@Autowired
	StockDAO stockDAO;
	
	@Test
	public void stockSearchList() throws SQLException {
		SearchCriteria cri = new SearchCriteria();
		Map<String,String> reqMap = new HashMap<>();
		reqMap.put("fms_goods", "매일");
		cri.setKeywordMap(reqMap);
		List<FranStockVO> franStockList = stockDAO.franStockList(cri);
		Assert.assertEquals(3, franStockList.size());
	}
	
	@Test
	public void stockSearchCount() throws SQLException {
		SearchCriteria cri = new SearchCriteria();
		Map<String,String> map = new HashMap<>();
		map.put("fms_goods", "저지방 매일우유");
		cri.setKeywordMap(map);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(stockDAO.franStockListCount(cri));
		System.out.println(pageMaker.getEndPage());
		
	}

}
