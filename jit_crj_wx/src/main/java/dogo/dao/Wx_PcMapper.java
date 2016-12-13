package dogo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import dogo.model.Wx_Pc;

public interface Wx_PcMapper {
    int deleteByPrimaryKey(String openid);

    int insert(Wx_Pc record);

    int insertSelective(Wx_Pc record);

    Wx_Pc selectByPrimaryKey(String openid);

    int updateByPrimaryKeySelective(Wx_Pc record);

    int updateByPrimaryKey(Wx_Pc record);
    
    List<Wx_Pc> listWx_yuyue(@Param("openid")String openid,@Param("yysj")String yysj);
    
    List<Wx_Pc> listWx_yuyueId(@Param("id")String id);
    
    
}