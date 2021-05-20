package com.customerreply.model;

import java.util.Set;

public interface CustomerReplyDAO_interface {
	public void insert();
	public void update();
	public void delete();
	public Set<CustomerReplyVO> findByUserID(Integer userID);	// FK need imports §ì¾ú¥v°T®§
	

}
