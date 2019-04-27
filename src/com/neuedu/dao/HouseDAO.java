package com.neuedu.dao;

import java.util.List;

import com.neuedu.entity.House;

public interface HouseDAO {
	List<House> findHouseList(String province,String city,int page);
}
