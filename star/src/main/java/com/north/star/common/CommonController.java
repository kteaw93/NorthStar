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
	   System.out.println("되람나ㅣㅇ롱나ㅣㅗㄹ머ㅏㅣ오러ㅏㅣ몬어ㅏ");
	   int k = service.testNum();
	   System.out.println("디비데이터느ㅜㄴ" + k);
      return "common/main";
   }
	
}
