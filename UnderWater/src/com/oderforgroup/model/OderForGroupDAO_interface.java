package com.oderforgroup.model;

import java.util.List;

public interface OderForGroupDAO_interface {
	public void insert();
	public void update();
	public void delete();
	public OderForGroupVO findByPrimaryKey(Integer orderSN);	// �浧�q��d��
	public List<OderForGroupVO> getOrderByUserID(Integer userID);	// �|���d�߭q��

}
