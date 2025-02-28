package com.core.tjoeun.mnHome.setting.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface SettingService {

	List<Map<String, Object>> selectSettingUserStorage(String userNickname) throws Exception;
	
	public void updateAllocationOff(Map map) throws Exception;
	
	public void updateAllocationOn(Map minimiMap) throws Exception;

	public Map getSearchUser(Map map) throws Exception;
	
	public int insertFriendRequest(Map map) throws Exception;
	
	public List<HashMap> selectFriends(Map map);
	
	public void updateFriends(Map map) throws Exception;
	
	public List<Map> selectDotoriUse(String userNickname);
	
	public List<Map> selectDotoriCharge(String userNickname);

	public List<Map<String, Object>> selectSkinMenu(Map map);
	
	public List<Map<String, Object>> allocationOnSkinMenu(Map map);
	
	public int changeName (Map map) throws Exception;
	
	public int changeNickname (Map map) throws Exception;
	
	public int changeNumber (Map map) throws Exception;
	
	public List<Map> selectMyBgm(Map map);
	
	public int addPlayList(Map param);
	
	public int removePlayList(Map param);
	
	public List<Map> selectPlayList(String userNickname);
	
	public String selectPhone(String userNickname);
}
