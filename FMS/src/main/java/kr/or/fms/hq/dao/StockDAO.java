package kr.or.fms.hq.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.fms.command.Criteria;
import kr.or.fms.command.SearchCriteria;
import kr.or.fms.fran.dto.FranGoodsDeVO;
import kr.or.fms.hq.dto.FranStockVO;
import kr.or.fms.hq.dto.LogisStockTakingVO;
import kr.or.fms.hq.dto.LogisStockVO;
import kr.or.fms.logis.dto.LogisGoodsDeVO;

public interface StockDAO {
	//가맹점재고조회
	List<FranStockVO> franStockList()throws SQLException;
	List<FranStockVO> franStockList(Criteria cri)throws SQLException;
	List<FranStockVO> franStockList(SearchCriteria cri)throws SQLException;
	
	// 검색 결과의 전체 리스트 개수
	int franStockListCount(SearchCriteria cri) throws SQLException;

	//물류센터재고조회
	List<LogisStockVO> logisStockList()throws SQLException;
	List<LogisStockVO> logisStockList(Criteria cri)throws SQLException;
	List<LogisStockVO> logisStockList(SearchCriteria cri)throws SQLException;
	
	// 검색 결과의 전체 리스트 개수
	int logisStockListCount(SearchCriteria cri) throws SQLException;
	
	// 재고실사 조회
	List<LogisStockTakingVO> logisStockTakingList() throws SQLException;
	List<LogisStockTakingVO> logisStockTakingList(Criteria cri) throws SQLException;
	List<LogisStockTakingVO> logisStockTakingList(SearchCriteria cri) throws SQLException;

	int franStockTakingListCount(SearchCriteria cri) throws SQLException;
	List<LogisStockTakingVO> getLogisStockTakingDetail(String takingCode) throws SQLException;
	
	
	//가맹점 안전/적정 재고량 설정
	void updateFranSafeSuit(FranStockVO franStockVO) throws SQLException;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//물류센터재고조회(LWH)
	List<LogisStockVO> logisStock()throws SQLException;
	List<LogisStockVO> logisStock(Criteria cri)throws SQLException;
	List<LogisStockVO> logisStock(SearchCriteria cri)throws SQLException;
	
	// 검색 결과의 전체 리스트 개수
	int logisStockCount(SearchCriteria cri) throws SQLException;

	
}
