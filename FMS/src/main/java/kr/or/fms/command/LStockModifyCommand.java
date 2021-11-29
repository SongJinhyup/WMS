package kr.or.fms.command;

import kr.or.fms.logis.dto.LogisWhVO;

public class LStockModifyCommand {
	
	private String wh_code;			//창고코드
	private String logis_code;		//물류센터코드
	private String hq_goods_code;	//본사물품코드
	private String wh_name;			//창고명
	private String wh_area;			//창고면적
	private String wh_st;			//창고상태
	private int logis_goods_stock;	//재고량
	private int logis_safe_stock;	//안전재고량
	private int logis_suit_stock;	//적정재고량
	
	public String getWh_code() {
		return wh_code;
	}
	public void setWh_code(String wh_code) {
		this.wh_code = wh_code;
	}
	public String getLogis_code() {
		return logis_code;
	}
	public void setLogis_code(String logis_code) {
		this.logis_code = logis_code;
	}
	public String getHq_goods_code() {
		return hq_goods_code;
	}
	public void setHq_goods_code(String hq_goods_code) {
		this.hq_goods_code = hq_goods_code;
	}
	public String getWh_name() {
		return wh_name;
	}
	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
	}
	public String getWh_area() {
		return wh_area;
	}
	public void setWh_area(String wh_area) {
		this.wh_area = wh_area;
	}
	public String getWh_st() {
		return wh_st;
	}
	public void setWh_st(String wh_st) {
		this.wh_st = wh_st;
	}
	public int getLogis_goods_stock() {
		return logis_goods_stock;
	}
	public void setLogis_goods_stock(int logis_goods_stock) {
		this.logis_goods_stock = logis_goods_stock;
	}
	public int getLogis_safe_stock() {
		return logis_safe_stock;
	}
	public void setLogis_safe_stock(int logis_safe_stock) {
		this.logis_safe_stock = logis_safe_stock;
	}
	public int getLogis_suit_stock() {
		return logis_suit_stock;
	}
	public void setLogis_suit_stock(int logis_suit_stock) {
		this.logis_suit_stock = logis_suit_stock;
	}
	
	public LogisWhVO toLogisWhVO() {
		LogisWhVO logisWh = new LogisWhVO();
		logisWh.setLogis_code(this.logis_code);
		logisWh.setHq_goods_code(this.hq_goods_code);
		logisWh.setWh_name(this.wh_name);
		logisWh.setLogis_goods_stock(this.logis_goods_stock);
		logisWh.setLogis_safe_stock(this.logis_safe_stock);
		logisWh.setLogis_suit_stock(this.logis_suit_stock);
		
		return logisWh;
	}

}
