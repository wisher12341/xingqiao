package com.xq.controller;

import com.xq.dto.Result;
import com.xq.model.User;
import com.xq.service.SmsService;
import com.xq.service.UserService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
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
    @Autowired
    SmsService smsService;

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

    /**
     * 生成验证码
     * @param phone
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getNumber",method = RequestMethod.POST)
    public Result getNumber(@RequestParam String phone){
        String number=smsService.getNumber(phone);
        if(number==null) return new Result(false);
        return new Result(true,number);
    }

    /**
     * 治疗师注册
     * @param user
     * @param response
     * @return
     */
    @RequestMapping(value = "/teacher/reg",method = RequestMethod.POST)
    public ModelAndView reg(User user,HttpServletResponse response){
        User user_re=userService.regTeacher(user,response);
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/"+user_re.getId()+"/myInfo");
        return mv;
    }

    /**
     * 用户切换账号
     * 家长用户：如果家长没有绑定手机账号的话 跳转至绑定手机账号的页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/{status}/changeAccount",method = RequestMethod.GET)
    public ModelAndView change_teacher(HttpServletRequest request, HttpServletResponse response,@PathVariable Integer status){
        String openid= CookieUtil.checkCookie(request,status==1?Const.OPENID_TEACHER:Const.OPENID_PARENT);
        userService.changeAccount(openid,response,status);
        ModelAndView mv=new ModelAndView(status==1?"login_teacher":"login_parent");
        mv.addObject("openid",openid);
        return mv;
    }

    /**
     * 家长用户绑定账号页面
     * @param request
     * @return
     */
    @RequestMapping(value = "/parent/bindAccount",method = RequestMethod.GET)
    public ModelAndView bind(HttpServletRequest request){
        String openid= CookieUtil.checkCookie(request,Const.OPENID_PARENT);
        ModelAndView mv=new ModelAndView("parent_bind");
        mv.addObject("openid",openid);
        return mv;
    }

    /**
     * 家长用户绑定账号
     * @return
     */
    @RequestMapping(value = "/parent/bindAccount",method = RequestMethod.POST)
    public ModelAndView bind_post(User user){
        User user_re=userService.bindAccount(user);
        ModelAndView mv=new ModelAndView("redirect:/wx/parentCenter/"+user_re.getId()+"myAccount");
        return mv;
    }

    @RequestMapping(value = "/teacher",method = RequestMethod.GET)
    public ModelAndView t(){
        ModelAndView mv=new ModelAndView("login_teacher");
        return mv;
    }
    @RequestMapping(value = "/parent",method = RequestMethod.GET)
    public ModelAndView p(){
        ModelAndView mv=new ModelAndView("login_parent");
        return mv;
    }
}
