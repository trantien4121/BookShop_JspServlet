package bo;

import java.util.ArrayList;
import java.util.Date;

import bean.chitiethoadonbean;


public class chitiethoadonbo {
	public ArrayList<chitiethoadonbean> ds = new ArrayList<chitiethoadonbean>();
	public ArrayList<chitiethoadonbean> themChiTietHoaDon(int MaChiTietHoaDon, String MaSach, int SoLuongMua, int MaHoaDon) {
		ds.add(new chitiethoadonbean(MaChiTietHoaDon, MaSach, SoLuongMua, MaHoaDon));
		return ds;
	}

}
