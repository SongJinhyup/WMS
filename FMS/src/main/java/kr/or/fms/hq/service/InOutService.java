package kr.or.fms.hq.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.fms.command.Criteria;
import kr.or.fms.command.SearchCriteria;
import kr.or.fms.hq.dto.OutVO;

public interface InOutService {
	
	// 출고 조회
	
	List<OutVO> getOutList() throws SQLException;
	List<OutVO> getOutList(Criteria cri) throws SQLException;
	Map<String,Object> getOutList(SearchCriteria cri) throws SQLException;
	
	
	Map<String,Object> getOutSearch(SearchCriteria cri) throws SQLException;
	
	
	// 상세보기
	OutVO getOut(String ocode)throws SQLException;
	
	// 등록
	OutVO regist(OutVO out)throws SQLException;
	
	// 수정
	void modifyOut(OutVO out)throws SQLException;
	//수정화면 상세
	OutVO getOutForModify(String ocode)throws SQLException;
	////////////////////////////////////////////////////////////////////
	// 조회
	List<OutVO> getOutTakingList() throws SQLException;
	List<OutVO> getOutTakingList(Criteria cri) throws SQLException;
	Map<String, Object> getOutTakingList(SearchCriteria cri) throws SQLException;
	
	// 검색
	Map<String, Object> getOutTakingSearchList(SearchCriteria cri) throws SQLException;
	
	// 상세조회
	List<OutVO> getOutTakingDetail(String ocode) throws SQLException;
	
}
