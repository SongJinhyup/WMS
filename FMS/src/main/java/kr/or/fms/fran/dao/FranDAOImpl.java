package kr.or.fms.fran.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.fran.dto.FranContractInfoVO;
import kr.or.fms.fran.dto.FranDealVO;
import kr.or.fms.fran.dto.FranVO;
import kr.or.fms.hq.dto.HqEmpVO;
import kr.or.fms.hq.dto.HqGoodsVO;

public class FranDAOImpl implements FranDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	//가맹점 정보조회
	@Override
	public FranContractInfoVO selectFranInfo(String fran_code) throws SQLException {
		FranContractInfoVO franContInfo = session.selectOne("Fran-Mapper.selectFranCont", fran_code);
		return franContInfo;
	}

	//가맹점 조회
	@Override
	public FranVO selectFranBycode(String fran_code) throws SQLException {
		FranVO fran = session.selectOne("Fran-Mapper.selectFranByCode", fran_code);
		return fran;
	}

	@Override
	public HqEmpVO selectFranEmp(String fran_code) throws SQLException {
		HqEmpVO hqEmp = session.selectOne("Fran-Mapper.selectFranEmp", fran_code);
		return hqEmp;
	}

	//주변가맹점 list
	@Override
	public List<FranVO> selectNearFran(FranVO fran) throws SQLException {
		List<FranVO> selectNearFran = session.selectList("FranToFran-Mapper.searchNearFran", fran);
		return selectNearFran;
	}

	//재고요청할 물품조회
	@Override
	public List<HqGoodsVO> searchGoods(SearchCriteria cri) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);	
		
		List<HqGoodsVO> searchGoodsList = session.selectList("FranToFran-Mapper.searchGoods", cri, rowBounds);
		return searchGoodsList;
	}
	
	//조회한 물품 총 개수
	@Override
	public int searchGoodsCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("FranToFran-Mapper.searchGoodsCount", cri);
		return count;
	}

	//대분류
	@Override
	public List<String> selectLaca() throws SQLException {
		List<String> lacaCombo = session.selectList("FranToFran-Mapper.lacaCombo");
		return lacaCombo;
	}

	//소분류
	@Override
	public List<String> selectSmca() throws SQLException {
		List<String> smcaCombo = session.selectList("FranToFran-Mapper.smcaCombo");
		return smcaCombo;
	}

	//대분류 적용시 소분류
	@Override
	public List<String> searchSmca(String sup_goods_laca) throws SQLException {
		List<String> searchSmcaList = session.selectList("FranToFran-Mapper.searchSmca", sup_goods_laca);
		return searchSmcaList;
	}


	//가맹점 거래요청 후 리스트(오늘날짜 기준)
	@Override
	public List<FranDealVO> selectFranDealList(String fran_code) throws SQLException {
		List<FranDealVO> franDealList = session.selectList("FranToFran-Mapper.selectFranDeal", fran_code);
		return franDealList;
	}

	
	@Override
	public String getFranDealCode() throws SQLException {
		String dealCode = session.selectOne("FranToFran-Mapper.makeFranDealCode");
		return dealCode;
	}

	//가맹점간거래 insert2
	@Override
	public void insertFranToFran(FranDealVO franDealVO) throws SQLException {
		session.update("FranToFran-Mapper.franToFranDeal", franDealVO);
		
	}
	
	

}
