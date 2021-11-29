package kr.or.fms.logis.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.dto.ReturnVO;

public class ReturnDAOImpl implements ReturnDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<ReturnVO> selectBoardCriteria(SearchCriteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<ReturnVO> boardList=
				session.selectList("Return-Mapper.selectReturnList",cri,rowBounds);
		
		return boardList;
	}

	@Override
	public int selectBoardCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count=session.selectOne("Return-Mapper.selectSearchReturnListCount",cri);
		return count;
	}

	@Override
	public ReturnVO selectBoardByRcode(String rcode) throws SQLException {
		
		ReturnVO returnDetail = session.selectOne("Return-Mapper.selectReturnDetail", rcode);
		return returnDetail;
		
	}

	@Override
	public void updateReturnSt(ReturnVO returnVO) throws SQLException {
		session.update("Return-Mapper.updateReturnSt", returnVO);
	}
	

}
