package kr.or.fms.hq;

import java.sql.SQLException;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.or.fms.hq.dao.EmpDAO;
import kr.or.fms.hq.dto.HqEmpVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:kr/or/fms/context/root-context.xml")
@Transactional
public class MokComDAOImpl {
	
	@Autowired
	private EmpDAO empDAO;
	
	@Test
	public void selectEmp() throws SQLException {
		String code = "tt";
		String pws = "1";
		HqEmpVO emp = empDAO.selectEmp(code);
		Assert.assertEquals(code, emp.getEmp_no());
		Assert.assertEquals(pws, emp.getEmp_pwd());
	}

}
