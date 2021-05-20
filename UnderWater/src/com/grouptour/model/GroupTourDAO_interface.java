package com.grouptour.model;

import java.util.List;

public interface GroupTourDAO_interface {
	public void insert();
	public void update();
	public void delete();
	public GroupTourVO findByPrimaryKey(Integer groupTourSN);	// ³æµ§¬d¸ß

}
