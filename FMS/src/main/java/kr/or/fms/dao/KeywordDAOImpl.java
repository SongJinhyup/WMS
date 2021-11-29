package kr.or.fms.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.fms.fran.dto.FranVO;
import kr.or.fms.hq.dto.HqGoodsVO;
import kr.or.fms.logis.dto.LogisVO;
import kr.or.fms.logis.dto.LogisWhVO;
import kr.or.fms.sup.dto.SupVO;

public class KeywordDAOImpl implements KeywordDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<HqGoodsVO> goods() throws SQLException {
		List<HqGoodsVO> goodsList = null;
		goodsList = session.selectList("Keyword-Mapper.hqGoods");
		return goodsList;
	}

	@Override
	public List<String> local() throws SQLException {
		List<String> localList = session.selectList("Keyword-Mapper.local");
		return localList;
	}
	
	@Override
	public List<LogisVO> logis() throws SQLException {
		List<LogisVO> logisList = session.selectList("Keyword-Mapper.logis");
		return logisList;
	}
	
	@Override
	public List<FranVO> fran() throws SQLException {
		List<FranVO> franList = session.selectList("Keyword-Mapper.fran");
		return franList;
	}
	
	@Override
	public List<SupVO> sup() throws SQLException {
		List<SupVO> supList = session.selectList("Keyword-Mapper.sup");
		return supList;
	}
	@Override
	public List<String> laca() throws SQLException {
		List<String> lacaList = session.selectList("Keyword-Mapper.laca");
		return lacaList;
	}
	@Override
	public List<String> smca() throws SQLException {
		List<String> smcaList = session.selectList("Keyword-Mapper.smca");
		return smcaList;
	}

	@Override
	public List<LogisVO> log() throws SQLException {
		List<LogisVO> logList = session.selectList("Keyword-Mapper.log");
		return logList;
	}

	@Override
	public List<HqGoodsVO> hq() throws SQLException {
		List<HqGoodsVO> hqList = session.selectList("Keyword-Mapper.hq");
		return hqList;
	}

	@Override
	public List<FranVO> outFran() throws SQLException {
		List<FranVO> outFranList = session.selectList("Keyword-Mapper.outFran");
		return outFranList;
	}

	@Override
	public List<LogisVO> outLogis() throws SQLException {
		List<LogisVO> outLogisList = session.selectList("Keyword-Mapper.outLogis");
		return outLogisList;
	}
	
	@Override
	public List<LogisWhVO> wh(String fmsLogis) throws SQLException {
		List<LogisWhVO> whList = session.selectList("Keyword-Mapper.wh",fmsLogis);
		return whList;
	}
	@Override
	public List<LogisWhVO> whcn(String fmsLogis) throws SQLException {
		List<LogisWhVO> whList = session.selectList("Keyword-Mapper.whcn",fmsLogis);
		return whList;
	}
	
///////////////////////////////////////////////////////////////////////
	@Override
	public List<LogisWhVO> logisWh() throws SQLException {
		List<LogisWhVO> logisWhList = session.selectList("Keyword-Mapper.logisWh");
		return logisWhList;
	}

	@Override
	public HqGoodsVO goodsDe(String code) throws SQLException {
		HqGoodsVO hqgoods= session.selectOne("Keyword-Mapper.hqgoodsDetail", code);
		return hqgoods;
	}

	@Override
	public LogisWhVO readLogisGoods(Map<String, String> data) throws SQLException {
		LogisWhVO logisGoods = session.selectOne("Keyword-Mapper.readLogisGoods", data);
		return logisGoods;
	}

}
