package com.neuedu.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.neuedu.dao.RoomDAO;
import com.neuedu.entity.House;
import com.neuedu.entity.Room;
import com.neuedu.util.DBManager;

public class RoomDAOImpl implements RoomDAO {

	@Override
	public List<Room> findRoomList(String type, String minPrice, String maxPrice, String minDistance,
			String maxDistance,int page) {
		DBManager dbManager = DBManager.getInstance();
		String sql = "select * from room where distance > ? and distance < ? and price > ? and price < ? and type =? order by price asc";
		sql += " limit ?, 20";
		ResultSet rs = dbManager.execQuery(sql, minDistance, maxDistance, minPrice, maxPrice,type, page);
		List<Room> list = new ArrayList<>();

		try {
			while (rs.next()) {
				Room room = new Room();
				room.setRoomid(rs.getString(1));
				room.setType(rs.getString(2));
				room.setPrice(rs.getString(3));
				room.setDistance(rs.getString(4));

				list.add(room);

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
