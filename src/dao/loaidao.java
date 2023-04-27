package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getLoai(){
		ArrayList<loaibean> ds= new ArrayList<loaibean>();
		
		try {
			//b1: Ket noi vao csdl
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			//b2: Lay du lieu ve
			String sql = "select * from loai";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//b3: Luu tat ca du lieu vao mang ds
			while(rs.next()) {
				String maloai = rs.getString("maloai");
				String tenloai = rs.getString("tenloai");
				ds.add(new loaibean(maloai, tenloai));
			}
			//b4: Dong ket noi
			rs.close();
			kn.cn.close();
			return ds;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
		
		/*ds.add(new loaibean("tin", "Công nghệ thông tin"));
		ds.add(new loaibean("toan", "Toán kinh tế"));
		ds.add(new loaibean("ly", "Vật lý"));
		ds.add(new loaibean("hoa", "Hóa hữu cơ"));
		
		return ds;*/	//Truoc khi key noi sql
		
		public boolean themLoai(String maloai, String tenloai) {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			if (maloai.equals("") || tenloai.equals("") ) {
				return false;
			} else {
//				String sql = "INSERT INTO DangNhap (TenDangNhap, MatKhau, Quyen)\n" +
//						"vaLUES (?,?,?)";
				String sql = "INSERT INTO loai(maloai, tenloai)\n" + "valUES (?,?)";
				try {
					PreparedStatement ps = kn.cn.prepareStatement(sql);
					ps.setString(1, maloai);
					ps.setString(2, tenloai);
					return ps.executeUpdate() > 0;
				} catch (Exception e) {
					e.printStackTrace();
				}
				return true;
			}
		}
		public boolean xoaLoai(String maloai) {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			if (maloai.equals("")) {
				return false;
			} else {
				String sql = "DELETE FROM loai where maloai=?";
				try {
					PreparedStatement ps = kn.cn.prepareStatement(sql);
					ps.setString(1, maloai);
					return ps.executeUpdate() > 0;
				} catch (Exception e) {
					e.printStackTrace();
				}
				return true;
			}
		}
		
		public boolean suaLoai(String maloaicu, String maloaimoi, String tenloai) {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			if (maloaimoi.equals("") || tenloai.equals(" ")) {
				return false;
			} else {
				String sql = "update loai\r\n"
						+ "set maloai=?, tenloai=? where maloai =?";
				try {
					PreparedStatement ps = kn.cn.prepareStatement(sql);
					ps.setString(1, maloaimoi);
					ps.setString(2, tenloai);
					ps.setString(3, maloaicu);
					return ps.executeUpdate() > 0;
				} catch (Exception e) {
					e.printStackTrace();
				}
				return true;
			}
		}
}
