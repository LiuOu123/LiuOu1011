package com.kgc.springssm.service;

import com.kgc.springssm.pojo.Standard;

import java.util.List;

public interface StandardService {
    List<Standard> selectAll(String mo);
}
