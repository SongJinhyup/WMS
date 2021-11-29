package kr.or.fms.hq.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.dto.ReturnVO;

public class HqReturnDAOImpl implements HqReturnDAO {
	
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
				session.selectList("HqReturn-Mapper.selectFranReturnList",cri,rowBounds);
		
		return boardList;
	}

	@Override
	public int selectBoardCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count=session.selectOne("HqReturn-Mapper.selectSearchReturnListCount",cri);
		return count;
	}

	
	@Override
	public ReturnVO selectReturnByReturn_code(String return_code) throws SQLException {
		ReturnVO returnDetail = session.selectOne("HqReturn-Mapper.selectReturnDetail", return_code);
		return returnDetail;
	}

	
	@Override
	public void updateReturnCheckSt(ReturnVO returnVO) throws SQLException {
		
		session.update("HqReturn-Mapper.updateReturnCheckSt", returnVO);
		
	}

}
