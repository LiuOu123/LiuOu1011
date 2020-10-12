package com.kgc.springssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.springssm.pojo.Standard;
import com.kgc.springssm.service.StandardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class IndexController {
    @Resource
    StandardService standardService;
    /*@RequestMapping("/")
    public String chu(){
        return "index";
    }*/
    @RequestMapping("/chushi")
    @ResponseBody
    public Map<String,Object> chushi(String title,Integer pageNum,Integer pageSize){
        System.out.println("title"+title);
        System.out.println("pageNum"+pageNum);
        System.out.println("pageSize"+pageSize);
        Map<String,Object> map=new HashMap<>();
        PageHelper.startPage(pageNum, pageSize);
        List<Standard> standards = standardService.selectAll(title);
        System.out.println(standards.toString());
        PageInfo<Standard> pageInfo = new PageInfo<>(standards);
        map.put("data",pageInfo);
        return map;
    }
}
