package dogo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dogo.model.Function;
import dogo.model.Role;
import dogo.model.User;
import dogo.model.UserRole;
import dogo.modeljson.AjaxJson;
import dogo.service.FunctionServiceI;
import dogo.service.RoleServiceI;
import dogo.service.UserServiceI;
import dogo.util.Page;
import dogo.util.Params;

/**
 * 用户控制类
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/userControl/*")
public class UserController {
	
	private static final Logger log = Logger.getLogger(UserController.class);
	
	/**
	 * 用户service
	 */
	private UserServiceI userService;
	
	private FunctionServiceI functionServiceI;
	
	private RoleServiceI roleService;
	
	public UserServiceI getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}
	
	
	public FunctionServiceI getFunctionServiceI() {
		return functionServiceI;
	}
	@Autowired
	public void setFunctionServiceI(FunctionServiceI functionServiceI) {
		this.functionServiceI = functionServiceI;
	}

	/**
	 * 验证用户名密码是否唯一
	 * @param userVo
	 * @param request
	 * @return
	 * 
	 */
	@RequestMapping(value = "/loginVal.do")
	@ResponseBody
	public String loginVal(User user, HttpServletRequest request){
		try {
			User u = userService.yzdl(user);
			String count = "0";
			if (u!=null) {
				request.getSession().setAttribute("loginUser", u);
				count = "1";
			}
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			return "";
		}
	}
    /**
     * 登陆成功跳转
     * @param request
     * @param userVo
     * @return
     */
	@RequestMapping(value = "/loginBackstage.do", method = RequestMethod.POST)
	public String loginBackstage(HttpServletRequest request, User user){
		try{
		if (user.getUsercode() == null || "".equals(user.getUsercode())) {
			user = (User) request.getSession().getAttribute("loginUser");
			request.getSession().removeAttribute("loginUser");
		}
		User u = userService.yzdl(user);
		request.getSession().setAttribute("loginUser", u);
		return "jsp/main/main";
		}catch(Exception e){
			log.error(e);
			return "";
		}
	}
	
	/**
	 * 注销
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/systemOut1.do")
	public String systemOut1(HttpServletRequest request, Model model) {
		request.getSession().invalidate();
		return "jsp/system/login";
	}
	/**
	 * 查看所有用户 根据用户id查询出该用户的角色
	 * @param userVo
	 * @return
	 */
	@RequestMapping(value = "/selectAllUser.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectAllUser(User user,Page page) {
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("user", user);
		res.put("page", page);
		try{
		int recordsCount = userService.selectAllCount(res);
		List<User> list = userService.selectAllUserByPage(res);
		res.put("rows", list);
		res.put("page", page.getPage());
		res.put("total", recordsCount);
		}catch (Exception e) {
			log.error(e);
			return res;
		}
		return res;
	}
	/**
	 * 删除所有用户
	 * @param vo
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/deleteAllUser.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson deleteAllUser(User vo,String ids, HttpServletResponse response) {
		AjaxJson ajaxJson=new AjaxJson();
		try{
		if(ids!=null&&!"".equals(ids)){
			String[] id=ids.split(",");
			for(int i=0;i<id.length;i++){
				userService.deleteRoleByUserId(id[i]);
				vo.setUserid(id[i]);
				userService.deleteUser(vo);
			}
		}else{
			userService.deleteRoleByUserId(vo.getUserid());
			userService.deleteUser(vo);
		}
		ajaxJson.setMsg("删除成功");
		}catch(Exception e){
			log.error(e);
			ajaxJson.setMsg("删除失败");
		}
		return ajaxJson;
	}
	/**
	 * 增加用户
	 * @param userVo
	 * @param response
	 */
	@RequestMapping(value = "/insertUser.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson insertUser(User userVo,HttpServletResponse response)  {
		userVo.setUserid(Params.getCode());
		AjaxJson ajaxJson=new AjaxJson();
		try {
			User po=userService.findUserByUserCode(userVo);
			if(po!=null){
				ajaxJson.setMsg("登录账号已存在");
			}else{
				userService.insertUser(userVo);
				ajaxJson.setMsg("保存成功");
			}
		} catch (Exception e) {
			log.error(e);
			ajaxJson.setMsg("保存失败");
		}
		return ajaxJson;
		
	}
	/**
	 *根据ID查询详细信息
	 * @param userVo
	 * @return
	 */
	@RequestMapping(value = "/selectUserById.do", method = RequestMethod.POST)
	@ResponseBody
	public User selectUserById(User userVo)  {
		try{
		User userVo2 = userService.selectUserById(userVo);
		return userVo2;
		}catch(Exception e){
			log.error(e);
			return null;
		}
	}
	/**
	 * 用户修改
	 * @param userVo
	 * @param response
	 */
	@RequestMapping(value = "/updateUser.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson updateUser(User userVo,HttpServletResponse response)  {
		AjaxJson ajaxJson=new AjaxJson();
		try {
			User po=userService.findUserByUserCode(userVo);
			if(po!=null&&!po.getUserid().equals(userVo.getUserid())){
				ajaxJson.setMsg("登录账号已存在");
			}else{
				userService.updateUser(userVo);
				ajaxJson.setMsg("保存成功");
			}
		} catch (Exception e) {
			log.error(e);
			ajaxJson.setMsg("保存失败");
		}
		return ajaxJson;
	}
	/**
	 * 查询所有角色名称
	 * @return
	 */
	@RequestMapping(value = "/selectAllRolesName.do", method = RequestMethod.POST)
	@ResponseBody
	public List<Role> selectAllRolesName()  {
		try{
		List<Role> role = roleService.selectAll();
		if (role.size() == 0) {
			role = null;
		}
		return role;
		}catch(Exception e){
			log.error(e);
			return null;
		}
		
	}
	/**
	 * 查询角色名称
	 * @param request
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/selectRoleName.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectRoleName(HttpServletRequest request, UserRole vo) {
		try{
		Map<String, Object> res = new HashMap<String, Object>();
		String userid = request.getParameter("userId");
		vo.setUserid(userid);
		String role = userService.selectRoleName(vo);
		res.put("userdata", role);

		return res;
		}catch(Exception e){
			log.error(e);
			return null;
		}
	}
	/**
	 * 新增分配角色
	 * @param request
	 * @param response
	 * @param vo
	 */
	@RequestMapping(value = "/addRolesName.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson addRolesName(HttpServletRequest request, HttpServletResponse response ,UserRole vo) {
		AjaxJson ajaxJson=new AjaxJson();
		try {
			String roleid = request.getParameter("roleid");
			String userid = request.getParameter("userid");
			vo.setUserroleid(Params.getCode());
			vo.setRoleid(roleid);
			vo.setUserid(userid);
			// 删除分配角色
			userService.deleteRoleByUserId(userid);
			// 新增分配角色
			userService.addRolesName(vo);
			ajaxJson.setMsg("分配角色新增成功");
		} catch (Throwable e) {
			log.error(e);
			ajaxJson.setMsg("分配角色新增失败");
		}
		return ajaxJson;
	}
	/** 查询菜单树
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/showTreeMenu.do", method = RequestMethod.GET)
	public String zTreeShow(Model model, HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("loginUser");
		String userId = "";
		if(user!=null){
			userId = user.getUserid();
		}
		List<Function> parentList = functionServiceI.getAllParentFunctionByUserId(userId); // 根据用户Id,查询该用户拥有的一级菜单
		List<String> childList = functionServiceI.selectChildZtree(parentList,request, userId); // 根据用户ID,一级菜单获取该用户拥有的二级,三级菜单
		model.addAttribute("pList", parentList);
		model.addAttribute("cList", childList);
		//model.addAttribute("cList", "[{id : \"1002\",pId:\"1001\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_close.png\",name: \"角色管理\",open:true ,attributes:{\"url\" :\"/xxsb/jsp/role/rolelist.jsp\"}},{id : \"1003\",pId:\"1001\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_close.png\",name: \"用户管理\",open:true ,attributes:{\"url\" :\"/xxsb/jsp/user/userlist.jsp\"}},{id : \"1005\",pId:\"1001\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_close.png\",name: \"菜单管理\",open:true ,attributes:{\"url\" :\"/xxsb/jsp/function/functionlist.jsp\"}},{id : \"1001\",pId:\"1000\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_open.png\",name: \"基础管理\",open:true },{id : \"1009\",pId:\"1007\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_close.png\",name: \"文本回复\",open:true ,attributes:{\"url\" :\"/xxsb/jsp/wenben/wenbenlist.jsp\"}},{id : \"1007\",pId:\"1000\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_open.png\",name: \"微信管理\",open:true },{id : \"1011\",pId:\"1010\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_close.png\",name: \"报送信息\",open:true ,attributes:{\"url\" :\"/xxsbnull\"}},{id : \"1012\",pId:\"1010\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_close.png\",name: \"约稿回复\",open:true ,attributes:{\"url\" :\"/xxsbnull\"}},{id : \"1013\",pId:\"1010\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_close.png\",name: \"定向约稿\",open:true ,attributes:{\"url\" :\"/xxsbnull\"}},{id : \"1014\",pId:\"1010\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_close.png\",name: \"公共信息\",open:true ,attributes:{\"url\" :\"/xxsbnull\"}},{id : \"1015\",pId:\"1010\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_close.png\",name: \"待审核信息\",open:true ,attributes:{\"url\" :\"/xxsbnull\"}},{id : \"1016\",pId:\"1010\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_close.png\",name: \"信息列表\",open:true ,attributes:{\"url\" :\"/xxsbnull\"}},{id : \"1017\",pId:\"1010\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_close.png\",name: \"信息交流\",open:true ,attributes:{\"url\" :\"/xxsbnull\"}},{id : \"1018\",pId:\"1010\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_close.png\",name: \"分数统计\",open:true ,attributes:{\"url\" :\"/xxsbnull\"}},{id : \"1010\",pId:\"1000\",icon:\"/xxsb/css/zTreeStyle/img/diy/1_open.png\",name: \"报送管理\",open:true }]");
		return "jsp/main/west";
	}

	public RoleServiceI getRoleService() {
		return roleService;
	}
	@Autowired
	public void setRoleService(RoleServiceI roleService) {
		this.roleService = roleService;
	}

	/**//**
	 * 修改用户密码
	 * @param request
	 * @param vo
	 * @param response
	 * @param userVo1
	 *//*
	@RequestMapping(value = "/updateUserPwd.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateUserPwd(HttpServletRequest request, UserRoleVo vo,HttpServletResponse response,UserVo userVo1) {
		try {
			String userId = ((UserVo) request.getSession()
					.getAttribute("loginUser")).getUSERCODE();
			UserVo userVo = new UserVo();
			userVo.setUSERCODE(userId);
			userVo = userService.findUserVo(userVo);
			String oldPwd = userVo.getUSERPWD();
			String userOldPwd = userVo1.getUserOldPwd();
			String userPwd = userVo1.getUserPwd();
			if(!oldPwd.equals(userOldPwd)){
				Params.print("nosame", response);
			}else{
				userVo.setUSERPWD(userPwd);
				userService.updateUser(userVo);
				Params.print("success", response);
			}
		} catch (Throwable e) {
			log.error(e);
			Params.print("fail", response);
		}
	}*/



	


	
	
	
}
