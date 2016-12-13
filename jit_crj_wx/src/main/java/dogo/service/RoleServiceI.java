package dogo.service;

import java.util.List;
import java.util.Map;

import dogo.model.FunctionRole;
import dogo.model.Role;

public interface RoleServiceI {
	/**
	 * 查询所有不带分页
	 * @return
	 */
	public List<Role> selectAll();
	/**
	 * 查询所有带分页
	 * @param map
	 * @return
	 */
	public List<Role> selectAllPage(Map<String,Object> map);
	public String selectAllCount(Map<String,Object> map);
	public Role selectById(String roleid);
	public int insert(Role role);
	public int updateByPrimaryKeySelective(Role role);
	
	public List<FunctionRole> selectFunctionRole(String roleid);
	
	public int deleteFunctionByRoleId(String roleid);
	
	public int addFunctionRole(FunctionRole functionrole);
	
	public int deleteRoleById(Role role);
	
	public int deleteUserRoleByRoleid(String roleid);
	
	public List selectAllUserByRoleid(String roleid);
}
