package com.qa.model;

import java.util.List;

public interface QaDAO_interface {
	public void insert();
	public void update();
	public void delete();
	public List<QaVO> getByMenu(String menu);	// ���T�w�n���n
	public List<QaVO> getByMenu(String menu, String submenu);	// �U�Կ��d��
	public List<QaVO> getBySystem(String system);	// �ھڨt�άd��
	public List<QaVO> getPopularQuestion(boolean popularQuestion);	// �ھڬO�_���������D�d��
	
}
