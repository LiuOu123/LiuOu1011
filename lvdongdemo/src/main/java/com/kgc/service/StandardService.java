package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.pojo.Standard;

/**
 * @author shkstart
 * @create 2020-10-11 15:30
 */
public interface StandardService {
    PageInfo<Standard> selectAll(String zhname,Integer pageIndex,Integer pageSize);

    int del(Integer[] arr);

    int add(Standard standard);

    Standard selectById(Integer id);

    int update(Standard standard);
}
