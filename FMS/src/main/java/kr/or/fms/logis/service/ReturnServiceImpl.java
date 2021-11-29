package kr.or.fms.logis.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.fms.command.PageMaker;
import kr.or.fms.command.SearchCriteria;
import kr.or.fms.dto.ReturnVO;
import kr.or.fms.logis.dao.ReturnDAO;

public class ReturnServiceImpl implements ReturnService {
	
	private ReturnDAO returnDAO;
	public void setReturnDAO(ReturnDAO returnDAO) {
		this.returnDAO = returnDAO;
	}

	@Override
	public Map<String, Object> getReturnList(SearchCriteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		List<ReturnVO> returnList = returnDAO.selectBoardCriteria(cri);

		// 전체 board 개수
		int totalCount = returnDAO.selectBoardCriteriaTotalCount(cri);

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("returnList", returnList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;

	}

	@Override
	public ReturnVO getReturn(String rcode) throws SQLException {
		
		ReturnVO returnDetail = returnDAO.selectBoardByRcode(rcode);
		return returnDetail;

	}

	@Override
	public void modify(ReturnVO returnVO) throws SQLException {
		
		returnDAO.updateReturnSt(returnVO);
		
	}

}
