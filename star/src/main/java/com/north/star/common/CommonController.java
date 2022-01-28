package com.north.star.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

@RequestMapping("/common/*")
public class CommonController {

	
	  @Autowired 
	  private CommonService service;
	  

  
   @RequestMapping("main")
   public String selectLikeCount() {
      return "common/main";
   }
	
}
   