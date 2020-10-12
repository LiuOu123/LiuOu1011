package com.kgc.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.pojo.Standard;
import com.kgc.service.StandardService;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

/**
 * @author shkstart
 */
@Controller
public class IndexController {
    @Resource
    StandardService standardService;

    @RequestMapping("/")
    public String toIndex() {
        return "index";
    }

    @RequestMapping("toadd")
    public String toadd() {
        return "add";
    }

    @RequestMapping("doadd")
    public String doadd(Standard standard, MultipartFile packagePath1, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("static/images");
        String originalFilename = packagePath1.getOriginalFilename();
        String extension = FilenameUtils.getExtension(originalFilename);
        String newName = System.currentTimeMillis() + (RandomUtils.nextInt(10000)) + "_." + extension;
        File file = new File(realPath, newName);
        try {
            packagePath1.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        standard.setPackagePath(newName);
        int add = standardService.add(standard);
        return "redirect:/";
    }

    @RequestMapping("doupdate")
    public String doupdate(Standard standard, MultipartFile packagePath1, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("static/images");
        String originalFilename = packagePath1.getOriginalFilename();
        if (originalFilename != "" || originalFilename != null) {
            String extension = FilenameUtils.getExtension(originalFilename);
            String newName = System.currentTimeMillis() + (RandomUtils.nextInt(10000)) + "_." + extension;
            File file = new File(realPath, newName);
            try {
                packagePath1.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            standard.setPackagePath(newName);
        }
        int update = standardService.update(standard);
        return "redirect:/";
    }

    @RequestMapping("xiazai")
    @ResponseBody
    public void xiaZai(String fileName, HttpServletRequest request, HttpServletResponse response) {
        String realPath = request.getSession().getServletContext().getRealPath("static/images/");
        File file = new File(realPath + fileName);
        response.setContentType("application/x-msdownload");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
        try {
            Files.copy(file.toPath(), response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("select")
    @ResponseBody
    public Map<String, Object> select(String zhname, Integer pageIndex, Integer pageSize) {
        Map<String, Object> map = new HashMap<>();
        PageInfo<Standard> pageInfo = standardService.selectAll(zhname, pageIndex, pageSize);
        map.put("data", pageInfo);
        return map;
    }

    @RequestMapping("del")
    @ResponseBody
    public Map<String, Object> del(@RequestParam("arr[]") Integer[] arr) {
        Map<String, Object> map = new HashMap<>();
        int del = standardService.del(arr);
        if (del > 0) {
            map.put("success", "true");
        } else {
            map.put("success", "false");
        }
        return map;
    }

    @RequestMapping("chuan")
    public String chuan(Integer id, HttpSession session) {
        Standard standard = standardService.selectById(id);
        session.setAttribute("standard", standard);
        return "upd";
    }
}
