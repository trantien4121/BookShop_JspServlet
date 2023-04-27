package bean;

public class lichsumuahangbean {
	private int MaHoaDon;
	private String tensach;
	private String NgayMua;
	private long SoLuongMua;
	private long gia;
	private long thanhtien;
	private int damua;
	private int makh;
	public int getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(int maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public String getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(String ngayMua) {
		NgayMua = ngayMua;
	}
	public long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public int getDamua() {
		return damua;
	}
	public void setDamua(int damua) {
		this.damua = damua;
	}
	public int getMakh() {
		return makh;
	}
	public void setMakh(int makh) {
		this.makh = makh;
	}
	public lichsumuahangbean(int maHoaDon, String tensach, String ngayMua, long soLuongMua, long gia, long thanhtien,
			int damua, int makh) {
		super();
		MaHoaDon = maHoaDon;
		this.tensach = tensach;
		NgayMua = ngayMua;
		SoLuongMua = soLuongMua;
		this.gia = gia;
		this.thanhtien = thanhtien;
		this.damua = damua;
		this.makh = makh;
	}
	
	
	
	
	
}
