package com.neuedu.service.impl;

import java.util.List;

import com.neuedu.dao.RoomDAO;
import com.neuedu.dao.impl.RoomDAOImpl;
import com.neuedu.entity.Room;
import com.neuedu.service.RoomService;

public class RoomServiceImpl implements RoomService {
	private RoomDAO roomDAO = new RoomDAOImpl();

	@Override
	public List<Room> getRoomList(String type, String minPrice, String maxPrice, String minDistance, String maxDistance,
			int page) {
		return roomDAO.findRoomList(type, minPrice, maxPrice, minDistance, maxDistance,page);
	}

}
