package kr.or.fms.fran.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.fran.dto.FranGoodsDeVO;
import kr.or.fms.fran.dto.FranOrderDeVO;
import kr.or.fms.fran.dto.FranOrderVO;
import kr.or.fms.fran.dto.FranVO;
import kr.or.fms.hq.dto.HqGoodsVO;

public interface FranOrderDAO {

	//발주상품리스트(페이징,검색)
	List<HqGoodsVO> orderGoodsCriteriaList(SearchCriteria cri, String fran_local_num) throws SQLException;
	
	//발주리스트개수
	int selectOrderGoodsCount(SearchCriteria cri)throws SQLException;
	
	//대분류콤보박스
	List<String> selectLaca() throws SQLException;
	//소분류콤보박스
	List<String> selectSmca() throws SQLException;
	//대분류 적용시 소분류
	List<String> searchSmca(String sup_goods_laca)throws SQLException;
	
	//검색적용한 발주상품리스트
	List<HqGoodsVO> searchOrderList(HqGoodsVO hqGoods)throws SQLException; 
	
	//발주상품리스트
//	List<HqGoodsVO> orderGoodsList() throws SQLException;
	
	//발주요청시 발주등록
	void insertOrder(FranOrderVO franOrder) throws SQLException;
	//발주요청시 발주상세등록
	void insertOrderDe(FranOrderDeVO franOrderDe) throws SQLException;
	//발주코드 가져오기
	String selectFranOrderCode()throws SQLException;
	
	//총알발주가능수량
	List<FranOrderDeVO> availableNumWh(FranOrderDeVO franOrderDe)throws SQLException;
	
	// 추천 발주 리스트
	List<FranGoodsDeVO> selectRecList(FranVO fran) throws SQLException;
}

