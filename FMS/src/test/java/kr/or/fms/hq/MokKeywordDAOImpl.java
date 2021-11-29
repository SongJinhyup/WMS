package kr.or.fms.hq;

import java.sql.SQLException;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.or.fms.dao.KeywordDAO;
import kr.or.fms.hq.dto.HqGoodsVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:kr/or/fms/context/root-context.xml")
@Transactional
public class MokKeywordDAOImpl {
	
	@Autowired
	private KeywordDAO keywordDAO;
	
	@Test
	public void selectEmp() throws SQLException {
		List<String> local = keywordDAO.local();
		for (String string : local) {
			System.out.println(string);
		}
	}

}
