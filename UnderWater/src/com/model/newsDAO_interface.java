package com.model;

import java.util.List;

public interface NewsDAO_interface {
    public void insert(NewsVO newsVO);
    public void update(NewsVO newsVO);
    public void delete(NewsVO newsVO);
    public NewsVO findByPrimaryKey(Integer newsVO);
    public List<NewsVO> getAll();
}
