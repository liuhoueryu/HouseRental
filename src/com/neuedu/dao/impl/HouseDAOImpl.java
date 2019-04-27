package com.neuedu.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.neuedu.dao.HouseDAO;
import com.neuedu.entity.House;
import com.neuedu.entity.Weather;
import com.neuedu.util.DBManager;

public class HouseDAOImpl implements HouseDAO {
	
	@Override
	public List<House> findHouseList(String province, String city,int page) {
		DBManager dbManager = DBManager.getInstance();
		String sql = "select * from house where city like ? and province like ? order by province asc, city asc";
		sql += " limit ?, 20";
		ResultSet rs = dbManager.execQuery(sql, "%" + city + "%", "%" + province + "%",page);
		List<House> list = new ArrayList<>();

		try {
			while (rs.next()) {
				House house = new House();
				house.setProvince(rs.getString(2));
				house.setCity(rs.getString(3));
				house.setPrice(rs.getString(4));
				house.setTrend(rs.getString(5));
				house.setDate(rs.getString(6));


				list.add(house);

			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbManager.closeConnection();
		}
		return null;
	}

}
