package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.khachhangbean;

public class khachhangdao {
	
	public khachhangbean ktdn(String tendn, String pass) {
		try {
			KetNoi kn= new KetNoi();
			kn.KetNoi();
			String sql="select * from KhachHang where tendn=? and pass=?";
			PreparedStatement cmd= kn.cn.prepareStatement(sql);
			cmd.setString(1, tendn);
			cmd.setString(2, pass);
			ResultSet rs=cmd.executeQuery();
			khachhangbean kh=null;
			if(rs.next()) {
				long makh=rs.getLong("makh");
				String hoten=rs.getString("hoten");
				String diachi=rs.getString("diachi");
				String sodt=rs.getString("sodt");
				String email=rs.getString("email");
				kh=new khachhangbean(makh, hoten, diachi, sodt, email, tendn, pass);
			}
			rs.close();kn.cn.close();
			return kh;
		} catch (Exception e) {
			e.printStackTrace();return null;
		}

	}
	
	public static void main(String[] args) {
		
	}
}
