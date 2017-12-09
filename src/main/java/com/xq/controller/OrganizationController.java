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
import javax.servlet.http.HttpServletResponse;
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
    public String organintro(@PathVariable("orgId") Integer orgId,@RequestParam(value = "error",required = false) String error, Model model, HttpServletRequest request, HttpServletResponse response) {
        if (request.getSession().getAttribute("USER") == null){
            TmpLogin.tmpLogin(request,response);
        }
        Organization organization=organizationService.getOrganization(orgId);
        model.addAttribute("organization",organization);
        UserGoodReport userGoodReport=goodReportService.getOrganGoodReportByUid(request);
        model.addAttribute("usergoodreport",userGoodReport);
        if(error==null){
            error="null";
        }
        model.addAttribute("error",error);
        return "organization/organintro";
    }


    /**
     * 编写机构评论页面
     * @param orgId
     * @return
     */
    @RequestMapping(value = "/toCommentPage",method = RequestMethod.GET)
    public ModelAndView toOrganComment(@Param("orgId") Integer orgId) {
        ModelAndView mv = new ModelAndView("organization/organ_comment");
        mv.addObject("orgId",orgId);
        return mv;
    }

    @RequestMapping(value = "/toReply",method = RequestMethod.GET)
    public ModelAndView toReply(@RequestParam("commOid") Integer commOid,@RequestParam("pid") Integer pid) {
        ModelAndView mv = new ModelAndView("organization/organ_reply");
        mv.addObject("commOid",commOid);
        mv.addObject("pid",pid);
        return mv;
    }

    /**
     * 机构评论
     * @param organComment
     * @param request
     * @return
     */
    @RequestMapping(value = "/comment",method = RequestMethod.POST)
    public String comment(OrganComment organComment, HttpServletRequest request, HttpServletResponse response, @RequestParam(required = false) MultipartFile[] pics){
        if (request.getSession().getAttribute("USER") == null){
            TmpLogin.tmpLogin(request,response);
        }
        if (organizationService.addComment(organComment,request,pics)) {
            return "redirect:/wx/organization/" + organComment.getOid() + "/organintro";
        } else {
            return "redirect:/wx/organization/" + organComment.getOid() + "/organintro?error=NoAuth";
        }
    }

    /**
     * 所有机构评论展示页面
     * @param orgId
     * @return
     */
    @RequestMapping(value = "/toOrganCommentList",method = RequestMethod.GET)
    public ModelAndView toOrganCommentList(@Param("orgId") Integer orgId, HttpServletRequest request, HttpServletResponse response) {
        if (request.getSession().getAttribute("USER") == null){
            TmpLogin.tmpLogin(request,response);
        }
        ModelAndView mv = new ModelAndView("organization/organ_comment_list");
        UserGoodReport userGoodReport=goodReportService.getOrganGoodReportByUid(request);
        mv.addObject("usergoodreport",userGoodReport);
        mv.addObject("orgId",orgId);
//        mv.addObject("organCommentList",organizationService.getOrganizationComments(orgId));
        return mv;
    }

    /**
     * 机构评论分页
     * @param orgId
     * @param page
     * @param size
     * @return
     */
    @RequestMapping(value = "/getOrgCommentByPage",method = RequestMethod.POST)
    @ResponseBody
    public List<OrganComment> getOrgCommentByPage(@Param("orgId") Integer orgId,@Param("page") Integer page,@Param("size") Integer size) {
        return organizationService.getOrganizationCommentsByPage(orgId,page,size);
    }

    /**
     * 单条机构评论展示页面
     * @param cid 主评论id
     * @return
     */
    @RequestMapping(value = "/toOrganCommentSingle",method = RequestMethod.GET)
    public ModelAndView toOrganCommentSingle(@Param("cid") Integer cid, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("organization/organ_comment_single");
        mv.addObject("comm",organizationService.getOrganCommentByCid(cid));
        UserGoodReport userGoodReport=goodReportService.getOrganGoodReportByUid(request);
        mv.addObject("usergoodreport",userGoodReport);
        return mv;
    }

    /**
     * 评论回复
     * @param organComment
     * @param request
     * @return
     */
    @RequestMapping(value = "/reply",method = RequestMethod.POST)
    public String reply(OrganComment organComment, HttpServletRequest request, HttpServletResponse response){
        if (request.getSession().getAttribute("USER") == null){
            TmpLogin.tmpLogin(request,response);
        }
        if (organizationService.addComment(organComment,request,null)){
            return "redirect:/wx/organization/"+organComment.getOid()+"/organintro";
        } else {
            return "redirect:/wx/organization/"+organComment.getOid()+"/organintro?error='NoAuth'";
        }

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
