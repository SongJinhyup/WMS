package kr.or.fms.fran.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.fms.command.PageMaker;
import kr.or.fms.command.SearchCriteria;
import kr.or.fms.fran.dao.FranDAO;
import kr.or.fms.fran.dto.FranContractInfoVO;
import kr.or.fms.fran.dto.FranDealVO;
import kr.or.fms.fran.dto.FranVO;
import kr.or.fms.hq.dao.BuyGoodsDAO;
import kr.or.fms.hq.dto.HqEmpVO;
import kr.or.fms.hq.dto.HqGoodsVO;

public class FranServiceImpl implements FranService {

	private FranDAO franDAO;
	public void setFranDAO(FranDAO franDAO) {
		this.franDAO = franDAO;
	}
	
	@Override
	public FranContractInfoVO getFranContInfo(String fran_code) throws SQLException {
		FranContractInfoVO franContInfo = franDAO.selectFranInfo(fran_code);
		return franContInfo;
	}

	@Override
	public FranVO getFran(String fran_code) throws SQLException {
		FranVO fran = franDAO.selectFranBycode(fran_code);
		return fran;
	}

	@Override
	public HqEmpVO getFranEmp(String fran_code) throws SQLException {
		HqEmpVO emp = franDAO.selectFranEmp(fran_code);
		return emp;
	}

	@Override
	public List<FranVO> getNearFranList(FranVO fran) throws SQLException {
		List<FranVO> nearFranList = franDAO.selectNearFran(fran);
		return nearFranList;
	}

	@Override
	public Map<String, Object> getSearchGoods(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		//물품 list가져오기
		List<HqGoodsVO> goodsList = franDAO.searchGoods(cri);
		//list 총 개수
		int totalCount = franDAO.searchGoodsCount(cri);
		
		List<String> lacaList = franDAO.selectLaca();
		List<String> smcaList = franDAO.selectSmca();
		
		//pageMaker생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("goodsList", goodsList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("lacaList", lacaList);
		dataMap.put("smcaList", smcaList);
		
		return dataMap;
		
	}
	//대분류
	@Override
	public List<String> getLaca() throws SQLException {
		List<String> lacaList = franDAO.selectLaca();
		return lacaList;
	}
	//소분류
	@Override
	public List<String> getSmca() throws SQLException {
		List<String> smcaList = franDAO.selectSmca();
		return smcaList;
	}
	
	//대분류 적용시 소분류
	@Override
	public List<String> searchSmca(String sup_goods_laca) throws SQLException {
		List<String> searchSmcaList = franDAO.searchSmca(sup_goods_laca);
		return searchSmcaList;
	}
	
	//가맹점 거래요청 list(오늘날짜 기준)
	@Override
	public List<FranDealVO> getFranDealList(String fran_code) throws SQLException {
		List<FranDealVO> franDealList = franDAO.selectFranDealList(fran_code);
		return franDealList;
		
	}

	@Override
	public String franDealCode() throws SQLException {
		String franDealCode = franDAO.getFranDealCode();
		return franDealCode;
	}
	//가맹점 거래요청 insert2
	@Override
	public void reegistFranDeal(FranDealVO franDealVO) throws SQLException {
		franDAO.insertFranToFran(franDealVO);
		
	}
}
