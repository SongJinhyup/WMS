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
import kr.or.fms.fran.dao.FranReturnDAO;
import kr.or.fms.fran.dto.FranVO;
import kr.or.fms.sup.dto.SupGoodsVO;
import kr.or.fms.sup.dto.SupVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:kr/or/fms/context/root-context.xml")
@Transactional
public class MokAttachNo {
	
	@Autowired
	private FranReturnDAO franReturnDAO;
	
	@Test
	public void selectEmp() throws SQLException {
		String attachSeq = franReturnDAO.getSeqCurrValue();
		int attachNo = Integer.parseInt(attachSeq.substring(3));
		System.out.println("attachNo : "+ attachNo);
	}

}
