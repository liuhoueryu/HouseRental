package com.neuedu.dao;

import java.util.List;


import com.neuedu.entity.Room;

public interface RoomDAO {
	List<Room> findRoomList(String type, String minPrice, String maxPrice, String minDistance, String maxDistance,
			int page);
}
