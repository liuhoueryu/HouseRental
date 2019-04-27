package com.neuedu.service.impl;

import java.util.List;

import com.neuedu.dao.HouseDAO;
import com.neuedu.dao.impl.HouseDAOImpl;
import com.neuedu.entity.House;
import com.neuedu.service.HouseService;

public class HouseServiceImpl implements HouseService {
	private HouseDAO houseDAO = new HouseDAOImpl();

	@Override
	public List<House> getHouseList(String province, String city,int page) {
		return houseDAO.findHouseList(province, city,page);
	}

}
