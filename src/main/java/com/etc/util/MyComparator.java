package com.etc.util;

import com.etc.model.entity.Order;
import java.util.Comparator;

public class MyComparator implements Comparator {

    @Override
    public int compare(Object o1, Object o2) {
        Order o11=(Order)o1;
        Order o22=(Order)o2;

        //把当前订单按照onumber进行排序
        if(o11.getOnumber()>=o22.getOnumber()){
            return 1;
        }else {
            return -1;
        }
    }
}
