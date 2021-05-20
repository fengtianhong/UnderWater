package com.oderforgroup.model;

import java.util.List;

public interface OderForGroupDAO_interface {
	public void insert();
	public void update();
	public void delete();
	public OderForGroupVO findByPrimaryKey(Integer orderSN);	// 單筆訂單查詢
	public List<OderForGroupVO> getOrderByUserID(Integer userID);	// 會員查詢訂單

}
