package com.xq.dao;
import com.xq.model.UserGoodReport;
import org.apache.ibatis.annotations.Param;

/**
 * Created by netlab606 on 2017/10/5.
 */
public interface GoodReportDao {
    UserGoodReport getOrganGoodReportByUid(Integer id);

    void add(UserGoodReport userGoodReport);

    void del(@Param("str") String str, @Param("flag") Integer flag, @Param("id") Integer id);

    UserGoodReport getTeacherGoodReportByUid(Integer id);
}
