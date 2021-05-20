package com.locationrate.model;

import java.util.*;

public interface LocationRateDAO_interface {
	public void insert();
	public void update();
	public void delete();
	public List<LocationRateVO> getByPointSN(Integer pointSN);	// 以前點查詢顯示評價
	

}
