package com.north.star.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping("boardList")
	public String boardList() {
		return "board/boardList";
	}
	 
	@RequestMapping("boardArea")
	@ResponseBody
	public List boardArea() {
		System.out.println(service.boardArea());
		return service.boardArea();
		
		
	}
}
