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
 */
@Service
public class StandardServiceImpl implements StandardService {
    @Resource
    StandardMapper standardMapper;

    @Override
    public PageInfo<Standard> selectAll(String zhname, Integer pageIndex, Integer pageSize) {
        StandardExample standardExample = new StandardExample();
        StandardExample.Criteria criteria = standardExample.createCriteria();
        if (zhname != null && zhname != "") {
            criteria.andZhnameLike("%" + zhname + "%");
        }
        PageHelper.startPage(pageIndex, pageSize);
        List<Standard> standards = standardMapper.selectByExample(standardExample);
        PageInfo<Standard> pageInfo = new PageInfo<>(standards);
        return pageInfo;
    }

    @Override
    public int del(Integer[] arr) {
        StandardExample standardExample = new StandardExample();
        StandardExample.Criteria criteria = standardExample.createCriteria();
        List<Integer> list = new ArrayList<>();
        for (Integer integer : arr) {
            list.add(integer);
        }
        criteria.andIdIn(list);
        return standardMapper.deleteByExample(standardExample);
    }

    @Override
    public int add(Standard standard) {
        return standardMapper.insertSelective(standard);
    }

    @Override
    public Standard selectById(Integer id) {
        return standardMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(Standard standard) {
        return standardMapper.updateByPrimaryKeySelective(standard);
    }
}
