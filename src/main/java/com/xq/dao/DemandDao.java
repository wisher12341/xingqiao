package com.xq.dao;

import com.xq.model.Demand;
import com.xq.model.Parent;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by netlab606 on 2017/6/30.
 */
public interface DemandDao {



    List<Demand> getMyDemandsByOpenid(String openid);

    List<Demand> getDemandByUserId(Integer id);

    List<Demand> getDemandByIds(List<Integer> dids);

    Demand getDemandById(@Param("id") Integer demandId);

    List<Demand> getDemandByuserId(Integer id);

    void editorDemand(Demand demand);


    String getParenntNameByUid(Integer id);

    void updateName(@Param("name") String name,@Param("demandId") int demandId);
    void updateGender(@Param("gender") int gender,@Param("demandId") int demandId);
    void updateBirthday(@Param("birthday") String birthday,@Param("demandId") int demandId);
    void updateDiseaseHis(@Param("diseaseHis") String diseaseHis,@Param("demandId") int demandId);
    void updateRemark(@Param("remark") String name,@Param("demandId") int demandId);
    void updateReport(@Param("report") String name,@Param("demandId") int demandId);
    void updateAllergyHis(@Param("allergyHis") String allergyHis,@Param("demandId") int demandId);
    int getParentUserId(@Param("demandId") int demandId);
    String getRecoveryHis(@Param("demandId") int demandId);
    void updateRecoveryHis(@Param("recoveryHis") String recoveryHis,@Param("demandId") int demandId);
    void addDemand(@Param("userId") int userId,@Param("name") String name,@Param("gender") int gender, @Param("birthday") String birthday,
                   @Param("report") String report, @Param("diseaseHis") String diseaseHis, @Param("allergyHis") String allergyHis,@Param("remark") String remark);

    @Delete("DELETE FROM demand WHERE id=#{demandId}")
    void deleteDemand(@Param("demandId") int demandId);
}
