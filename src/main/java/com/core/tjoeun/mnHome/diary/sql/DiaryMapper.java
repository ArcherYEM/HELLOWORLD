package com.core.tjoeun.mnHome.diary.sql;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface DiaryMapper {
	
	public int insertDiary(Map map);

	public List<Map> selectDiary(Map map);
	
	public int deleteDiary(ArrayList<String> list);
	
	public int modifyDiary(Map map);
	
	public int insertDiaryCMT(Map map);
	
	public ArrayList<String> selectDiarySeq (String userNickname);

	public List<HashMap> selectDiaryCMT (String userNickname);
	
	
}
