package com.locationrate.model;

import java.util.*;

public interface LocationRateDAO_interface {
	public void insert();
	public void update();
	public void delete();
	public List<LocationRateVO> getByPointSN(Integer pointSN);	// �H�e�I�d����ܵ���
	

}
