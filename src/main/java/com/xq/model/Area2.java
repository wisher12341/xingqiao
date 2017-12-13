package com.xq.model;

import java.util.List;

/**
 * 区
 * Created by netlab606 on 2017/7/29.
 */
public class Area2 {
    private Integer id;
    private String name;

    private List<Area3> area3List;

    public List<Area3> getArea3List() {
        return area3List;
    }

    public void setArea3List(List<Area3> area3List) {
        this.area3List = area3List;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
