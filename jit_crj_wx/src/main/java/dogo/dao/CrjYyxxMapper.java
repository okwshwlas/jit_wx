package dogo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import dogo.base.BaseMapper;
import dogo.model.CrjRyjbxx;
import dogo.model.CrjYyxx;

public interface CrjYyxxMapper extends BaseMapper<CrjRyjbxx, String> {

    int insert(CrjYyxx record);

    int insertSelective(CrjYyxx record);

    int updateByPrimaryKeySelective(CrjYyxx record);

    int updateByPrimaryKey(CrjYyxx record);
    
    List<CrjYyxx> listWx_yuyuexiangxi(@Param("openid")String openid); 
    
    List<CrjYyxx> listWx_yuyuexiangxi_yycode(@Param("yycode")String yycode); 
    
   
    
    List<CrjYyxx> selectBySfzh(@Param("sfzh")String sfzh,@Param("yysj")String yysj); 

}