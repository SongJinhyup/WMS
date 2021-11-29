package kr.or.fms.fran.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.fms.fran.dto.FranDealVO;
import kr.or.fms.fran.dto.FranGoodsDeVO;


public interface FranHomeDAO {
	
	//발주신청
	int selectFranOrderCount(String fran_code )throws SQLException;
	
	//발주완료
	int selectOrderCompletedCount(String fran_code )throws SQLException;
	
	//반품신청
	int selectReturnApplyCount(String fran_code )throws SQLException;
	
	//빈품완료
	int selectReturnCompleteCount(String fran_code )throws SQLException;
	
	//가맹점 재고요청
	int selectStockRequestCount(String fran_code )throws SQLException;
	
	//가맹점 재고 승낙개수
	int selectStockAcceptCount(String fran_code)throws SQLException;

	//가맹점 재고요청 내용 조회(거래내용)
	List<FranDealVO> selectDealList(String fran_code)throws SQLException;
	
	//재고요청 물품 재고조회
	List<FranGoodsDeVO> franGoodsDe(String fran_code) throws SQLException; 
	
	//물품요청 승낙 update
	void acceptDeal(FranDealVO franDealVO)throws SQLException;
	
	//물품요청 승낙 시 타 가맹점 재고요청 취소
	void cancelDeal(FranDealVO franDealVO)throws SQLException;
	
	//물품요청 거절
	void denyDeal(FranDealVO franDealVO)throws SQLException;
	
}
