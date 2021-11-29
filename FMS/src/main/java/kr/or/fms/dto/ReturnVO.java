package kr.or.fms.dto;
									/* 반품 */
import java.util.Date;
import java.util.List;

import kr.or.fms.fran.dto.FranVO;
import kr.or.fms.hq.dto.HqGoodsVO;
import kr.or.fms.sup.dto.SupGoodsVO;

public class ReturnVO {
	
	private String return_code;
	private String fran_code;
	private String return_title;
	private Date return_apply_date;
	private String return_reason;
	private String return_appr_st;
	private Date return_deliver_date;
	private String return_st;
	private int attach_no;
	private String return_reason_code;
	private String return_place;
	private String return_check_st;
	
	private ReturnDetailVO returnDetailVO;
	private HqGoodsVO hqGoodsVO;
	private SupGoodsVO supGoodsVO;
	private FranVO franVO;
	private List<AttachVO> attachList;
	
	
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	public ReturnDetailVO getReturnDetailVO() {
		return returnDetailVO;
	}
	public void setReturnDetailVO(ReturnDetailVO returnDetailVO) {
		this.returnDetailVO = returnDetailVO;
	}
	public HqGoodsVO getHqGoodsVO() {
		return hqGoodsVO;
	}
	public void setHqGoodsVO(HqGoodsVO hqGoodsVO) {
		this.hqGoodsVO = hqGoodsVO;
	}
	public SupGoodsVO getSupGoodsVO() {
		return supGoodsVO;
	}
	public void setSupGoodsVO(SupGoodsVO supGoodsVO) {
		this.supGoodsVO = supGoodsVO;
	}
	
	public String getReturn_code() {
		return return_code;
	}
	public void setReturn_code(String return_code) {
		this.return_code = return_code;
	}
	public String getFran_code() {
		return fran_code;
	}
	public void setFran_code(String fran_code) {
		this.fran_code = fran_code;
	}
	public String getReturn_title() {
		return return_title;
	}
	public void setReturn_title(String return_title) {
		this.return_title = return_title;
	}
	public Date getReturn_apply_date() {
		return return_apply_date;
	}
	public void setReturn_apply_date(Date return_apply_date) {
		this.return_apply_date = return_apply_date;
	}
	public String getReturn_reason() {
		return return_reason;
	}
	public void setReturn_reason(String return_reason) {
		this.return_reason = return_reason;
	}
	public String getReturn_appr_st() {
		return return_appr_st;
	}
	public void setReturn_appr_st(String return_appr_st) {
		this.return_appr_st = return_appr_st;
	}
	public Date getReturn_deliver_date() {
		return return_deliver_date;
	}
	public void setReturn_deliver_date(Date return_deliver_date) {
		this.return_deliver_date = return_deliver_date;
	}
	public String getReturn_st() {
		return return_st;
	}
	public void setReturn_st(String return_st) {
		this.return_st = return_st;
	}
	public int getAttach_no() {
		return attach_no;
	}
	public void setAttach_no(int attach_no) {
		this.attach_no = attach_no;
	}
	public String getReturn_reason_code() {
		return return_reason_code;
	}
	public void setReturn_reason_code(String return_reason_code) {
		this.return_reason_code = return_reason_code;
	}
	public String getReturn_place() {
		return return_place;
	}
	public void setReturn_place(String return_place) {
		this.return_place = return_place;
	}
	public String getReturn_check_st() {
		return return_check_st;
	}
	public void setReturn_check_st(String return_check_st) {
		this.return_check_st = return_check_st;
	}
	public FranVO getFranVO() {
		return franVO;
	}
	public void setFranVO(FranVO franVO) {
		this.franVO = franVO;
	}
	
	
	
	
	

}
