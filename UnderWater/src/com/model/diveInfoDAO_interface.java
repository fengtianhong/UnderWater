package com.model;

import java.util.List;

public interface diveInfoDAO_interface {
    public void insert(diveInfoVO diveInfoVO);
    public void update(diveInfoVO diveInfoVO);
    public void delete(diveInfoVO diveInfoVO);
    public diveInfoVO findByPrimaryKey(Integer diveInfoVO);
    public List<diveInfoVO> getAll();
}
