package com.core.tjoeun.mnHome.album.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.core.tjoeun.index.member.service.MemberService;
import com.core.tjoeun.mnHome.album.service.AlbumService;
import com.core.tjoeun.mnHome.main.service.MainService;

@Controller
public class AlbumController {
	
	@Value("${file.upload.path}")
    private String fileUploadPath;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MainService mainService;
	
	@Autowired
	AlbumService albumService;
	
	@RequestMapping(value="/mnHome/albumView/{userNickname}")
	public String albumView(@PathVariable String userNickname, Model model) {
		
		Map profile = mainService.getProfile(userNickname);
		String image = (String) profile.get("image");
		String msg = (String) profile.get("msg");
		msg = msg.replace("\n", "<br>");
		model.addAttribute("image", image);
		model.addAttribute("msg", msg);
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
		Map userMap = new HashMap();
		userMap.put("userNickname", userNickname);
		
		List<HashMap> listResult = albumService.getAlbum(userMap);
		
		String[] images = new String[listResult.size()];
		String tempPath = "";
		
		for(int i=0; i<listResult.size(); i++){
			tempPath = listResult.get(i).get("imagePath").toString();
			System.out.println("1996 : " + i + " : " + tempPath);
			if(tempPath.indexOf(',') > 0) {
				images[i] = tempPath.substring(0,tempPath.indexOf(','));
				System.out.println(images[i]);
			}else {
				images[i] = tempPath;
			}
		}
		
//		String imgPath = listResult.get(3).get("imagePath").toString();
//		System.out.println("1996 : " + imgPath.substring(0, imgPath.indexOf(',')));
		
		model.addAttribute("list", albumService.getAlbum(userMap));
		model.addAttribute("images", images);
		
		return "miniHome/album";
	}
	
	@RequestMapping(value="/mnHome/albumWriteView/{userNickname}")
	public String albumWriteView(@PathVariable String userNickname, Model model) {
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		return "miniHome/albumWrite";
	}
	
	@RequestMapping(value="/mnHome/albumWrite/{userNickname}")
	@ResponseBody
	public Map albumWrite(@PathVariable String userNickname
							, @RequestPart(value = "contents")Map map
							, @RequestPart(value = "uploadFile") MultipartFile[] uploadFile) {
		Map result = new HashMap<String, String>();
		try {
			map.put("userNickname", userNickname);
			map.put("openScope", 1);
			
			albumService.insertAlbum(uploadFile, map);
			result.put("resultCode", "1");
		} catch (Exception e) {
			result.put("resultCode", "0");
			e.printStackTrace();
			return result;
		}
		
		return result ;
	}
	
	
	
	
}

