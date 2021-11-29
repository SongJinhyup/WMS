package kr.or.fms.logis.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.logis.dto.LStockTakingVO;
import kr.or.fms.logis.dto.LStockVO;
import kr.or.fms.logis.dto.LogisWhVO;

public interface LogisStockDAO {
	
	//물류센터재고조회
	List<LStockVO> selectStockCriteria(SearchCriteria cri)throws SQLException;
	
	// 검색 결과의 전체 리스트 개수
	int selectStockCriteriaTotalCount(SearchCriteria cri) throws SQLException;
	
	//창고콤보박스
	List<LogisWhVO> selectWhCombo(String logis_code) throws SQLException;
	//대분류콤보박스
	List<String> selectLaca() throws SQLException;
	//소분류콤보박스
	List<String> selectSmca() throws SQLException;
	
	List<LogisWhVO> selectStockByHq_goods_code(LogisWhVO logisWhVO) throws SQLException;
	
	void updateStock(LogisWhVO logisWhVO) throws SQLException;
	
	//재고실사
	List<LStockTakingVO> selectStockTakingCriteria(SearchCriteria cri) throws SQLException;
	int selectStockTakingCriteriaTotalCount(SearchCriteria cri) throws SQLException;
	
	//실사코드상세
	List<LStockTakingVO> selectTakingCodeDetailCriteria(SearchCriteria cri) throws SQLException;
	int selectTakingCodeDetailCriteriaTotalCount(SearchCriteria cri) throws SQLException;
	List<LStockTakingVO> selectStockByTaking_code(LStockTakingVO taking_code) throws SQLException;
	
	//실사코드 생성(실사 첫 진행을 위한 코드생성)
	int takingSeqNext() throws SQLException;
	
	//실사코드 받아오기
	int takingSeqCurr() throws SQLException;
	
	//실사 저장
	void registTakingTempDetail(Map<String, String> data) throws SQLException;
	//실사 수정
	void updateTakingTempDetail(Map<String, String> data) throws SQLException;

	//실사 상태 완료 변경
	void registTaking(Map<String, String> data) throws SQLException;

	void updateStockByTaking(Map<String, String> data) throws SQLException;

}
