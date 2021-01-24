package javalar;

import java.sql.*;
import java.util.ArrayList;
import net.ucanaccess.jdbc.*;

public class DBOperations {

	
	
	public Connection baglan ()
	{
		Connection baglanti = null ;
		try{
			//E:/eclipse/workspace/IsTakipSistemi/WebContent/db/istakip.accdb
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			String dbURL = "jdbc:ucanaccess://C:/Users/sivam/Desktop/sts3/workspace-spring-boot/IsTakipSistemi/WebContent/db/istakip.accdb" ;
			
			baglanti = DriverManager.getConnection(dbURL,"","");
			return baglanti;
		}catch(ClassNotFoundException ex){
			System.out.println("class bulunamadi olustu...");
			ex.printStackTrace();
		}
		catch(SQLException ex1){
			ex1.printStackTrace();
			System.out.println("SQL2 Hata olustu...");
		}
		
		return baglanti;
		
	}
	
	public void kapat(Connection baglanti)throws SQLException{
			baglanti.close();
	}

	
	
	public  boolean  insert(Gorev g) throws SQLException{
	
		String gorevadi = g.getGorevAdi();
		String firma = g.getFirma();
		String sorun = g.getSorun();
		boolean islem = false;
		boolean durum = false;
		String sorumlu = g.getSorumlu();
		String urun = g.getUrun();
		String problem = g.getProblem();
		String cozum = g.getCozum();
		
		boolean sorumluOnay = false;
		boolean yoneticiOnay = false;
		
		Connection baglanti = null ;
		String sqlSorgu ="";
		
			sqlSorgu =  "INSERT INTO gorevler (gorevAdi,firma,sorun,islemYapildiMi,tamamlandiMi,gorevSorumlusu,urun,problem,cozumIslemi,sorumluOnay,yoneticiOnay) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		
		baglanti = baglan();
		PreparedStatement sorgu = baglanti.prepareStatement(sqlSorgu);
	
			sorgu.setString(1, gorevadi);
			sorgu.setString(2, firma);
			sorgu.setString(3, sorun);
			sorgu.setBoolean(4, islem);
			sorgu.setBoolean(5,durum);
			sorgu.setString(6, sorumlu);
			sorgu.setString(7,urun);
			sorgu.setString(8, problem);
			sorgu.setString(9, cozum);
			sorgu.setBoolean(10, sorumluOnay);
			sorgu.setBoolean(11,yoneticiOnay);
			sorgu.executeUpdate();
			kapat(baglanti);
			return true;
		
	}//endofinserturun
	
	
	public SistemKullanicisi Uyebilgiler (String adi)throws SQLException{
		

		ResultSet sonucVeriler = null;
		String sqlSorgu = "";
		
		SistemKullanicisi kisi = new SistemKullanicisi();
		sqlSorgu=  "SELECT * FROM kullanicilar WHERE adi="+"'"+adi+"'";;
		System.out.println(sqlSorgu);
		Connection baglanti = null ;
		baglanti = baglan();
		Statement sorgu = baglanti.createStatement();
		sonucVeriler = sorgu.executeQuery(sqlSorgu);
		while(sonucVeriler.next()){
				kisi.setId(sonucVeriler.getInt("ID"));
				kisi.setAdi(sonucVeriler.getString("adi"));
				kisi.setSifre(sonucVeriler.getString("sifre"));
				kisi.setkullaniciTuru(sonucVeriler.getString("kullanicituru"));
			
			}
		System.out.println(kisi.getAdi());
		System.out.println(kisi.getSifre());
		kisi.setKisi(kisi);
		sonucVeriler.close();
		kapat(baglanti);
		return kisi;
	}
	
	public SistemKullanicisi Uyebilgiler (String adi,String sifre)throws SQLException{
		

		ResultSet sonucVeriler = null;
		String sqlSorgu = "";
		
		SistemKullanicisi kisi = new SistemKullanicisi();
		sqlSorgu=  "SELECT * FROM kullanicilar WHERE adi="+"'"+adi+"'"+" AND sifre="+"'"+sifre+"'";
		System.out.println(sqlSorgu);
		Connection baglanti = null ;
		baglanti = baglan();
		Statement sorgu = baglanti.createStatement();
		sonucVeriler = sorgu.executeQuery(sqlSorgu);
		while(sonucVeriler.next()){
			kisi.setId(sonucVeriler.getInt("ID"));
			kisi.setAdi(sonucVeriler.getString("adi"));
			kisi.setSifre(sonucVeriler.getString("sifre"));
			kisi.setkullaniciTuru(sonucVeriler.getString("kullanicituru"));
			
			}
		System.out.println(kisi.getAdi());
		System.out.println(kisi.getSifre());
		kisi.setKisi(kisi);
		sonucVeriler.close();
		kapat(baglanti);
		return kisi;
	}
	
