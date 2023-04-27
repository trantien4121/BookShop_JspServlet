package dao;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DangNhapdao {
	public static String getMD5String(String input) throws UnsupportedEncodingException, NoSuchAlgorithmException {
		String strMD5 = "";
		byte[] bytePlainText = input.getBytes("UTF-8");
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] byteDigest = md.digest(bytePlainText);
		StringBuffer sb = new StringBuffer();
		for (int i=0; i< byteDigest.length; ++i) {
			sb.append(Integer.toHexString((byteDigest[i] & 0xFF) | 0x100).substring(1,3));
		}
		strMD5 = sb.toString();
		return strMD5;
	}
	public boolean KtDangNhap(String un, String pass) throws Exception{
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		//String sql="select * from KhachHang where tendn='"+ un + "' and pass='" +pass+ "'";  
		String sql="select * from KhachHang where tendn=? and pass=?";  
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, un);
		cmd.setString(2, pass);
		ResultSet r= cmd.executeQuery();
		boolean kq= r.next();
		r.close();
		return kq;
	}
	public boolean KtDangNhapMD5(String un, String pass) throws Exception{
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		//String sql="select * from KhachHang where tendn='"+ un + "' and pass='" +getMD5String(pass)+ "'";  
		String sql="select * from KhachHang where tendn=? and pass=?";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, un);
		cmd.setString(2, getMD5String(pass));
		ResultSet r= cmd.executeQuery();
		boolean kq= r.next();
		r.close();
		return kq;
	}
	public int getMakh(String tendn) throws Exception{
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		int makh =0;
		String sql = "select * from KhachHang where tendn='"+ tendn + "'" ;
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		while(r.next()) {
			makh = r.getInt(1);
		}
		return makh;
	}
	public boolean KtDangNhapadmin(String un, String pass) throws Exception{
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		//String sql="select * from KhachHang where tendn='"+ un + "' and pass='" +pass+ "'";  
		String sql="select * from DangNhap where TenDangNhap=? and MatKhau=? and Quyen=1";  
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, un);
		cmd.setString(2, pass);
		ResultSet r= cmd.executeQuery();
		boolean kq= r.next();
		r.close();
		return kq;
	}
}
