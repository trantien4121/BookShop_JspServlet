package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

import bean.hoadonbean;
import bean.lichsumuahangbean;

public class hoadondao {
	public boolean themHoaDon(int MaHoaDon, int makh, String ngaymua, int damua) {
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		String sql = "INSERT INTO HoaDon(MaHoaDon, makh, NgayMua, damua)\n" +
				"valUES(?,?,?,?)";
		try {
			PreparedStatement ps = kn.cn.prepareStatement(sql);
			ps.setInt(1, MaHoaDon);
			ps.setInt(2, makh);
			ps.setString(3, ngaymua);
			ps.setInt(4, damua);

			return ps.executeUpdate() > 0;
		} catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
	public boolean suaHoaDon(int MaHoaDon) throws Exception{
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		String sql = "UPDATE HoaDon\n" +
				"set damua=1 where MaHoaDon=?";
		try {
			PreparedStatement ps = kn.cn.prepareStatement(sql);
			ps.setInt(1, MaHoaDon);

			return ps.executeUpdate() > 0;
		} catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
	public ArrayList<hoadonbean> getHoaDon(int makh) throws Exception{
		ArrayList<hoadonbean> list = new ArrayList<hoadonbean>();
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		String sql = "select * from HoaDon where makh='"+ makh + "'" ;
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		while(r.next()) {
			hoadonbean hd = new hoadonbean(r.getInt(1), r.getInt(2), r.getString(3), r.getInt(4));
			list.add(hd);
		}
		return list;
	}
	public int getTongHoaDon(int makh) throws Exception{
		int soHoaDon =0;
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		String sql = "select count(MaHoaDon) from HoaDon where makh='"+ makh + "' and damua=0"  ;
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		
		while(r.next()) {
			soHoaDon = r.getInt(1);
		}
		return soHoaDon;
	}
	
	public ArrayList<lichsumuahangbean> getLichSuMuaHang(int makh) throws Exception{
		ArrayList<lichsumuahangbean> list = new ArrayList<lichsumuahangbean>();
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		String sql = "select * from LsMuaHang where makh='" + makh + "'";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		while(r.next()) {
			lichsumuahangbean ls = new lichsumuahangbean(r.getInt(1), r.getString(2), r.getString(3), r.getLong(4), 
					r.getLong(5), r.getLong(6), r.getInt(7), r.getInt(8));
			list.add(ls);
		}
		return list;
	}
	public int getTongLichSuMua(int makh) throws Exception{
		int soHoaDon =0;
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		String sql = "select count(MaHoaDon) from LsMuaHang where makh='"+ makh + "'";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		
		while(r.next()) {
			soHoaDon = r.getInt(1);
		}
		return soHoaDon;
	}
	public int getMaxOfMaHoaDon() throws Exception{
		int max = 0;
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		String sql = "select max(MaHoaDon) from HoaDon";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		
		while(r.next()) {
			max = r.getInt(1);
		}
		return max;
	}
}
