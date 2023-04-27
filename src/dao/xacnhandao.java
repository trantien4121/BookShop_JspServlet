package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.xacnhanbean;

public class xacnhandao {
	  public ArrayList<xacnhanbean> getdanhsach(){
	    	try {
	    		ArrayList<xacnhanbean> ds= new ArrayList<xacnhanbean>();
				KetNoi kn= new KetNoi();
				kn.KetNoi();
				String sql="select * from V_XacThucChiTiet";
				PreparedStatement cmd= kn.cn.prepareStatement(sql);
				ResultSet rs=cmd.executeQuery();
				while(rs.next()) {
					  long MaChiTietHD=rs.getLong("MaChiTietHD");
					  long MaHoaDon=rs.getLong("MaHoaDon");;
					  String hoten=rs.getString("hoten");
					  String tensach=rs.getString("tensach");;
					  long SoLuongMua=rs.getLong("SoLuongMua");;
					  long gia=rs.getLong("gia");;
					  long ThanhTien=rs.getLong("ThanhTien");;
					  int damua=rs.getInt("damua");
					  ds.add(new xacnhanbean(MaChiTietHD, MaHoaDon, hoten, tensach, SoLuongMua, gia, ThanhTien, damua));
				}
				rs.close();kn.cn.close();
				return ds;
			} catch (Exception e) {
				e.printStackTrace();return null;
			}
	    }

}
