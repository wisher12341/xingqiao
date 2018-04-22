package com.xq.dao;

import com.xq.model.OrganComment;
import com.xq.model.Organization;

import java.util.List;

/**
 * Created by joy12 on 2017/11/3.
 */
public interface OrganizationDao {
    List<Organization> getOrganizations();

    Organization getOrganization(Integer id);

    void addComment(OrganComment organComment);

}
