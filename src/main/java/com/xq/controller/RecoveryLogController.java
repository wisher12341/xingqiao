
package com.xq.controller;


import com.xq.dto.RecoveryLogDto;
import com.xq.dto.Result;
import com.xq.model.RecoveryLog;
import com.xq.service.RecoveryLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.logging.Logger;

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
        RecoveryLogDto recoveryLogDto=recoveryLogService.getMyTeachersAndDemandsNoConfirmLogByUid(request);
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
    public ModelAndView log_post(RecoveryLogDto recoveryLogDto, HttpServletRequest request){
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
     * @param rid
     * @return
     */
    @RequestMapping(value = "/confirm",method = RequestMethod.POST)
    public ModelAndView confirm(@RequestParam Integer rid,@RequestParam String oid){
//        ModelAndView mv=new ModelAndView("redirect:/wx/log/index");
        recoveryLogService.confirmById(rid,oid);
        ModelAndView mv=new ModelAndView("redirect:/wx/common/success");
        mv.addObject("title","康复日志");
        mv.addObject("content","康复日志已确认");
        mv.addObject("url","/wx/log/index");
        return mv;
    }

    /**
     * 确认页面
     * @param rid
     * @return
     */
    @RequestMapping(value = "/{rid}/confirm",method =RequestMethod.GET)
    public ModelAndView confirm_get(@PathVariable Integer rid){
        ModelAndView mv=new ModelAndView("log/log_confirm");
        RecoveryLog recoveryLog=recoveryLogService.getLogByRid(rid);
        mv.addObject("log",recoveryLog);
        return mv;
    }
}
