package kr.or.fms.sup.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.hq.dto.BuyGoodsVO;
import kr.or.fms.hq.dto.InVO;

public interface SupSalesDAO {
	
	List<BuyGoodsVO> selectBoardCriteria(SearchCriteria cri) throws SQLException;
	
	int selectBoardCriteriaTotalCount(SearchCriteria cri) throws SQLException;
	
	void updateBuySt(String bCode) throws SQLException;
	
	void insertInList(InVO inVO) throws SQLException;

}
