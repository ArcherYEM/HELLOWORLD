package com.core.tjoeun.index.member.sql;

import java.util.List;
import java.util.Map;

public interface MemberMapper {

	public int insertUserInfo(Map map);
	
	public Map selectUserInfo(Map map);
	
	public Map selectUserId(Map map);
	
	public int updatePw(Map map);
	
	public String selectUserMinimi(String userNickname);
	
	public int insertUserDotori(String userNickname);
	
	public int insertUserDotoriC(Map map);
	
	public int insertMiniroomBackground(String userNickname);
	
	public int insertMiniroomMinimi(String userNickname);
	
	public int insertMinihomeTitle(String userNickname);

	public int insertUserProfile(String userNickname);
	
	public int insertUserStorage(String userNickname);
	
	public String selectUserName(String userNickname);
	
	public int selectRequest(String userNickname);
	
	public int insertLoginStatus(String userNickname);
	
	public int loginOnStatus(String userNickname);
	
	public int loginOffStatus(String userNickname);
	
	public int insertLoginLog(String userNickname);
	
	public List<Map> selectOnFriendCnt(String userNickname);
	
	public int insertUserStorageSkin(String userNickname);
	
	public int insertUserStorageMenu(String userNickname);
	
	public int insertVisitCnt(String userNickname);
	
	public String selectUserGender(String userNickname);
	
	public Map getFriendCount(String userNickname);
}
