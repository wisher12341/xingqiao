package com.xq.controller;

import com.xq.dto.Result;
import com.xq.model.OrganComment;
import com.xq.model.Organization;
import com.xq.model.UserGoodReport;
import com.xq.service.GoodReportService;
import com.xq.service.OrganizationService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 机构查询和显示
 * Created by joy12 on 2017/11/3.
 */
/**
 * 机构
 * Created by netlab606 on 2017/6/25.
 */
@Controller
@RequestMapping(value = "/wx/organization")
public class OrganizationController {


    @Autowired
    OrganizationService organizationService;
    @Autowired
    GoodReportService goodReportService;

    /**
     * 列表页面
     * @return
     */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list() {
        return "organization/organizations";
    }

    /**
     * 获得机构表
     * @return
     */
    @RequestMapping(value = "/get_organizations",method = RequestMethod.GET)
    @ResponseBody
    public Result get_organizations(){
        List<Organization> organizationList=organizationService.getOrganizations();
        return new Result(true,organizationList);
    }

    /**
     * 机构具体信息界面
     * @param orgId
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/{orgId}/organintro",method = RequestMethod.GET)
    public String organintro(@PathVariable("orgId") Integer orgId, Model model, HttpServletRequest request) {
        if (request.getSession().getAttribute("USER") == null){
            TmpLogin.tmpLogin(request);
        }
        Organization organization=organizationService.getOrganization(orgId);
        model.addAttribute("organization",organization);
        UserGoodReport userGoodReport=goodReportService.getOrganGoodReportByUid(request);
        model.addAttribute("usergoodreport",userGoodReport);
        return "organization/organintro";
    }


    /**
     * 机构评论页面
     * @param orgId
     * @return
     */
    @RequestMapping(value = "/toCommentPage",method = RequestMethod.GET)
    public ModelAndView toOrganComment(@Param("orgId") Integer orgId) {
        ModelAndView mv = new ModelAndView("organization/organ_comment");
        mv.addObject("orgId",orgId);
        return mv;
    }

    /**
     * 机构评论
     * @param organComment
     * @param request
     * @return
     */
    @RequestMapping(value = "/comment",method = RequestMethod.POST)
    public String comment(OrganComment organComment, HttpServletRequest request, @RequestParam(required = false) MultipartFile[] pics){
        if (request.getSession().getAttribute("USER") == null){
            TmpLogin.tmpLogin(request);
        }
        organizationService.addComment(organComment,request,pics);
        return "redirect:/organization/"+organComment.getOid()+"/organintro";
    }

    /**
     * 评论回复
     * @param organComment
     * @param request
     * @return
     */
    @RequestMapping(value = "/reply",method = RequestMethod.POST)
    public String reply(OrganComment organComment, HttpServletRequest request){
        if (request.getSession().getAttribute("USER") == null){
            TmpLogin.tmpLogin(request);
        }
        organizationService.addComment(organComment,request,null);
        return "redirect:/organization/"+organComment.getOid()+"/organintro";
    }

    /**
     * 评论图片
     * @param cid 评论id
     * @param index 第一个显示的 index
     * @param model
     * @return
     */
    @RequestMapping(value = "/{cid}/pic/{index}",method = RequestMethod.GET)
    public String pic(@PathVariable Integer cid,@PathVariable Integer index,Model model){
        List<String> pics=organizationService.getCommentPics(cid,index);
        model.addAttribute("pics",pics);
        model.addAttribute("index",index);
        return "picture";
    }

}
