package dao;

import java.sql.PreparedStatement;

public class chitiethoadondao {
	public boolean themChiTietHoaDon(String masach, int soluongmua, int mahoadon) {
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		String sql = "INSERT INTO ChiTietHoaDon(MaSach, SoLuongMua, MaHoaDon)\n" +
				"valUES(?,?,?)";
		try {
			PreparedStatement ps = kn.cn.prepareStatement(sql);
			ps.setString(1, masach);
			ps.setInt(2, soluongmua);
			ps.setInt(3, mahoadon);

			return ps.executeUpdate() > 0;
		} catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
}
