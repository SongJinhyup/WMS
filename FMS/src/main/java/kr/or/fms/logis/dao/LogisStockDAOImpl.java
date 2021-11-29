package kr.or.fms.logis.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.logis.dto.LStockTakingVO;
import kr.or.fms.logis.dto.LStockVO;
import kr.or.fms.logis.dto.LogisWhVO;

public class LogisStockDAOImpl implements LogisStockDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}

	@Override
	public List<LStockVO> selectStockCriteria(SearchCriteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<LStockVO> logisList = session.selectList("LStock-Mapper.selectSearchStockList",cri, rowBounds);
		return logisList;
		
	}
	
	@Override
	public int selectStockCriteriaTotalCount(SearchCriteria cri) throws SQLException {
	
		int count=session.selectOne("LStock-Mapper.selectSearchStockListCount",cri);
		return count;
		
	}
	//콤보박스용 창고
	@Override
	public List<LogisWhVO> selectWhCombo(String logis_code) throws SQLException {
		List<LogisWhVO> whCombo = session.selectList("LStock-Mapper.whCombo", logis_code);
		return whCombo;
	}

	@Override
	public List<String> selectLaca() throws SQLException {
		List<String> lacaCombo = session.selectList("LStock-Mapper.lacaCombo");
		return lacaCombo;
	}

	@Override
	public List<String> selectSmca() throws SQLException {
		List<String> smcaCombo = session.selectList("LStock-Mapper.smcaCombo");
		return smcaCombo;
	}

	@Override
	public List<LogisWhVO> selectStockByHq_goods_code(LogisWhVO logisWhVO) throws SQLException {
		List<LogisWhVO> logisWh = session.selectList("LStock-Mapper.selectStockByHq_goods_code", logisWhVO);
		return logisWh;
	}
	
	@Override
	public void updateStock(LogisWhVO logisWhVO) throws SQLException {
		session.update("LStock-Mapper.updateStock", logisWhVO);
		
	}

	@Override
	public List<LStockTakingVO> selectStockTakingCriteria(SearchCriteria cri) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<LStockTakingVO> takingList = session.selectList("LStock-Mapper.selectSearchTakingList",cri, rowBounds);
		return takingList;
	}

	@Override
	public int selectStockTakingCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count=session.selectOne("LStock-Mapper.selectSearchTakingListCount",cri);
		return count;
	}

	@Override
	public List<LStockTakingVO> selectTakingCodeDetailCriteria(SearchCriteria cri) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<LStockTakingVO> detailList = session.selectList("LStock-Mapper.selectTakingCodeDetail",cri, rowBounds);
		return detailList;
	}

	@Override
	public int selectTakingCodeDetailCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count=session.selectOne("LStock-Mapper.selectTakingCodeDetailCriteriaTotalCount",cri);
		return count;
	}

	@Override
	public List<LStockTakingVO> selectStockByTaking_code(LStockTakingVO takingVO) throws SQLException {
		List<LStockTakingVO> detailList = session.selectList("LStock-Mapper.selectTakingCodeDetail", takingVO);
		return detailList;
	}

	@Override
	public int takingSeqNext() throws SQLException {
		int seq = 0;
		seq = session.selectOne("LStock-Mapper.takingSeqNext");
		return seq;
	}

	@Override
	public int takingSeqCurr() throws SQLException {
		int seq = 0;
		seq = session.selectOne("LStock-Mapper.takingSeqCurrent");
		return seq;
	}
	
	@Override
	public void registTakingTempDetail(Map<String, String> data) throws SQLException {
		session.update("LStock-Mapper.registTakingTempDetail", data);
	}

	@Override
	public void updateTakingTempDetail(Map<String, String> data) throws SQLException {
		session.update("LStock-Mapper.updateTakingTempDetail", data);
	}
	
	@Override
	public void registTaking(Map<String, String> data) throws SQLException {
		int update = session.update("LStock-Mapper.takingFinish", data);
	}

	@Override
	public void updateStockByTaking(Map<String, String> data) throws SQLException {
		int update = session.update("LStock-Mapper.updateStockByTaking", data);
		
	}
}
