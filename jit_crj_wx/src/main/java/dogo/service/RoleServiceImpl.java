package dogo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.FunctionRoleMapper;
import dogo.dao.RoleMapper;
import dogo.dao.UserRoleMapper;
import dogo.model.FunctionRole;
import dogo.model.Role;
import dogo.model.UserRole;

@Service
public class RoleServiceImpl implements RoleServiceI {
	private RoleMapper roleMapper;
	private UserRoleMapper userRoleMapper;
	private FunctionRoleMapper functionRoleMapper;
	public List<Role> selectAll() {
		return roleMapper.selectAll();
	}
	public List<Role> selectAllPage(Map<String,Object> map) {
		return roleMapper.selectAllPage(map);
	}
	public String selectAllCount(Map<String,Object> map){
		return roleMapper.selectAllCount(map);
	}
	public Role selectById(String roleid) {
		return roleMapper.selectByPrimaryKey(roleid);
	}
	public int insert(Role role) {
		return roleMapper.insert(role);
	}
	public int updateByPrimaryKeySelective(Role role) {
		return roleMapper.updateByPrimaryKeySelective(role);
	}
	public RoleMapper getRoleMapper() {
		return roleMapper;
	}
	public List<FunctionRole> selectFunctionRole(String roleid) {
		return functionRoleMapper.selectAllByRoleid(roleid);
	}
	public int deleteFunctionByRoleId(String roleid) {
		return functionRoleMapper.deleteFunctionByRoleId(roleid);
	}
	public int addFunctionRole(FunctionRole functionrole) {
		return functionRoleMapper.insert(functionrole);
	}
	public int deleteRoleById(Role role){
		return roleMapper.deleteByPrimaryKey(role.getRoleid());
	}
	
	public int deleteUserRoleByRoleid(String roleid){
		return userRoleMapper.deleteByRoleid(roleid);
	}
	public List selectAllUserByRoleid(String roleid) {
		return userRoleMapper.selectAllUserByRoleid(roleid);
	}
	
	@Autowired
	public void setRoleMapper(RoleMapper roleMapper) {
		this.roleMapper = roleMapper;
	}
	public FunctionRoleMapper getFunctionRoleMapper() {
		return functionRoleMapper;
	}
	@Autowired
	public void setFunctionRoleMapper(FunctionRoleMapper functionRoleMapper) {
		this.functionRoleMapper = functionRoleMapper;
	}
	public UserRoleMapper getUserRoleMapper() {
		return userRoleMapper;
	}
	@Autowired
	public void setUserRoleMapper(UserRoleMapper userRoleMapper) {
		this.userRoleMapper = userRoleMapper;
	}
	
	
}