	public ArrayList <Gorev> gorevleriGetir (int type) throws SQLException{
		
		
		Connection baglanti = null ;
		Statement satir = null;
		ResultSet sonucVeriler= null;
		ArrayList <Gorev> aList = new ArrayList <Gorev> ();
		String sqlSorgu = "";
		Gorev g;
		
		baglanti = baglan();
	
		if(type == 0 || type == 4)
		 sqlSorgu =  "SELECT * FROM  gorevler";
		else if(type == 1)
				 sqlSorgu = "SELECT * FROM  gorevler WHERE tamamlandiMi=false";
		else if(type == 2)
			 sqlSorgu =  "SELECT * FROM  gorevler WHERE tamamlandiMi=true";
		else if(type == 3)
			 sqlSorgu =  "SELECT * FROM  gorevler WHERE gorevSorumlusu ='Atanmadı'";
		else if(type == 5)
			 sqlSorgu =  "SELECT * FROM  gorevler WHERE sorumluOnay= 'true' and yoneticiOnay ='false'";
	
		satir = baglanti.createStatement();
		sonucVeriler = satir.executeQuery(sqlSorgu);
		
		String islem = "";
		String durum = "";
		
		while(sonucVeriler.next())	{	
			g = new Gorev();
			g.setId(Integer.valueOf(sonucVeriler.getString("ID")));
		
			g.setGorevAdi(sonucVeriler.getString("gorevAdi"));
			g.setFirma(sonucVeriler.getString("firma"));
			g.setSorun(sonucVeriler.getString("sorun"));
			if(sonucVeriler.getBoolean("islemYapildiMi"))
				islem = "İşlem yapıldı";
			else
				islem = "İşlem yapılmadı";
			g.setIslem(islem);
			if(sonucVeriler.getBoolean("tamamlandiMi"))
				durum = "Tamamlandı";
			else
				durum = "Devam ediyor";
			g.setDurum(durum);
			g.setSorumlu(sonucVeriler.getString("gorevSorumlusu"));
			g.setUrun(sonucVeriler.getString("urun"));
			g.setProblem(sonucVeriler.getString("problem"));
			if(sonucVeriler.getString("cozumIslemi").equals("") || sonucVeriler.getString("cozumIslemi") == null)
				g.setCozum("Henüz çözüm üretilmedi");
			else
				g.setCozum(sonucVeriler.getString("cozumIslemi"));
			aList.add(g);
			
		}
		sonucVeriler.close();
		kapat(baglanti);
		
		return aList;
	}	
	
public ArrayList <String> sorumluGetir () throws SQLException{
		
		
		Connection baglanti = null ;
		Statement satir = null;
		ResultSet sonucVeriler= null;
		ArrayList <String> aList = new ArrayList <String> ();
		String sqlSorgu = "";
		Gorev g;
		
		baglanti = baglan();
	
		
		sqlSorgu =  "SELECT adi FROM  kullanicilar WHERE kullanicituru='sorumlu'";
		satir = baglanti.createStatement();
		sonucVeriler = satir.executeQuery(sqlSorgu);
		
		String sorumlu = "";
		
		
		while(sonucVeriler.next())	{	
			
			sorumlu = sonucVeriler.getString("adi");
		
			aList.add(sorumlu);
			
		}
		sonucVeriler.close();
		kapat(baglanti);
		
		return aList;
	}	

	public Gorev gorevGetir (int id) throws SQLException{
		
		
		Connection baglanti = null ;
		Statement satir = null;
		ResultSet sonucVeriler= null;
		ArrayList <String> aList = new ArrayList <String> ();
		String sqlSorgu = "";
		Gorev g = null;
		
		baglanti = baglan();
	
		
		sqlSorgu =  "SELECT * FROM  gorevler WHERE ID="+id;
		satir = baglanti.createStatement();
		sonucVeriler = satir.executeQuery(sqlSorgu);
		
		String sorumlu = "";
		
		
		while(sonucVeriler.next())	{	
			
			g = new Gorev();
			g.setGorevAdi(sonucVeriler.getString("gorevAdi"));
			g.setFirma(sonucVeriler.getString("firma"));
			g.setSorun(sonucVeriler.getString("sorun"));	
			g.setUrun(sonucVeriler.getString("urun"));
			g.setProblem(sonucVeriler.getString("problem"));
			
			
		}
		sonucVeriler.close();
		kapat(baglanti);
		
		return g;
	}	
	
