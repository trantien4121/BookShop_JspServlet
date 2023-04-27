package bo;

import java.util.ArrayList;
import java.util.Date;

import bean.hoadonbean;

public class hoadonbo {
	public ArrayList<hoadonbean> ds = new ArrayList<hoadonbean>();
	public ArrayList<hoadonbean> themHoaDon(int MaHoaDon, int makh, String NgayMua, int damua ) {
		ds.add(new hoadonbean(MaHoaDon, makh, NgayMua, damua ));
		return ds;
	}
}
