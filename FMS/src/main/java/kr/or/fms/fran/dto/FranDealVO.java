package kr.or.fms.fran.dto;
									/* 당장거래(가맹점간거래) */
import java.util.Date;

import kr.or.fms.hq.dto.HqGoodsVO;
									
public class FranDealVO {
	
	private String fran_deal_code;	//거래코드
	private String fran_code;		//가맹점코드
	private String hq_code;			//본사코드
	private String hq_goods_code;	//본사물품코드
	private String appr_deal_fran;	//요청승인가맹점코드
	private Date deal_date;			//거래일자
	private int deal_quan;			//거래수량
	private int deal_st;			//거래상태
	private String deal_alarm_st;	//요청받은 가맹점 알람 확인	
	
	private HqGoodsVO hqGoodsVO;	//본사물품
	private FranVO franVO;
	
	public FranVO getFranVO() {
		return franVO;
	}
	public void setFranVO(FranVO franVO) {
		this.franVO = franVO;
	}
	public HqGoodsVO getHqGoodsVO() {
		return hqGoodsVO;
	}
	public void setHqGoodsVO(HqGoodsVO hqGoodsVO) {
		this.hqGoodsVO = hqGoodsVO;
	}
	public String getHq_goods_code() {
		return hq_goods_code;
	}
	public void setHq_goods_code(String hq_goods_code) {
		this.hq_goods_code = hq_goods_code;
	}
	public String getDeal_alarm_st() {
		return deal_alarm_st;
	}
	public void setDeal_alarm_st(String deal_alarm_st) {
		this.deal_alarm_st = deal_alarm_st;
	}
	public String getFran_deal_code() {
		return fran_deal_code;
	}
	public void setFran_deal_code(String fran_deal_code) {
		this.fran_deal_code = fran_deal_code;
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
	public String getAppr_deal_fran() {
		return appr_deal_fran;
	}
	public void setAppr_deal_fran(String appr_deal_fran) {
		this.appr_deal_fran = appr_deal_fran;
	}
	public Date getDeal_date() {
		return deal_date;
	}
	public void setDeal_date(Date deal_date) {
		this.deal_date = deal_date;
	}
	public int getDeal_quan() {
		return deal_quan;
	}
	public void setDeal_quan(int deal_quan) {
		this.deal_quan = deal_quan;
	}
	public int getDeal_st() {
		return deal_st;
	}
	public void setDeal_st(int deal_st) {
		this.deal_st = deal_st;
	}
	
	
	
	
	
}
