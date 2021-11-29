package kr.or.fms.fran.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.fms.command.PageMaker;
import kr.or.fms.command.SearchCriteria;
import kr.or.fms.fran.dao.FranOrderManagerDAO;
import kr.or.fms.fran.dto.FranOrderDe;
import kr.or.fms.fran.dto.FranOrderVO;

public class FranOrderManagerServiceImpl implements FranOrderManageService {
	
	private FranOrderManagerDAO franOrderManagerDAO;
	public void setFranOrderManagerDAO(FranOrderManagerDAO franOrderManagerDAO) {
		this.franOrderManagerDAO = franOrderManagerDAO;
	}

	@Override
	public Map<String, Object> getOrderList(SearchCriteria cri) throws SQLException {
		
		/** 조회 파라미터 구성 */
		
		/** 반환타입 객체구성 */
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		/** 서비스 로직 구성 */
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(12);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(franOrderManagerDAO.getOrderListCount(cri));
		dataMap.put("pageMaker", pageMaker);
		
		List<FranOrderVO> orderList = franOrderManagerDAO.getOrderList(cri);
		if(orderList != null) {
			dataMap.put("orderList", orderList);
		}
		return dataMap;
	}

	@Override
	public List<FranOrderDe> getOrderDetail(String orderCode) throws SQLException {
		List<FranOrderDe> orderDetail = franOrderManagerDAO.getOrderDetail(orderCode);
		return orderDetail;
	}

	@Override
	public int delete(String orderCode) throws SQLException {
		int cnt = 0;
		cnt = franOrderManagerDAO.deleteOrder(orderCode);
		return cnt;
	}

	@Override
	public int update(Map<String, String> data) throws SQLException {
		int cnt = 0;
		cnt = franOrderManagerDAO.updateOrder(data);
		return cnt;
	}

}
