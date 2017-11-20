package com.xq.controller;


import com.xq.dto.RecoveryLogDto;
import com.xq.dto.Result;
import com.xq.service.RecoveryLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 康复日志
 * Created by netlab606 on 2017/11/7.
 */
@Controller
@RequestMapping("/wx/log")
public class RecoveryLogController {

    @Autowired
    RecoveryLogService recoveryLogService;

    /**
     * 康复日志页面
     * @return
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public ModelAndView log_get(HttpServletRequest request){
        RecoveryLogDto recoveryLogDto=recoveryLogService.getMyTeachersAndDemandsByUid(request);
        ModelAndView mv=new ModelAndView("log/log");
        mv.addObject("recoveryLogDto",recoveryLogDto);
        return mv;
    }

    /**
     * 康复日志查询
     * @param recoveryLogDto
     * @param request
     * @return
     */
    @RequestMapping(value = "/index",method = RequestMethod.POST)
    public ModelAndView log_post(RecoveryLogDto recoveryLogDto,HttpServletRequest request){
        RecoveryLogDto recoveryLogDtoResult=recoveryLogService.getLogsByDto(recoveryLogDto,request);
        ModelAndView mv=new ModelAndView("log/log");
        mv.addObject("recoveryLogDto",recoveryLogDtoResult);
        return mv;

    }

    /**
     * 某个订单的 康复日志  全部确认
     * @param orderId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/allConfirm",method = RequestMethod.POST)
    public Result allConfirm(@RequestParam String orderId){
        recoveryLogService.allConfirmByOrderId(orderId);
        return new Result(true);
    }

    /**
     * 确认
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/confirm",method = RequestMethod.POST)
    public Result confirm(@RequestParam Integer id,@RequestParam String oid){
        recoveryLogService.confirmById(id,oid);
        return new Result(true);
    }
}
