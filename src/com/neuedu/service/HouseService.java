package com.neuedu.service;

import java.util.List;

import com.neuedu.entity.House;

public interface HouseService {
	List<House> getHouseList(String province,String city,int page);
}
