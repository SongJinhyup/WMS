package kr.or.fms.hq.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.fran.dto.FranNoticeVO;
import kr.or.fms.hq.dto.FranAppliDetailVO;
import kr.or.fms.hq.dto.FranAppliVO;

public class AppliDAOImpl implements AppliDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}

	@Override
	public List<FranAppliDetailVO> selectAppliCriteria(SearchCriteria cri) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<FranAppliDetailVO> appliList=
				session.selectList("FranAppli-Mapper.selectSearchAppliList",cri,rowBounds);
		
		return appliList;
	}

	@Override
	public int selectAppliCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count=session.selectOne("FranAppli-Mapper.selectSearchAppliListCount",cri);
		return count;
	}

	@Override
	public FranAppliDetailVO selectAppliByFran_applidoc_code(String fran_applidoc_code) throws SQLException {
		FranAppliDetailVO appli=
				session.selectOne("FranAppli-Mapper.selectAppliByFran_applidoc_code", fran_applidoc_code);
		return appli;
	}

	@Override
	public void updateFranRegSt(FranAppliVO franAppli) throws SQLException {

		session.update("FranAppli-Mapper.updateFranRegSt", franAppli);
	}

	@Override
	public void updateFranAppliApprSt(FranAppliVO franAppli) throws SQLException {
		session.update("FranAppli-Mapper.updateFran_applidoc_appr_St", franAppli);
		
	}

	@Override
	public void insertBoard(FranNoticeVO frannotice) throws SQLException {
		session.update("FranAppli-Mapper.insertFranNotice", frannotice);
		
	}

}
