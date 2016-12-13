package dogo.dao;

import org.apache.ibatis.annotations.Param;

import dogo.base.BaseMapper;
import dogo.model.Grregist;

public interface GrregistMapper extends BaseMapper<Grregist, String>{
	
	/**
	 *  根据身份证和电话查询
	 * @return
	 */
	Grregist selectByCardAndPhone(@Param("idcard")String idcard,@Param("phonenum")String phonenum);
	
   
}