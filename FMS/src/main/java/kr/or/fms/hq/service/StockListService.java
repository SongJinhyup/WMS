package kr.or.fms.hq.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.fms.command.Criteria;
import kr.or.fms.command.SearchCriteria;
import kr.or.fms.fran.dto.FranGoodsDeVO;
import kr.or.fms.hq.dto.FranStockVO;
import kr.or.fms.hq.dto.LogisStockTakingVO;
import kr.or.fms.hq.dto.LogisStockVO;
import kr.or.fms.logis.dto.LogisGoodsDeVO;

public interface StockListService {

	// 가맹점재고리스트조회
	List<FranStockVO> getFranStockList() throws SQLException;
	List<FranStockVO> getFranStockList(Criteria cri) throws SQLException;
	Map<String, Object> getFranStockList(SearchCriteria cri) throws SQLException;
	// 가맹점검색조회
	Map<String, Object> getFranStockSearch(SearchCriteria cri) throws SQLException;

	//가맹점 안전/적정 재고량 설정
	void ModifyFranSafeSuit(FranStockVO franStockVO) throws SQLException;
	
	// 물류센터재고리스트조회
	List<LogisStockVO> getLogisStockList() throws SQLException;
	List<LogisStockVO> getLogisStockList(Criteria cri) throws SQLException;
	Map<String, Object> getLogisStockList(SearchCriteria cri) throws SQLException;
	// 물류센터검색조회
	Map<String, Object> getLogisStockSearch(SearchCriteria cri) throws SQLException;

	
	// 재고실사 조회
	List<LogisStockTakingVO> getLogisStockTakingList() throws SQLException;
	List<LogisStockTakingVO> getLogisStockTakingList(Criteria cri) throws SQLException;
	Map<String, Object> getLogisStockTakingList(SearchCriteria cri) throws SQLException;
	// 재고실사 검색
	Map<String, Object> getLogisStockTakingSearchList(SearchCriteria cri) throws SQLException;
	
	// 재고실사 조회
	List<LogisStockTakingVO> getLogisStockTakingDetail(String takingCode) throws SQLException;

///////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 물류센터재고리스트조회
	List<LogisStockVO> getLogisStock() throws SQLException;
	List<LogisStockVO> getLogisStock(Criteria cri) throws SQLException;
	Map<String, Object> getLogisStock(SearchCriteria cri) throws SQLException;
	// 물류센터검색조회
	Map<String, Object> getLogisStockSearch2(SearchCriteria cri) throws SQLException;

}
