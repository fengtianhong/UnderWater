package com.model;

import java.util.List;

public interface newsDAO_interface {
    public void insert(newsVO newsVO);
    public void update(newsVO newsVO);
    public void delete(newsVO newsVO);
    public newsVO findByPrimaryKey(Integer newsVO);
    public List<newsVO> getAll();
}
