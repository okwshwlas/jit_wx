package dogo.service;

import java.util.List;
import java.util.Map;

import dogo.model.User;
import dogo.model.UserRole;

public interface UserServiceI {
	
	public User selectByWhere(User record);
	
	public User yzdl(User record);
	
	public List<User>selectAllUserByPage(Map<String, Object> map);
	
	public int selectAllCount(Map<String, Object> map);
	
	public List<User> selectAllUserByRoleid(String roleid);
	
	public String selectRoleName(UserRole userRole);
	
	public int deleteRoleByUserId(String userid);

	public int addRolesName(UserRole userRole);
	
	User selectUserById(User userVo);
	
	public User findUserByUserCode(User user);
	
	public int updateUser(User user);
	
	public int insertUser(User user);
	
	public int deleteUser(User user);
}
