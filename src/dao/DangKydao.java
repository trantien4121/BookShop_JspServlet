package dao;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DangKydao {
	public static String ecrypt(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String enrtext;
		MessageDigest msd = MessageDigest.getInstance("MD5");
		byte[] srctextbyte = text.getBytes("UTF-8");
		byte[] enrtextbyte = msd.digest(srctextbyte);
		BigInteger big = new BigInteger(1, enrtextbyte);
		enrtext = big.toString(16);
		return enrtext;
	}

	public boolean dangKy(String un, String pass, String passagain, String hoten, String diachi, String sodienthoai,
			String email) {
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		if (!pass.equals(passagain) || un.equals("") || hoten.equals("") || email.equals("")) {
			return false;
		} else {
//			String sql = "INSERT INTO DangNhap (TenDangNhap, MatKhau, Quyen)\n" +
//					"vaLUES (?,?,?)";
			String sql = "INSERT INTO KhachHang(hoten, diachi, sodt, email, tendn, pass)\n" + "valUES (?,?,?,?,?,?)";
			try {
				PreparedStatement ps = kn.cn.prepareStatement(sql);
				ps.setString(1, hoten);
				ps.setString(2, diachi);
				ps.setString(3, sodienthoai);
				ps.setString(4, email);
				ps.setString(5, un);
				ps.setString(6, ecrypt(pass));
//				ps.setString(1, un);
//				ps.setString(2, pass);
//				ps.setInt(3, 0);

				return ps.executeUpdate() > 0;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return true;
		}
	}
}
