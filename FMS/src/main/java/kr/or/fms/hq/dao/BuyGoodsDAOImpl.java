package kr.or.fms.hq.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.fms.command.SearchCriteria;
import kr.or.fms.hq.dto.BuyGoodsDeVO;
import kr.or.fms.hq.dto.BuyGoodsVO;
import kr.or.fms.hq.dto.HqGoodsVO;
import kr.or.fms.logis.dto.LogisVO;
import kr.or.fms.sup.dto.SupGoodsVO;

public class BuyGoodsDAOImpl implements BuyGoodsDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<SupGoodsVO> selectBuyGoodsCriteria(SearchCriteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<SupGoodsVO> buyGoodsList =
				session.selectList("Buy-Mapper.selectSupGoodsInfoList",cri,rowBounds);
		
		return buyGoodsList;
	}
	
	@Override
	public int selectBuyGoodsCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("Buy-Mapper.selectSearchGoodsListCount", cri);
		return count;
	}
	
	//대분류콤보박스
	@Override
	public List<String> selectLaca() throws SQLException {
		List<String> lacaCombo = session.selectList("Buy-Mapper.lacaCombo");
		return lacaCombo;
	}
	//소분류콤보박스
	@Override
	public List<String> selectSmca() throws SQLException {
		List<String> smcaCombo = session.selectList("Buy-Mapper.smcaCombo");
		return smcaCombo;
	}

	@Override
	public List<SupGoodsVO> selectCompareGoods(SupGoodsVO supGoodsVO) throws SQLException {
		List<SupGoodsVO> compareGoodsList = session.selectList("Buy-Mapper.selectSupInfoCompareList", supGoodsVO);
		return compareGoodsList;
	}
	
	@Override
	public List<String> searchSmca(String sup_goods_laca) throws SQLException {
		List<String> searchSmcaList = session.selectList("Buy-Mapper.searchSmca", sup_goods_laca);
		return searchSmcaList;
	}

	
	@Override
	public void insertBuyGoods(BuyGoodsVO buyGoods) throws SQLException {
		session.update("Buy-Mapper.insertBuyGoods", buyGoods);
	}

	@Override
	public String selectPurCode() throws SQLException {
		String purCode = session.selectOne("Buy-Mapper.selectPurCode");
		return purCode;
	}
	
	@Override
	public void insertBuyGoodsDe(BuyGoodsDeVO buyGoodsDe) throws SQLException {
		session.update("Buy-Mapper.insertBuyGoodsDetail", buyGoodsDe);
	}

	@Override
	public void updateBuyGoods(BuyGoodsVO buyGoods) throws SQLException {
		session.update("Buy-Mapper.updateBuyGoods", buyGoods);
	}

	@Override
	public void insertHqGoods(HqGoodsVO hqGoods) throws SQLException {
		session.update("Buy-Mapper.insertHqGoods", hqGoods);
	}

	@Override
	public SupGoodsVO supGoods(String sup_goods_code) throws SQLException {
		SupGoodsVO supGoods = session.selectOne("Buy-Mapper.selectBuyGoodsByCode", sup_goods_code);
		return supGoods;
	}

	@Override
	public String supContSt(String sup_goods_code) throws SQLException {
		String supContSt = session.selectOne("Buy-Mapper.selectSupContSt", sup_goods_code);
		return supContSt;
	}

	@Override
	public List<LogisVO> searchLogis() throws SQLException {
		List<LogisVO> logisList = session.selectList("Buy-Mapper.selectLogis");
		return logisList;
	}



}
