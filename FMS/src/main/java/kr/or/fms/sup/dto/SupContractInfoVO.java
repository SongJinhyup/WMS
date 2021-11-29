package kr.or.fms.sup.dto;
									/* 공급업체계약정보 */
import java.util.Date;

public class SupContractInfoVO {
	
	private String sup_cont_code;	//공급업체계약정보코드
	private String sup_code;		//공급업체코드
	private String hq_code;			//본사코드
	private Date sup_cont_start;	//계약시작일
	private Date sup_cont_end;		//계약종료일
	private int attach_no;			//첨부파일일련번호
	private int sup_cont_st;		//계약상태
	
	public String getSup_cont_code() {
		return sup_cont_code;
	}
	public void setSup_cont_code(String sup_cont_code) {
		this.sup_cont_code = sup_cont_code;
	}
	public String getSup_code() {
		return sup_code;
	}
	public void setSup_code(String sup_code) {
		this.sup_code = sup_code;
	}
	public String getHq_code() {
		return hq_code;
	}
	public void setHq_code(String hq_code) {
		this.hq_code = hq_code;
	}
	public Date getSup_cont_start() {
		return sup_cont_start;
	}
	public void setSup_cont_start(Date sup_cont_start) {
		this.sup_cont_start = sup_cont_start;
	}
	public Date getSup_cont_end() {
		return sup_cont_end;
	}
	public void setSup_cont_end(Date sup_cont_end) {
		this.sup_cont_end = sup_cont_end;
	}
	public int getAttach_no() {
		return attach_no;
	}
	public void setAttach_no(int attach_no) {
		this.attach_no = attach_no;
	}
	public int getSup_cont_st() {
		return sup_cont_st;
	}
	public void setSup_cont_st(int sup_cont_st) {
		this.sup_cont_st = sup_cont_st;
	}
	
	
	
	
}
