package com.etc.model.service;

import com.etc.model.dao.GoodsMapper;
import com.etc.model.entity.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
     private GoodsMapper goodsMapper;

    public List<Goods> findAll(){
        return goodsMapper.selectByExample(null);
    }

    public void removeGood(int gid){
        goodsMapper.deleteByPrimaryKey(gid);
    }

    public void addGood(Goods goods){
        goodsMapper.insert(goods);
    }

}
