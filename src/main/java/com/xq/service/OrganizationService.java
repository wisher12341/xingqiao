package com.xq.service;

import com.xq.model.OrganComment;
import com.xq.model.Organization;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by joy12 on 2017/11/3.
 */
public interface OrganizationService {
    List<Organization> getOrganizations();

    Organization getOrganization(Integer id);

    void addComment(OrganComment organComment, HttpServletRequest request, MultipartFile[] pics);

    List<String> getCommentPics(Integer cid, Integer index);

    List<OrganComment> getOrganizationComments(Integer id);

    OrganComment getOrganCommentByCid(Integer cid);
}
