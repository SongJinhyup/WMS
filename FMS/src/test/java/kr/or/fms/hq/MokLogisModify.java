package kr.or.fms.hq;

import java.sql.SQLException;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.or.fms.hq.dao.LogisListDAO;
import kr.or.fms.logis.dto.LogisVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:kr/or/fms/context/root-context.xml")
@Transactional
public class MokLogisModify {
	
	@Autowired
	private LogisListDAO logisListDAO;
	
	@Rollback
	@Test
	public void selectEmp() throws SQLException {
		LogisVO logis = new LogisVO();
		logis.setLogis_code("L008");
		logis.setLogis_local_num("044");
		logis.setLogis_name("일이공돈까스");
		logis.setLogis_owner("일이공");
		logis.setLogis_tel("043-1234-1234");
		logis.setLogis_email("gas@gamil.com");
		logis.setLogis_business_no("11");
		logis.setLogis_zip(1245);
		logis.setLogis_addr("울릉도동남쪽뱃길따라 200리");
		logis.setLogis_detail_addr("외로운 섬하나 새들의 고향");
		logis.setLogis_contract_st("1");
		logis.setLogis_reg_st("1");
		int i = logisListDAO.updateLogis(logis);
		System.out.println(i);
	}

}
