package dogo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import dogo.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(String userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKeyWithBLOBs(User record);

    int updateByPrimaryKey(User record);
    /**
     * 根据用户传递参数查询
     * @param record
     * @return
     */
    User selectByWhere(User record);
    /**
     * 验证登录
     * @param record
     * @return User
     */
    @Select("select * from m_user where USERCODE=#{usercode,jdbcType=VARCHAR} and USERPWD=#{userpwd,jdbcType=VARCHAR}")
    User yzdl(User record);
    
    
    /**
     * 查询所有用户带分页
     * @param map
     * @return
     */
    List<User>selectAllUserByPage(Map<String, Object> map);
    /**
     * 查询总记录数
     * @param map
     * @return
     */
    int selectAllCount(Map<String, Object> map);
    
    /**
     * 根据角色ID查询所有用户
     * @param roleid
     * @return
     */
    List<User> selectAllUserByRoleid(String roleid);
    
    User findUserByUserCode(String usercode);
    
}