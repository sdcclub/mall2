package com.etc.model.service;

import com.etc.model.dao.GoodsMapper;
import com.etc.model.entity.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsService {
    private GoodsMapper goodsMapper;

    public GoodsMapper getGoodsMapper() {
        return goodsMapper;
    }

    @Autowired
    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    public List<Goods> findAll(){
        return goodsMapper.selectByExample(null);
    }

    public Goods findByGid(int gid){
        return goodsMapper.selectByPrimaryKey(gid);
    }
}
