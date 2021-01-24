package javalar;


import java.sql.SQLException;

public class SistemKullanicisi {
	
	private String adi;
	private String sifre;
	private String kullaniciTuru;
	private int id;
	SistemKullanicisi kisi;
	public SistemKullanicisi getKisi() {
		return kisi;
	}

	public void setKisi(SistemKullanicisi kisi) {
		this.kisi = kisi;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public SistemKullanicisi(){}
	
	public String getAdi() {
		return adi;
	}

	public void setAdi(String adi) {
		this.adi = adi;
	}

	public String getSifre() {
		return sifre;
	}

	public void setSifre(String sifre) {
		this.sifre = sifre;
	}

	public String getkullaniciTuru() {
		return kullaniciTuru;
	}

	public void setkullaniciTuru(String kullaniciTuru) {
		this.kullaniciTuru = kullaniciTuru;
	}
	
}
