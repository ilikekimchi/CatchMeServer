package jj.j2.sh.dao;

import java.util.List;

import jj.j2.sh.model.Area;

public interface AreaDao {

	void add(Area area);

	void update(Area area);

	List<Area> list();

	List<Area> area2List(int areaCode);

}