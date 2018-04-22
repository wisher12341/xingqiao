package com.xq.controller;

import com.xq.dto.Result;
import com.xq.service.GoodReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by netlab606 on 2017/10/5.
 */
@Controller
@RequestMapping("/wx/goodreport")
public class GoodReportController {

    @Autowired
    GoodReportService goodReportService;

    /**
     * 点赞、举报
     * @param request
     * @param type 0点赞 1举报
     * @param cid 评论id
     * @param flag 0机构评论  1治疗师评论
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Result add(HttpServletRequest request, @RequestParam Integer type, @RequestParam Integer cid, @RequestParam Integer flag, String reason){
        goodReportService.add(request,type,cid,flag,reason);
        return new Result(true);
    }

    /**
     * 取消点赞
     * @param request
     * @param cid 评论id
     * @param flag 0机构评论  1治疗师评论
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/del",method = RequestMethod.POST)
    public Result add(HttpServletRequest request, @RequestParam Integer cid,@RequestParam Integer flag){
        goodReportService.del(request,cid,flag);
        return new Result(true);
    }
}

