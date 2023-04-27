package bo;

import java.util.ArrayList;

import bean.lichsumuahangbean;

public class lichsumuahangbo {
	public ArrayList<lichsumuahangbean> ds = new ArrayList<lichsumuahangbean>();
	public ArrayList<lichsumuahangbean> themLichSuMuaHang(int MaHoaDon, String tensach, String NgayMua, long SoLuongMua, long gia, long ThanhTien, int damua, int makh) {
		ds.add(new lichsumuahangbean(MaHoaDon, tensach, NgayMua, SoLuongMua, gia,ThanhTien, damua, makh));
		return ds;
	}
}
