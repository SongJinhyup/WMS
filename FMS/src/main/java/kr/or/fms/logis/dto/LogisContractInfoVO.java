package kr.or.fms.logis.dto;
									/* 물류센터계약정보 */
import java.util.Date;

import kr.or.fms.hq.dto.HqVO;

public class LogisContractInfoVO {
	
	private String logis_contract_code;	//물류센터계약정보코드
	private String hq_code;				//본사코드
	private String logis_code;			//물류센터코드
	private int attach_no;				//첨부파일일련번호
	private Date logis_contract_start;	//계약시작일
	private Date logis_contract_end;	//계약종료일
	
	private HqVO hqVO;
	
	public HqVO getHqVO() {
		return hqVO;
	}
	public void setHqVO(HqVO hqVO) {
		this.hqVO = hqVO;
	}
	public String getLogis_contract_code() {
		return logis_contract_code;
	}
	public void setLogis_contract_code(String logis_contract_code) {
		this.logis_contract_code = logis_contract_code;
	}
	public String getHq_code() {
		return hq_code;
	}
	public void setHq_code(String hq_code) {
		this.hq_code = hq_code;
	}
	public String getLogis_code() {
		return logis_code;
	}
	public void setLogis_code(String logis_code) {
		this.logis_code = logis_code;
	}
	public int getAttach_no() {
		return attach_no;
	}
	public void setAttach_no(int attach_no) {
		this.attach_no = attach_no;
	}
	public Date getLogis_contract_start() {
		return logis_contract_start;
	}
	public void setLogis_contract_start(Date logis_contract_start) {
		this.logis_contract_start = logis_contract_start;
	}
	public Date getLogis_contract_end() {
		return logis_contract_end;
	}
	public void setLogis_contract_end(Date logis_contract_end) {
		this.logis_contract_end = logis_contract_end;
	}
	
	
	
	
}
