package com.kgc.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.pojo.Standard;
import com.kgc.service.StandardService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

/**
 * @author shkstart
 * @create 2020-10-11 17:30
 */
@Controller
public class StandardController {
    @Resource
    StandardService standardService;


    @RequestMapping("/")
    public String index(){
        return "index";
    }
    @RequestMapping("/sel")
    @ResponseBody
    public Map<String,Object> sel(Integer pageindex,Integer  pagesize,String zhname){
        Map<String,Object> map=new HashMap<>();
        PageInfo<Standard> sel = standardService.sel(pageindex, pagesize, zhname);
        map.put("sel",sel);
        System.out.println(sel);
        return map;
    }
    @RequestMapping("/ins")
    public String ins(Standard standard, MultipartFile packagePath2, HttpSession session){
        String realPath = session.getServletContext().getRealPath("static/images");
        String originalFilename = packagePath2.getOriginalFilename();
        String extension = FilenameUtils.getExtension(originalFilename);
        String fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000) + "." + extension;
        File file = new File(realPath, fileName);
        try {
            packagePath2.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        standard.setPackagePath(fileName);
        int ins = standardService.ins(standard);
        System.out.println(ins);
        return "index";
    }
    @RequestMapping("/upd")
    public String upd(Standard standard){
        int upd = standardService.upd(standard);
        System.out.println(upd);
        return "index";
    }
  @RequestMapping("/chuan/{stdNum}/{zhname}/{versionn}/{keyss}/{releaseDate}/{implDate}/{packagePath}/{id}")
  public String chuan(@PathVariable String stdNum,@PathVariable String zhname,@PathVariable String versionn, @PathVariable String keyss,@PathVariable String releaseDate,@PathVariable String implDate,@PathVariable String packagePath,@PathVariable Integer id,HttpSession session){
session.setAttribute("stdNum",stdNum);
session.setAttribute("zhname",zhname);
      session.setAttribute("versionn",versionn);
      session.setAttribute("keyss",keyss);
      session.setAttribute("releaseDate",releaseDate);
      session.setAttribute("implDate",implDate);
      session.setAttribute("packagePath",packagePath);
      session.setAttribute("id",id);
        return "update";
  }
    @RequestMapping("/xiazai")
    @ResponseBody
    public void xiaZai(String packagePath, HttpServletRequest request, HttpServletResponse response){
        String realPath = request.getSession().getServletContext().getRealPath("static/images/");
        File file=new File(realPath+packagePath);
        System.out.println(packagePath);
        response.setContentType("application/x-msdownload");
        response.setHeader("Content-Disposition", "attachment;filename=" + packagePath);
        try {
            Files.copy(file.toPath(), response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/del")
    @ResponseBody
    public Map<String,Object> del(@RequestParam("arr[]")Integer[] arr){
        Map<String,Object> map=new HashMap<>();
        int del = standardService.del(arr);
        if (del>0){
            map.put("success","true");
        }else{
            map.put("success","false");
        }
        return map;
    }




}
