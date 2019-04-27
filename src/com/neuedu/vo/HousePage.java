package com.neuedu.vo;

import java.util.List;

import com.neuedu.entity.House;
import com.neuedu.entity.Weather;


public class HousePage {
	private Integer pageSize; // ��ҳ��С
	private Integer currentPage=0; // ��ǰҳ��
	private Integer totalCount; // �ܼ�¼��
	private Integer totalPage; // ��ҳ��

	private List<House> list; // �����б�
	private static HousePage housePage=new HousePage();
	private HousePage() {
	}
	public static HousePage getInstance() {
		return housePage;
	}
	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public void addPage(Integer current) {
		this.currentPage=currentPage+current;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public List<House> getList() {
		return list;
	}

	public void setList(List<House> list) {
		this.list = list;
	}

	public Integer getBegin() {
		return begin;
	}

	public void setBegin(Integer begin) {
		this.begin = begin;
	}

	public Integer getEnd() {
		return end;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	private Integer begin; // ��ʼҳ��
	private Integer end; // ����ҳ��
}
