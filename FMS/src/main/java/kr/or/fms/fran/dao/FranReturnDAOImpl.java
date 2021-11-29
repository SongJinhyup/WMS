package kr.or.fms.fran.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.dto.ReturnDetailVO;
import kr.or.fms.dto.ReturnVO;
import kr.or.fms.hq.dto.HqGoodsVO;

public class FranReturnDAOImpl implements FranReturnDAO {
	
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
				session.selectList("FrReturn-Mapper.selectFranReturnList",cri,rowBounds);
		
		return boardList;
	}

	@Override
	public int selectBoardCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count=session.selectOne("FrReturn-Mapper.selectSearchReturnListCount",cri);
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public ReturnVO selectReturnByReturn_code(String return_code) throws SQLException {
		ReturnVO returnDetail = session.selectOne("FrReturn-Mapper.selectReturnDetail", return_code);
		return returnDetail;
	}
	
	@Override
	public void insertFranReturn(ReturnVO returnVO) throws SQLException {
		session.update("FrReturn-Mapper.insertFranReturn",returnVO);
		
	}
	@Override
	public void updateFranReturn(ReturnVO returnVO) throws SQLException {
		session.update("FrReturn-Mapper.updateFranReturn",returnVO);
		
	}

	@Override
	public void updateFranReturnDe(ReturnDetailVO returnDeVO) throws SQLException {
		session.update("FrReturn-Mapper.updateFranReturnDe",returnDeVO);

	}

	@Override
	public void deleteFranReturn(String return_code) throws SQLException {
		session.update("FrReturn-Mapper.deleteFranReturn",return_code);
		
	}

	@Override
	public void increaseViewCnt(int pno) throws SQLException {
		session.update("FrReturn-Mapper.increaseViewCnt",pno);
		
	}

	@Override
	public int getSeqNextValue() throws SQLException {
		int attachSeq=session.selectOne("FrReturn-Mapper.selectReturnSeqNext");
		return attachSeq;
	}

	@Override
	public List<HqGoodsVO> selectGoodsList(String goods) throws SQLException {

		List<HqGoodsVO> goodsList = session.selectList("FrReturn-Mapper.selectGoodsList", goods);
		
		return goodsList;
	}

	@Override
	public void insertFranReturnDe(ReturnDetailVO returnDeVO) throws SQLException {
		session.update("FrReturn-Mapper.insertFranReturnDe",returnDeVO);
		
	}

	@Override
	public String getSeqCurrValue() throws SQLException {
		String return_code = session.selectOne("FrReturn-Mapper.selectReturnSeqCurr");
		return return_code;
	}

	

}
