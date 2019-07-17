package com.etc.model.service;

import com.etc.model.dao.GoodsMapper;
import com.etc.model.dao.StatisticalMapper;
import com.etc.model.entity.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdminService {

    private StatisticalMapper statisticalMapper;

    public StatisticalMapper getStatisticalMapper() {
        return statisticalMapper;
    }

    @Autowired
    public void setStatisticalMapper(StatisticalMapper statisticalMapper) {
        this.statisticalMapper = statisticalMapper;
    }

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

    public Goods selectGood(int gid){
        return goodsMapper.selectByPrimaryKey(gid);
    }

    public void editGood(Goods new_goods){
        goodsMapper.updateByPrimaryKey(new_goods);
    }

    public List<Map<String,Object>> groupByType(){
        return statisticalMapper.groupByType();
    }
}
