package com.kgc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.mapper.StandardMapper;
import com.kgc.pojo.Standard;
import com.kgc.pojo.StandardExample;
import com.kgc.service.StandardService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author shkstart
 * @create 2020-10-11 17:57
 */
@Service("standardService")
public class StandardServiceImpl implements StandardService {
    @Resource
    StandardMapper standardMapper;


    @Override
    public PageInfo<Standard> sel(Integer pageIndex, int pageSize, String zhname) {
        StandardExample example = new StandardExample();
        StandardExample.Criteria criteria = example.createCriteria();
        if (zhname != "") {
            criteria.andZhnameEqualTo(zhname);
        }
        PageHelper.startPage(pageIndex, pageSize);
        List<Standard> standards = standardMapper.selectByExample(example);
        PageInfo<Standard> standardPageInfo = new PageInfo<>(standards);
        return standardPageInfo;
    }

    @Override
    public int ins(Standard standard) {
        return standardMapper.insert(standard);
    }

    @Override
    public int upd(Standard standard) {
        return standardMapper.updateByPrimaryKey(standard);
    }
    @Override
    public int del(Integer[] arr) {
        StandardExample standardExample=new StandardExample();
        StandardExample.Criteria criteria = standardExample.createCriteria();
        List<Integer> list=new ArrayList<>();
        for (Integer integer : arr) {
            list.add(integer);
        }
        criteria.andIdIn(list);
        return  standardMapper.deleteByExample(standardExample);
    }

}
