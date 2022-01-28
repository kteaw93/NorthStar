package com.north.star.react.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/react/*")
public class ReactCommonController {

	 @RequestMapping("main")
	   public String selectLikeCount() {
		   System.out.println("되람나ㅣㅇ롱나ㅣㅗㄹ머ㅏㅣ오러ㅏㅣ몬어ㅏ");
		   
	      return "react/main";
	   }
}
 