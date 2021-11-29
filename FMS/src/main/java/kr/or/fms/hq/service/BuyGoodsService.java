package kr.or.fms.hq.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.hq.dto.BuyGoodsDeVO;
import kr.or.fms.hq.dto.BuyGoodsVO;
import kr.or.fms.hq.dto.HqGoodsVO;
import kr.or.fms.logis.dto.LogisVO;
import kr.or.fms.sup.dto.SupGoodsVO;

public interface BuyGoodsService {

	//목록검색
	Map<String, Object> getSupGoodsSearchList(SearchCriteria cri) throws SQLException;
	//대분류콤보박스
	List<String> getLaca() throws SQLException;
	//소분류콤보박스
	List<String> getSmca() throws SQLException;
	
	//대분류에 포함된 소분류 출력
	List<String> searchSmca(String sup_goods_laca)throws SQLException;
	
	//물류센터 선택지출력
	List<LogisVO> searchLogis()throws SQLException;
	
	//상품상세비교
	List<SupGoodsVO> getCompareGoodsList(SupGoodsVO supGoodsVO)throws SQLException;
	
	//상품하나 조회
	SupGoodsVO getBuyGoodsByCode(String sup_goods_code)throws SQLException;
	
	//공급업체 본사와의 계약상태
	String getSupContSt(String sup_goods_code)throws SQLException;
	
	//구매등록
	void registBuyGoods(BuyGoodsVO buyGoods) throws SQLException;
	//구매테이블 pur_code가져오기
	String getPurCode()throws SQLException;
	//구매상세등록
	void registBuyGoodsDe(BuyGoodsDeVO buyGoodsDe)throws SQLException;
	
	//구매업데이트
	void updateBuyGoods(BuyGoodsVO buyGoods) throws SQLException;
	
	//본사물품등록
	void registHqGoods(HqGoodsVO hqGoods)throws SQLException;
	
}
