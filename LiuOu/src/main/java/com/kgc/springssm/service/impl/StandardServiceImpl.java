package com.kgc.springssm.service.impl;

import com.kgc.springssm.mapper.StandardMapper;
import com.kgc.springssm.pojo.Standard;
import com.kgc.springssm.pojo.StandardExample;
import com.kgc.springssm.service.StandardService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("standardService")
public class StandardServiceImpl implements StandardService {
    @Resource
    StandardMapper standardMapper;
    @Override
    public List<Standard> selectAll(String title) {
        StandardExample example=new StandardExample();
        StandardExample.Criteria criteria = example.createCriteria();
        if(title!=null&&title!=""&&title.length()!=0){
            System.out.println("进入判断");
            criteria.andZhnameLike("%"+title+"%");
        }
        List<Standard> standards = standardMapper.selectByExample(example);
        return standards;
    }
}
