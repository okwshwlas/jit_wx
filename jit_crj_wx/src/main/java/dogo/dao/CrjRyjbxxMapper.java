package dogo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import dogo.base.BaseMapper;
import dogo.model.CrjRyjbxx;
import dogo.model.SysDictionary;
import dogo.model.YuYueRiqiBean;

public interface CrjRyjbxxMapper extends BaseMapper<CrjRyjbxx, String> {
	/**
	 *  根据身份证和电话查询
	 * @return
	 */
	CrjRyjbxx selectByCardAndPhone(@Param("sfzjhm")String sfzjhm,@Param("lxdh")String lxdh);
	
	SysDictionary listSysDictionaryByType(@Param("type")String type,@Param("pid")String pid);
	
	List findYuYueByRiqi(@Param("dataTime")String dataTime,@Param("num")String num);
	
	
}