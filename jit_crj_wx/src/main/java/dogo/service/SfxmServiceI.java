package dogo.service;

import java.util.List;
import java.util.Map;

import dogo.model.Sfxm;

public interface SfxmServiceI {
	
	public List<Sfxm> getSfxmByWhbh(String ywbh,String jyh)  ;

	public String getSfjf(String ywbh);

	public Map<String, Object> getSfRyxxByWhbh(String ywbh);  
	
}
