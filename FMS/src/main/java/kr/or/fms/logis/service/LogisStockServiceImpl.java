package kr.or.fms.logis.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import kr.or.fms.command.PageMaker;
import kr.or.fms.command.SearchCriteria;
import kr.or.fms.logis.dao.LogisStockDAO;
import kr.or.fms.logis.dto.LStockTakingVO;
import kr.or.fms.logis.dto.LStockVO;
import kr.or.fms.logis.dto.LogisVO;
import kr.or.fms.logis.dto.LogisWhVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class LogisStockServiceImpl implements LogisStockService {
	
	private LogisStockDAO stockDAO;
	public LogisStockDAO getStockDAO() {
		return stockDAO;
	}
	public void setStockDAO(LogisStockDAO stockDAO) {
		this.stockDAO = stockDAO;
	}

	@Override
	public Map<String, Object> getStockList(SearchCriteria cri, HttpSession session) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		LogisVO logis = (LogisVO) session.getAttribute("loginLogis");
		
		cri.getKeywordMap().put("logis_code", logis.getLogis_code());
//		System.out.println(cri.getKeywordMap().get("wh"));
//		System.out.println(cri.getKeywordMap().get("laca"));
//		System.out.println(cri.getKeywordMap().get("smca"));
//		System.out.println(cri.getKeywordMap().get("logis_code"));
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		List<LStockVO> logisStock = stockDAO.selectStockCriteria(cri);
		// 전체 board 개수
		int totalCount = stockDAO.selectStockCriteriaTotalCount(cri);
		
		List<LogisWhVO> whComboList = stockDAO.selectWhCombo(logis.getLogis_code());
		List<String> lacaList = stockDAO.selectLaca();
		List<String> smcaList = stockDAO.selectSmca();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("logisStock", logisStock);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("lacaList", lacaList);
		dataMap.put("smcaList", smcaList);
		dataMap.put("whComboList", whComboList);
		
		return dataMap;
	}
	@Override
	public List<LogisWhVO> getWhCombo(String logis_code) throws SQLException {
		List<LogisWhVO> whComboList = stockDAO.selectWhCombo(logis_code);
		return whComboList;
	}
	@Override
	public List<String> getLaca() throws SQLException {
		List<String> lacaList = stockDAO.selectLaca();
		return lacaList;
	}
	@Override
	public List<String> getSmca() throws SQLException {
		List<String> smcaList = stockDAO.selectSmca();
		return smcaList;
	}
	@Override
	public List<LogisWhVO> getStockForModify(LogisWhVO logisWhVO) throws SQLException {
		List<LogisWhVO> logisWh = stockDAO.selectStockByHq_goods_code(logisWhVO);
		return logisWh;
	}

	@Override
	public void modify(LogisWhVO logisWhVO) throws SQLException {
		stockDAO.updateStock(logisWhVO);
		
	}
	@Override
	public List<LogisWhVO> getStock(LogisWhVO logisWhVO) throws SQLException {
		List<LogisWhVO> logisWh = stockDAO.selectStockByHq_goods_code(logisWhVO);
		return logisWh;
	}
	
	@Override
	public Map<String, Object> getTakingList(SearchCriteria cri, HttpSession session) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		LogisVO logis = (LogisVO) session.getAttribute("loginLogis");
		
		cri.getKeywordMap().put("logis_code", logis.getLogis_code());
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		List<LStockTakingVO> takingStock = stockDAO.selectStockTakingCriteria(cri);
		// 전체 board 개수
		int totalCount = stockDAO.selectStockTakingCriteriaTotalCount(cri);
		
		List<LogisWhVO> whComboList = stockDAO.selectWhCombo(logis.getLogis_code());
		List<String> lacaList = stockDAO.selectLaca();
		List<String> smcaList = stockDAO.selectSmca();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		System.out.println(takingStock);
		dataMap.put("takingStock", takingStock);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("lacaList", lacaList);
		dataMap.put("smcaList", smcaList);
		dataMap.put("whComboList", whComboList);
		
		return dataMap;
	}
	 @Override
	public void certifiedPhoneNumber(String cellNum, String url) {
		String api_key = "NCSI2S3WUDOYORNN";
		String api_secret = "FL3O4QN3K2X9BYZR5CSZXHH48LU21OAN";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", cellNum); // 수신전화번호
		params.put("from", "01099027725"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "링크를 클릭하세요. [" + url + "]");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
   }
	@Override
	public List<LStockTakingVO> getCode(LStockTakingVO taking_code) throws SQLException {
		List<LStockTakingVO> detailList = stockDAO.selectStockByTaking_code(taking_code);
		return detailList;
	}
	
	@Override
	public int getNewCode() throws SQLException {
		int seq = 0;
		seq = stockDAO.takingSeqNext();
		return seq;
	}
	
	@Override
	public void registTemp(Map<String, String> data) throws SQLException {
		stockDAO.registTakingTempDetail(data);
	}
	@Override
	public void updateTemp(Map<String, String> data) throws SQLException {
		stockDAO.updateTakingTempDetail(data);
		
	}
	@Override
	public void registData(Map<String, String> data) throws SQLException {
		stockDAO.updateStockByTaking(data);
		stockDAO.registTaking(data);
	}
	
}
