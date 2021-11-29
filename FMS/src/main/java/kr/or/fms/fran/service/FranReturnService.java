package kr.or.fms.fran.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.dto.AttachVO;
import kr.or.fms.dto.ReturnDetailVO;
import kr.or.fms.dto.ReturnVO;
import kr.or.fms.hq.dto.HqGoodsVO;

public interface FranReturnService {
	
	// 목록조회	
	Map<String,Object> getReturnList(SearchCriteria cri)throws SQLException;
	
	// 상세보기
	ReturnVO getReturn(String return_code)throws SQLException;
	
	// 수정
	void modify(ReturnVO returnVO)throws SQLException;
	void updateFranReturn(ReturnVO returnVO)throws SQLException;
	void updateFranReturnDe(ReturnDetailVO returnDeVO)throws SQLException;
	// 가맹점반품신청등록
	void registFranReturn(ReturnVO returnVO) throws SQLException;
	void registFranReturnDe(ReturnDetailVO returnDeVO) throws SQLException;
	
	void deleteFranReturnModi(String attach_no)throws SQLException;
	// 물품 검색
	List<HqGoodsVO> getGoodsList(String goods) throws SQLException;
	
	//첨부파일 조회
	List<AttachVO> getAttachByAttach_no(String attach_no)throws SQLException;
	//첨부파일 조회
	AttachVO getAttachByAno(String attach_no)throws SQLException;
	
	
	//파일정보 삭제
	void removeAttachByAttach_no(String attach_no)throws SQLException;
	
	//가장최근 return_seq 가져오기
	String getSeqCurrValue() throws SQLException;
	
	// 글읽기(조회수증가)
	ReturnVO read(String return_code) throws SQLException;
	
	public AttachVO selectAttachDownload(String attach_no)throws SQLException;
	
	// 글삭제
	void remove(String return_code) throws SQLException;
	
	
	



}
