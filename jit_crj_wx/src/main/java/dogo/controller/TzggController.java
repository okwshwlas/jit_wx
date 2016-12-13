package dogo.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dogo.model.Tzgg;
import dogo.service.TzggServiceI;

@Controller
@RequestMapping("/proscenium/tzggController/")
public class TzggController {
	
	private static final Logger log = Logger.getLogger(TzggController.class);
	@Autowired
	private TzggServiceI TzggServiceI;
	
	/**
	 * 查询通知个人通知公告
	 * @param tzgg
	 * @return
	 */
	@RequestMapping(value = "/selectAllTzgg.do", method = RequestMethod.POST)
	@ResponseBody
	public List<Tzgg> selectAllTzgg(Tzgg tzgg) {
		tzgg.setDisplayState("发布");
		tzgg.setType("2");
		List<Tzgg> tzggs = new ArrayList<Tzgg>();;
		try {
			tzggs = TzggServiceI.selectAllTzggByIdcardAndstatue(tzgg);
			return tzggs;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			return tzggs;
		}
	}
	
	@RequestMapping(value = "/selectById.do", method = RequestMethod.POST)
	@ResponseBody
	public Tzgg selectById(String id){
		Tzgg tzgg = new Tzgg();
		try {
			tzgg = TzggServiceI.selectById(id);
			return tzgg;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			return tzgg;
		}
		
	}
	
	
	
}
