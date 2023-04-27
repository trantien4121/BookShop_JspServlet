package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.dangnhapadminbean;

public class dangnhapadmindao {
	public dangnhapadminbean ktdn(String tendn, String pass) {
		try {
			KetNoi kn= new KetNoi();
			kn.KetNoi();
			String sql="select * from DangNhap where TenDangNhap=? and MatKhau=?";
			PreparedStatement cmd= kn.cn.prepareStatement(sql);
			cmd.setString(1, tendn);
			cmd.setString(2, pass);
			ResultSet rs=cmd.executeQuery();
			dangnhapadminbean dn=null;
			if(rs.next()) {
				  String TenDangNhap=rs.getString("TenDangNhap");
				  String MatKhau=rs.getString("MatKhau");
				  boolean Quyen=rs.getBoolean("Quyen");
				  dn=new dangnhapadminbean(TenDangNhap, MatKhau, Quyen);
			}
			rs.close();kn.cn.close();
			return dn;
		} catch (Exception e) {
			e.printStackTrace();return null;
		}
	}
}
