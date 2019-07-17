package com.etc.model.util;

import java.util.List;

public class RecommendSet {
    List<Integer> forzen;
    int recommend;

    public List<Integer> getForzen() {
        return forzen;
    }

    public void setForzen(List<Integer> forzen) {
        this.forzen = forzen;
    }

    public int getRecomend() {
        return recommend;
    }

    public void setRecommend(int recomend) {
        this.recommend = recomend;
    }

    @Override
    public String toString() {
        return "RecommendSet{" +
                "forzen=" + forzen +
                ", recommend=" + recommend +
                '}';
    }
}
