package kr.or.fms.fran.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.fms.command.PageMaker;
import kr.or.fms.command.SearchCriteria;
import kr.or.fms.fran.dao.FranOrderDAO;
import kr.or.fms.fran.dto.FranGoodsDeVO;
import kr.or.fms.fran.dto.FranOrderDeVO;
import kr.or.fms.fran.dto.FranOrderVO;
import kr.or.fms.fran.dto.FranVO;
import kr.or.fms.hq.dto.HqGoodsVO;

public class FranOrderServiceImpl implements FranOrderService {

	private FranOrderDAO franOrderDAO;
	public void setFranOrderDAO(FranOrderDAO franOrderDAO) {
		this.franOrderDAO = franOrderDAO;
	}

	
	@Override
	public Map<String, Object> getOrderGoodsSearchList(SearchCriteria cri,String fran_local_num) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		//현재 페이지 번호에 맞는 리스트를 perPageNum 개수만큼 가져오기
		List<HqGoodsVO> orderGoodsList = franOrderDAO.orderGoodsCriteriaList(cri, fran_local_num);
		
		//전체 list개수
//		int totalCount = franOrderDAO.selectOrderGoodsCount(cri);
		
		//대분류, 소분류
		List<String> lacaList = franOrderDAO.selectLaca();
		List<String> smcaList = franOrderDAO.selectSmca();
		
		//페이지메이커 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("orderGoodsList", orderGoodsList);
//		dataMap.put("pageMaker", pageMaker);
		dataMap.put("lacaList", lacaList);
		dataMap.put("smcaList", smcaList);
		
		return dataMap;
		
	}

	@Override
	public List<HqGoodsVO> getSearchOrderList(HqGoodsVO hqGoods) throws SQLException {
		
		//검색적용 list
		List<HqGoodsVO> searchGoodsList = franOrderDAO.searchOrderList(hqGoods);
		return searchGoodsList;
	}

	@Override
	public List<String> getLaca() throws SQLException {
		List<String> lacaList = franOrderDAO.selectLaca();
		return lacaList;
	}


	@Override
	public List<String> getSmca() throws SQLException {
		List<String> smcaList = franOrderDAO.selectSmca();
		return smcaList;
	}
	
	@Override
	public List<String> searchSmca(String sup_goods_laca) throws SQLException {
		List<String> searchSmcaList = franOrderDAO.searchSmca(sup_goods_laca);
		return searchSmcaList;
	}


	@Override
	public void registFranOrder(FranOrderVO franOrder) throws SQLException {
		franOrderDAO.insertOrder(franOrder);
	}

	@Override
	public void registFranOrderDe(FranOrderDeVO franOrderDe) throws SQLException {
		franOrderDAO.insertOrderDe(franOrderDe);
	}

	@Override
	public String getFranOrderCode() throws SQLException {
		String fran_order_code = franOrderDAO.selectFranOrderCode();
		return fran_order_code;
	}


	@Override
	public List<FranGoodsDeVO> getRecList(FranVO fran) throws SQLException {
		List<FranGoodsDeVO> recList = franOrderDAO.selectRecList(fran);
		
		return recList;
	}
	

}
