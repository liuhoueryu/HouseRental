package com.neuedu.service;

import java.util.List;

import com.neuedu.entity.Room;

public interface RoomService {
	List<Room> getRoomList(String type,String minPrice,String maxPrice,String minDistance,String maxDistance,int page);
}
