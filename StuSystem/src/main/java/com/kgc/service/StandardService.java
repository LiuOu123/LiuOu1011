package com.kgc.service;

import com.github.pagehelper.PageInfo;
import com.kgc.pojo.Standard;

/**
 * @author shkstart
 * @create 2020-10-11 17:56
 */
public interface StandardService {
    PageInfo<Standard> sel(Integer pageIndex, int pageSize,String zhname);
    int ins(Standard standard);
    int upd(Standard standard);
    int del(Integer[] arr);
}
