package com.core.tjoeun.mnHome.album.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AlbumController {
	
	@RequestMapping(value="/miniHome/album")
	public String albumView() {
		
		return "miniHome/album";
	}
}

