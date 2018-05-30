package com.xq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by netlab606 on 2018/5/29.
 */
@Controller
@RequestMapping("/wx/common")
public class CommonController {


    /**
     * 操作后 到的 提醒页面
     * @param title
     * @param content
     * @param url
     * @return
     */
    @RequestMapping("/success")
    public ModelAndView success(@RequestParam String title,@RequestParam String content,@RequestParam String url){
        ModelAndView mv=new ModelAndView("success");
        mv.addObject("title",title);
        mv.addObject("content",content);
        mv.addObject("url",url);
        return mv;
    }
}
