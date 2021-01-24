package javalar;


import java.sql.SQLException;
import java.util.ArrayList;


public class SistemIslemleri {

	public SistemKullanicisi Login(String adi, String sifre)
	{
		DBOperations dbops = new DBOperations();
		SistemKullanicisi sk = null;
		try {
			sk = dbops.Uyebilgiler(adi, sifre);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sk;
		
	}
	
	
}
