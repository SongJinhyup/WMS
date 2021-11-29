package kr.or.fms.fran.dto;
									/* 가맹점 계약정보 */
import java.util.Date;
									
public class FranContractInfoVO {

	private String fran_cont_code;	//공급업체계약정보코드
	private String fran_code;		//공급업체코드
	private String hq_code;			//본사코드
	private Date fran_cont_start;	//계약시작일
	private Date fran_cont_end;		//계약종료일
	private String attach_no;		//첨부파일일련번호
	private String fran_cont_st;	//계약상태
	
	public String getFran_cont_code() {
		return fran_cont_code;
	}
	public void setFran_cont_code(String fran_cont_code) {
		this.fran_cont_code = fran_cont_code;
	}
	public String getFran_code() {
		return fran_code;
	}
	public void setFran_code(String fran_code) {
		this.fran_code = fran_code;
	}
	public String getHq_code() {
		return hq_code;
	}
	public void setHq_code(String hq_code) {
		this.hq_code = hq_code;
	}
	public Date getFran_cont_start() {
		return fran_cont_start;
	}
	public void setFran_cont_start(Date fran_cont_start) {
		this.fran_cont_start = fran_cont_start;
	}
	public Date getFran_cont_end() {
		return fran_cont_end;
	}
	public void setFran_cont_end(Date fran_cont_end) {
		this.fran_cont_end = fran_cont_end;
	}
	public String getAttach_no() {
		return attach_no;
	}
	public void setAttach_no(String attach_no) {
		this.attach_no = attach_no;
	}
	public String getFran_cont_st() {
		return fran_cont_st;
	}
	public void setFran_cont_st(String fran_cont_st) {
		this.fran_cont_st = fran_cont_st;
	}
	
	
	
	
}
