package com.etc.model.entity;

import java.util.Date;

public class Cart {
    private Integer cid;

    private Integer uid;

    private Integer gid;

    private Integer ccount;

    private Date cadddate;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getCcount() {
        return ccount;
    }

    public void setCcount(Integer ccount) {
        this.ccount = ccount;
    }

    public Date getCadddate() {
        return cadddate;
    }

    public void setCadddate(Date cadddate) {
        this.cadddate = cadddate;
    }
}