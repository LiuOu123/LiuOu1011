package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.pojo.Standard;

/**
 * @author shkstart
 */
public interface StandardService {
    PageInfo<Standard> selectAll(String zhname, Integer pageIndex, Integer pageSize);

    int del(Integer[] arr);

    int add(Standard standard);

    Standard selectById(Integer id);

    int update(Standard standard);
}
