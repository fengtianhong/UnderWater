package com.qa.model;

import java.util.List;

public interface QaDAO_interface {
	public void insert();
	public void update();
	public void delete();
	public List<QaVO> getByMenu(String menu);	// 不確定要不要
	public List<QaVO> getByMenu(String menu, String submenu);	// 下拉選單查詢
	public List<QaVO> getBySystem(String system);	// 根據系統查詢
	public List<QaVO> getPopularQuestion(boolean popularQuestion);	// 根據是否為熱門問題查詢
	
}
