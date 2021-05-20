package com.model;

import java.util.List;

public interface DiveInfoDAO_interface {
    public void insert(DiveInfoVO diveInfoVO);
    public void update(DiveInfoVO diveInfoVO);
    public void delete(DiveInfoVO diveInfoVO);
    public DiveInfoVO findByPrimaryKey(Integer diveInfoVO);
    public List<DiveInfoVO> getAll();
}
