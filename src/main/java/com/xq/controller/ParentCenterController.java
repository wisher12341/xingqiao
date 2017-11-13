package com.xq.controller;

import com.xq.dto.Result;
import com.xq.model.Demand;
import com.xq.service.ParentCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by joy12 on 2017/11/10.
 */
@Controller
@RequestMapping(value = "/parentCenter")
public class ParentCenterController {

    @Autowired
    ParentCenterService parentCenterService;

    /**
     * 家长个人中心主界面
     * @return
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(){
        return "center/index";
    }

    /**
     *判断家长是否完成个人资料
     */
    @ResponseBody
    @RequestMapping(value="/isexisted", method = RequestMethod.POST)
    public Result isexisted(HttpSession session, @RequestParam Integer teacherId){
        List<Demand> demandList=parentCenterService.isexisted(session,teacherId);
        if(demandList==null) {
            return new Result(false);
        }else{
            return new Result(true,demandList);
        }
    }

    /**
     * 家长 资料完善
     * @return
     */
    @RequestMapping(value = "/parent_info_page",method = RequestMethod.GET)
    public String parent_info_page(){
        return "parent_info";
    }

}