	public void updateSorumlu (String sorumlu,int  id) throws SQLException{
		
		Connection baglanti = null ;
		PreparedStatement sorgu = null;
		String sqlSorgu =  "UPDATE  gorevler SET gorevSorumlusu = ? WHERE ID = ?";
		baglanti = baglan();
		sorgu = baglanti.prepareStatement(sqlSorgu);
		sorgu.setString(1,sorumlu);
		sorgu.setInt(2,id);
		sorgu.executeUpdate();
		kapat(baglanti);
	
	}

	public void updateYoneticiOnay (int id) throws SQLException{
		
		Connection baglanti = null ;
		PreparedStatement sorgu = null;
		String sqlSorgu =  "UPDATE  gorevler SET yoneticiOnay = ? WHERE ID = ?";
		baglanti = baglan();
		sorgu = baglanti.prepareStatement(sqlSorgu);
		sorgu.setBoolean(1,true);
		sorgu.setInt(2,id);
		sorgu.executeUpdate();
		kapat(baglanti);
	
	}
	
	
	public void updateYoneticiOnayIptal (int id) throws SQLException{
		
		Connection baglanti = null ;
		PreparedStatement sorgu = null;
		String sqlSorgu =  "UPDATE  gorevler SET sorumluOnay = ? and yoneticiOnay = ? WHERE ID = ?";
		baglanti = baglan();
		sorgu = baglanti.prepareStatement(sqlSorgu);
		sorgu.setBoolean(1,false);
		sorgu.setBoolean(2,false);
		sorgu.setInt(3,id);
		sorgu.executeUpdate();
		kapat(baglanti);
	
	}


	
	public ArrayList <Gorev> gorevlerimiGetir(String KullaniciAdi,int type) throws SQLException{
			
			
			Connection baglanti = null ;
			Statement satir = null;
			ResultSet sonucVeriler= null;
			ArrayList <Gorev> aList = new ArrayList <Gorev> ();
			String sqlSorgu = "";
			Gorev g;
			
			baglanti = baglan();
		
			if(type == 0)
				sqlSorgu =  "SELECT * FROM  gorevler WHERE gorevSorumlusu="+"'"+KullaniciAdi+"'";
			else if(type == 1)
				sqlSorgu =  "SELECT * FROM  gorevler WHERE gorevSorumlusu="+"'"+KullaniciAdi+"'"+" and  tamamlandiMi=false";
			else if(type == 2)
				sqlSorgu =  "SELECT * FROM  gorevler WHERE gorevSorumlusu="+"'"+KullaniciAdi+"'"+" and tamamlandiMi=true";
			
			satir = baglanti.createStatement();
			sonucVeriler = satir.executeQuery(sqlSorgu);
			
			String islem = "";
			String durum = "";
			
			while(sonucVeriler.next())	{	
				g = new Gorev();
				g.setId(Integer.valueOf(sonucVeriler.getString("ID")));
			
				g.setGorevAdi(sonucVeriler.getString("gorevAdi"));
				g.setFirma(sonucVeriler.getString("firma"));
				g.setSorun(sonucVeriler.getString("sorun"));
				if(sonucVeriler.getBoolean("islemYapildiMi"))
					islem = "İşlem yapıldı";
				else
					islem = "İşlem yapılmadı";
				g.setIslem(islem);
				if(sonucVeriler.getBoolean("tamamlandiMi"))
					durum = "Tamamlandı";
				else
					durum = "Devam ediyor";
				g.setDurum(durum);
				g.setSorumlu(sonucVeriler.getString("gorevSorumlusu"));
				g.setUrun(sonucVeriler.getString("urun"));
				g.setProblem(sonucVeriler.getString("problem"));
				if(sonucVeriler.getString("cozumIslemi").equals("") || sonucVeriler.getString("cozumIslemi") == null)
					g.setCozum("Henüz çözüm üretilmedi");
				else
					g.setCozum(sonucVeriler.getString("cozumIslemi"));
				aList.add(g);
				
			}
			sonucVeriler.close();
			kapat(baglanti);
			
			return aList;
		}	
	
	
	
	public ArrayList <String> uyelistele ()throws SQLException{
		
		Connection baglanti = null ;
		ArrayList <String> kisilist = new ArrayList<String>();	
		String sqlSorgu =  "SELECT * FROM UYELER";
		baglanti =baglan();
		Statement sorgu = baglanti.createStatement();
		ResultSet sonucVeriler = sorgu.executeQuery(sqlSorgu);
		while(sonucVeriler.next()){
			kisilist.add( sonucVeriler.getString("UyeID"));
			kisilist.add(sonucVeriler.getString("Ad"));
			kisilist.add(sonucVeriler.getString("Sifre"));
		}
		kapat(baglanti);
		return kisilist;
	}
	

}// end of Class
