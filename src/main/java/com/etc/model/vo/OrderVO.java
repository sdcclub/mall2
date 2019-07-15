package com.etc.model.vo;

import com.etc.model.entity.Goods;

import java.util.Date;

public class OrderVO {
    private Integer oid;
    private Integer onumber;
    private Goods goods;
    private Integer ccount;
    private Double oprice;
    private String orderdate;
    private String opaydate;

    public String getOpaydate() {
        return opaydate;
    }

    public void setOpaydate(String opaydate) {
        this.opaydate = opaydate;
    }

    public OrderVO() {
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getOnumber() {
        return onumber;
    }

    public void setOnumber(Integer onumber) {
        this.onumber = onumber;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Integer getCcount() {
        return ccount;
    }

    public void setCcount(Integer ccount) {
        this.ccount = ccount;
    }

    public Double getOprice() {
        return oprice;
    }

    public void setOprice(Double oprice) {
        this.oprice = oprice;
    }

    public String getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }
}
