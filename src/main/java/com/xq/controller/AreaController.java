package com.xq.controller;

import com.xq.dto.Result;
import com.xq.model.Area3;
import com.xq.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 区域
 * Created by netlab606 on 2017/7/29.
 */
@Controller
@RequestMapping("/area")
public class AreaController {

    @Autowired
    AreaService areaService;

    /**
     * 根据区的名字 获取该区的路名
     * @param area2_name
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getArea3ByArea2Name",method = RequestMethod.POST)
    private Result getArea3ByArea2Name(String area2_name){
        List<Area3> area3List=areaService.getArea3ByArea2Name(area2_name);
        return new Result(true,area3List);
    }
}
