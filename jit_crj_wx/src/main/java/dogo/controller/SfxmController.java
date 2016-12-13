package dogo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dogo.model.Sfxm;
import dogo.service.RoleServiceI;
import dogo.service.SfxmServiceI;
import dogo.weixin.core.WeiXinUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sfxmcontroller")
public class SfxmController{
	
	@Autowired
	private SfxmServiceI sfxmServiceI;
	
    @RequestMapping(value = "getSfxmByYwbh")
    @ResponseBody
    public Map<String,Object> getSfxmByYwbh(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
	    String ywbh=request.getParameter("ywbh");
	    String jyh=request.getParameter("jyh");
	    List<Sfxm> sfxm = sfxmServiceI.getSfxmByWhbh(ywbh,jyh);
	    String saomaType = sfxmServiceI.getSfjf(ywbh);
	    Map<String,Object> map=new HashMap<String,Object>();
//	    map.put("ywbh",sfxm.getYwbh());
//	    map.put("ywlbmc",sfxm.getYwlbmc());
//	    map.put("stfje",sfxm.getStfje());
//	    map.put("saomaType",saomaType); 
	    map.put("list", sfxm);
	    return map;
    }
    @RequestMapping(value = "getSfRyxxByYwbh")
    @ResponseBody
    public Map<String,Object> getSfRyxxByYwbh(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
	    String ywbh=request.getParameter("ywbh");
	    Map<String,Object> remap=new HashMap<String,Object>();
	    remap = sfxmServiceI.getSfRyxxByWhbh(ywbh);
	    return remap;
    }
}
