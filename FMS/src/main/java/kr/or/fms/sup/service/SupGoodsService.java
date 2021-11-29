package kr.or.fms.sup.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.sup.dto.SupGoodsVO;

public interface SupGoodsService {

	//목록조회
	Map<String, Object> getSupGoodsList(SearchCriteria cri, HttpSession session)throws SQLException;
	
	//목록조회
	Map<String, Object> getSupGoodsListBySupCode(String sup_code)throws SQLException;
	
	//분류
	Map<String, Object> getGoodsClass()throws SQLException;
	
	//대분류 검색시 대분류에 맞는 소분류 출력
	List<String> searchSmca(String sup_goods_laca)throws SQLException;

	//물품상세보기
	SupGoodsVO getSupGoods(String sup_goods_code) throws SQLException;
	
	//개별등록
	void regist(SupGoodsVO supGoods)throws SQLException;
	
	//일괄등록
	void allRegist(List<SupGoodsVO> supGoodsList)throws SQLException;
	
	//수정
	void modify(SupGoodsVO supGoods)throws SQLException;
	
	//엑셀등록
//	public List<?> getExcelUpload(String excelFile);
}
