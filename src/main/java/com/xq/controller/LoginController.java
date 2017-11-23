package com.xq.controller;

import com.xq.model.User;
import com.xq.service.UserService;
import com.xq.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by netlab606 on 2017/11/19.
 */
@Controller
@RequestMapping("/wx/login")
public class LoginController {

    @Autowired
    UserService userService;

    /**
     * 账号密码登录
     * @param user
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "",method = RequestMethod.POST)
    public ModelAndView login(User user, HttpServletRequest request, HttpServletResponse response){
        String url= (String) request.getSession().getAttribute(Const.URL_BACK);
        if(url==null || url.equals("")){
            if(user.getStatus()==0) {
                url = "/wx/parentCenter";
            }else{
                url="/wx/teacherCenter";
            }
        }
        Boolean success=userService.checkLogin(user,request,response);
        if(success) {
            ModelAndView mv = new ModelAndView("redirect:"+url);
            return mv;
        }else{
            ModelAndView mv;
            if(user.getStatus()==0) {
                mv = new ModelAndView("login_parent");
            }else{
                mv = new ModelAndView("login_teacher");
            }
            mv.addObject("openid",user.getOpenid());
            mv.addObject("message","账号或密码错误");
            return mv;
        }
    }

}
