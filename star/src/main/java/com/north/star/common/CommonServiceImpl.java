package com.north.star.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommonServiceImpl implements CommonService{

	@Autowired
	private CommonDAO Dao;
   
	
	public int testNum() {
		return Dao.testNum();
	}
}
  