package com.xq.controller;

import com.xq.dto.Result;
import com.xq.model.User;
import com.xq.service.SmsService;
import com.xq.service.UserService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
     * @param type login 注册用的验证码  change修改密码用的验证码
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getNumber/{type}",method = RequestMethod.POST)
    public Result getNumber(@RequestParam String phone, @PathVariable String type){
        String numberOrErrorMessage=smsService.getNumber(phone,type);
        if(!numberOrErrorMessage.matches("[0-9]+")) return new Result(false,numberOrErrorMessage);
        return new Result(true,numberOrErrorMessage);
    }

    /**
     * 治疗师注册
     * @param user
     * @param response
     * @return
     */
    @RequestMapping(value = "/teacher/reg",method = RequestMethod.POST)
    public ModelAndView reg(User user, HttpServletResponse response){
        User user_re=userService.regTeacher(user,response);
        ModelAndView mv=new ModelAndView("redirect:/wx/teacherCenter/"+user_re.getId()+"/myInfo_base");
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
        String openid= CookieUtil.checkCookie(request,status==1? Const.OPENID_TEACHER: Const.OPENID_PARENT);
//        openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
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
        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
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
        ModelAndView mv=new ModelAndView("redirect:/wx/parentCenter/"+user_re.getId()+"/myInfo_base");
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


    /**
     * 设置页面
     * @param request
     * @param type  1治疗师  0家长
     * @return
     */
    @RequestMapping(value = "/setting/{type}",method = RequestMethod.GET)
    public ModelAndView setting(HttpServletRequest request,@PathVariable String type){
        ModelAndView mv=new ModelAndView("setting/setting");
         String openid= CookieUtil.checkCookie(request,type.equals("0")?Const.OPENID_PARENT:Const.OPENID_TEACHER);
//        String openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
        User user=userService.getUserByOpenidStatus(openid,type);
        mv.addObject("user",user);
        return mv;
    }

    /**
     * 修改密码页面
     * @param request
     * @param type 1治疗师  0家长
     * @return
     */
    @RequestMapping(value = "/changePwd/{type}",method = RequestMethod.GET)
    public ModelAndView pwd(HttpServletRequest request,@PathVariable String type){
        ModelAndView mv=new ModelAndView("setting/changePwd");
         String openid= CookieUtil.checkCookie(request,type.equals("0")?Const.OPENID_PARENT:Const.OPENID_TEACHER);
//        String openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
        User user=userService.getUserByOpenidStatus(openid,type);
        mv.addObject("user",user);
        return mv;
    }

    /**
     * 修改密码
     * @param request
     * @param type 1治疗师  0家长
     * @return
     */
    @RequestMapping(value = "/changePwd/{type}",method = RequestMethod.POST)
    public ModelAndView pwd_post(HttpServletRequest request,@PathVariable String type,String password){
        ModelAndView mv=new ModelAndView("redirect:/wx/login/setting/"+type);
        userService.changePassword(request,password,type);
        return mv;
    }


    /**
     * 忘记密码页面
     * @param type 1治疗师  0家长
     * @return
     */
    @RequestMapping(value = "/forget/changePwd/{type}",method = RequestMethod.GET)
    public ModelAndView forgetpwd(@PathVariable String type){
        ModelAndView mv=new ModelAndView("forgetPassword");
        mv.addObject("type",type);
        return mv;
    }

    /**
     * 忘记密码的修改密码
     * @param type 1治疗师  0家长
     * @return
     */
    @RequestMapping(value = "/forget/changePwd/{type}",method = RequestMethod.POST)
    public ModelAndView forgetpwd_post(String username,@PathVariable String type,String password){
        ModelAndView mv;
        if(type.equals("1")){
            mv=new ModelAndView("redirect:/wx/teacherCenter");
        }else{
            mv=new ModelAndView("redirect:/wx/parentCenter");
        }
        userService.forgetChangePassword(username,password,type);
        return mv;
    }
}
