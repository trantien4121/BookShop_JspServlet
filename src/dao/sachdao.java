package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;
import bean.sachbean;

public class sachdao {
	public ArrayList<sachbean> getSach(int start, int num){
		ArrayList<sachbean> ds= new ArrayList<sachbean>();
		
		try {
			//b1: Ket noi vao csdl
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			//b2: Lay du lieu ve
			String sql = "select * from sach ORDER BY masach OFFSET " + (start) + " ROWS FETCH NEXT " + (num) + " ROWS ONLY";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//b3: Luu tat ca du lieu vao mang ds
			while(rs.next()) {
				String masach = rs.getString("masach");
				String tensach = rs.getString("tensach"); 
				String tacgia = rs.getString("tacgia"); 
				int soluong = rs.getInt("soluong"); 
				int gia = rs.getInt("gia");
				String anh = rs.getString("anh"); 
				String maloai = rs.getString("maloai");
				ds.add(new sachbean(masach, tensach, tacgia, soluong, gia, anh, maloai));
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
	public ArrayList<sachbean> getSach(){
		ArrayList<sachbean> ds= new ArrayList<sachbean>();
		
		try {
			//b1: Ket noi vao csdl
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			//b2: Lay du lieu ve
			String sql = "select * from sach";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//b3: Luu tat ca du lieu vao mang ds
			while(rs.next()) {
				String masach = rs.getString("masach");
				String tensach = rs.getString("tensach"); 
				String tacgia = rs.getString("tacgia"); 
				int soluong = rs.getInt("soluong"); 
				int gia = rs.getInt("gia");
				String anh = rs.getString("anh"); 
				String maloai = rs.getString("maloai");
				ds.add(new sachbean(masach, tensach, tacgia, soluong, gia, anh, maloai));
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
}
