package com.collections.model;

import java.util.List;

public interface CollectionsDAO_interface {
	public void insert();
	public void update();
	public void delete();
	public List<CollectionsVO> findByUserID(Integer userID);	// // FK need imports ��ܷ|�����ê��M�˦�{
	
}
