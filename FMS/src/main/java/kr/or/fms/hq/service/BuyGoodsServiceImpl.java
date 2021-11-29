package kr.or.fms.hq.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.fms.command.PageMaker;
import kr.or.fms.command.SearchCriteria;
import kr.or.fms.hq.dao.BuyGoodsDAO;
import kr.or.fms.hq.dto.BuyGoodsDeVO;
import kr.or.fms.hq.dto.BuyGoodsVO;
import kr.or.fms.hq.dto.HqGoodsVO;
import kr.or.fms.logis.dto.LogisVO;
import kr.or.fms.sup.dao.SupGoodsDAO;
import kr.or.fms.sup.dto.SupGoodsVO;

public class BuyGoodsServiceImpl implements BuyGoodsService {

	private BuyGoodsDAO buyGoodsDAO;
	public void setBuyGoodsDAO(BuyGoodsDAO buyGoodsDAO) {
		this.buyGoodsDAO = buyGoodsDAO;
	}
	private SupGoodsDAO supGoodsDAO;
	public void setSupGoodsDAO(SupGoodsDAO supGoodsDAO) {
		this.supGoodsDAO = supGoodsDAO;
	}
	
	@Override
	public Map<String, Object> getSupGoodsSearchList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		//현재 page번호에 맞는 리스트를 perPageNum 개수만큼 가져오기
		List<SupGoodsVO> buyGoodsList = buyGoodsDAO.selectBuyGoodsCriteria(cri);
		
		//전체리스트개수
		int totalCount = buyGoodsDAO.selectBuyGoodsCriteriaTotalCount(cri);
		
		List<String> lacaList = buyGoodsDAO.selectLaca();
		List<String> smcaList = buyGoodsDAO.selectSmca();
		
		//pageMaker생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("buyGoodsList", buyGoodsList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("lacaList", lacaList);
		dataMap.put("smcaList", smcaList);
		
		return dataMap;
		
	}
	
	//대분류
	@Override
	public List<String> getLaca() throws SQLException {
		List<String> lacaList = buyGoodsDAO.selectLaca();
		return lacaList;
	}
	//소분류
	@Override
	public List<String> getSmca() throws SQLException {
		List<String> smcaList = buyGoodsDAO.selectSmca();
		return smcaList;
	}
	
	@Override
	public List<LogisVO> searchLogis() throws SQLException {
		List<LogisVO> logisList = buyGoodsDAO.searchLogis();
		return logisList;
	}

	@Override
	public List<String> searchSmca(String sup_goods_laca) throws SQLException {
		List<String> searchSmcaList = buyGoodsDAO.searchSmca(sup_goods_laca);
		return searchSmcaList;
	}
	
	@Override
	public List<SupGoodsVO> getCompareGoodsList(SupGoodsVO supGoodsVO) throws SQLException {
		List<SupGoodsVO> compareGoodsList = buyGoodsDAO.selectCompareGoods(supGoodsVO);
		return compareGoodsList;
	}

	@Override
	public void registBuyGoods(BuyGoodsVO buyGoods) throws SQLException {
		buyGoodsDAO.insertBuyGoods(buyGoods);
	}

	@Override
	public String getPurCode() throws SQLException {
		String purCode = buyGoodsDAO.selectPurCode();
		return purCode;
	}
	
	@Override
	public void registBuyGoodsDe(BuyGoodsDeVO buyGoodsDe) throws SQLException {
		buyGoodsDAO.insertBuyGoodsDe(buyGoodsDe);
	}

	@Override
	public void updateBuyGoods(BuyGoodsVO buyGoods) throws SQLException {
		buyGoodsDAO.updateBuyGoods(buyGoods);
	}

	@Override
	public void registHqGoods(HqGoodsVO hqGoods) throws SQLException {
		buyGoodsDAO.insertHqGoods(hqGoods);
	}

	@Override
	public SupGoodsVO getBuyGoodsByCode(String sup_goods_code) throws SQLException {
		SupGoodsVO supGoods = buyGoodsDAO.supGoods(sup_goods_code);
		return supGoods;
	}

	@Override
	public String getSupContSt(String sup_goods_code) throws SQLException {
		String supContSt = buyGoodsDAO.supContSt(sup_goods_code);
		return supContSt;
	}


	
	

}
