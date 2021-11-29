package kr.or.fms.fran.dto;

import kr.or.fms.hq.dto.HqGoodsVO;
import kr.or.fms.logis.dto.LogisVO;
import kr.or.fms.logis.dto.LogisWhVO;

public class FranOrderDeVO {
	private String fran_order_code;	//가맹점발주코드
	private String order_detail_num;	//가맹점발주코드
	private String order_detail_st;	//가맹점발주코드
	private String hq_goods_code;			//본사물품코드
	private String hq_goods_name;	//물품명
	private String goods_retail_price;	//물품명
	private String sup_goods_code;  //공급업체물품코드
	private int fran_order_quan;	//발주수량
	private int fran_order_price;	//발주금액
	private int fran_appr_quan;		//발주승인수량
	private int fran_deliver_se;	//발주배송구분
	
	private String fran_local_num;	//가맹점 지역번호(발주)
	private int avail_num;
	
	public int getAvail_num() {
		return avail_num;
	}
	public void setAvail_num(int avail_num) {
		this.avail_num = avail_num;
	}
	private HqGoodsVO hqGoodsVO;
	private FranOrderVO franOrderVO;
	private FranVO franVO;
	private LogisVO logisVO;
	private LogisWhVO logisWhVO;
	
	public FranVO getFranVO() {
		return franVO;
	}
	public void setFranVO(FranVO franVO) {
		this.franVO = franVO;
	}
	public LogisVO getLogisVO() {
		return logisVO;
	}
	public void setLogisVO(LogisVO logisVO) {
		this.logisVO = logisVO;
	}
	public LogisWhVO getLogisWhVO() {
		return logisWhVO;
	}
	public void setLogisWhVO(LogisWhVO logisWhVO) {
		this.logisWhVO = logisWhVO;
	}
	public String getFran_local_num() {
		return fran_local_num;
	}
	public void setFran_local_num(String fran_local_num) {
		this.fran_local_num = fran_local_num;
	}
	
	
	
	public String getGoods_retail_price() {
		return goods_retail_price;
	}
	public void setGoods_retail_price(String goods_retail_price) {
		this.goods_retail_price = goods_retail_price;
	}
	public String getOrder_detail_num() {
		return order_detail_num;
	}
	public void setOrder_detail_num(String order_detail_num) {
		this.order_detail_num = order_detail_num;
	}
	public String getFran_order_code() {
		return fran_order_code;
	}
	public void setFran_order_code(String fran_order_code) {
		this.fran_order_code = fran_order_code;
	}
	public String getHq_goods_code() {
		return hq_goods_code;
	}
	public void setHq_goods_code(String hq_goods_code) {
		this.hq_goods_code = hq_goods_code;
	}
	public String getHq_goods_name() {
		return hq_goods_name;
	}
	public void setHq_goods_name(String hq_goods_name) {
		this.hq_goods_name = hq_goods_name;
	}
	public String getSup_goods_code() {
		return sup_goods_code;
	}
	public void setSup_goods_code(String sup_goods_code) {
		this.sup_goods_code = sup_goods_code;
	}
	public int getFran_order_quan() {
		return fran_order_quan;
	}
	public void setFran_order_quan(int fran_order_quan) {
		this.fran_order_quan = fran_order_quan;
	}
	public int getFran_order_price() {
		return fran_order_price;
	}
	public void setFran_order_price(int fran_order_price) {
		this.fran_order_price = fran_order_price;
	}
	public int getFran_appr_quan() {
		return fran_appr_quan;
	}
	public void setFran_appr_quan(int fran_appr_quan) {
		this.fran_appr_quan = fran_appr_quan;
	}
	public int getFran_deliver_se() {
		return fran_deliver_se;
	}
	public void setFran_deliver_se(int fran_deliver_se) {
		this.fran_deliver_se = fran_deliver_se;
	}
	public HqGoodsVO getHqGoodsVO() {
		return hqGoodsVO;
	}
	public void setHqGoodsVO(HqGoodsVO hqGoodsVO) {
		this.hqGoodsVO = hqGoodsVO;
	}
	public FranOrderVO getFranOrderVO() {
		return franOrderVO;
	}
	public void setFranOrderVO(FranOrderVO franOrderVO) {
		this.franOrderVO = franOrderVO;
	}
	public String getOrder_detail_st() {
		return order_detail_st;
	}
	public void setOrder_detail_st(String order_detail_st) {
		this.order_detail_st = order_detail_st;
	}
	
	
	
}
