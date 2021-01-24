<%@ page import="javalar.SistemIslemleri" %>
<%@ page import="javalar.DBOperations" %>
<%@ page import="javalar.SistemKullanicisi" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="net.ucanaccess.jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="utf-8"%>

<%!
	String Sifre, KullaniciAdi;
	public boolean kontrolEt(String girdiBilgisi)
	{
		if(girdiBilgisi == null)
			return false;
		else{
			if(girdiBilgisi.length()== 0)
				return false;
			else 
				return true;
		}
	}

%>

	<%
		String adi = request.getParameter("KullaniciAdi");;
		String sifre = request.getParameter("Sifre");
		System.out.println(adi);
		if(!kontrolEt(adi))
			out.println("KullaniciAdi girilmedi!<br>");
		if(!kontrolEt(sifre))
			out.println("Sifre girilmedi!.<br>");
		

		if(!(kontrolEt(adi) & kontrolEt(sifre)))
				out.println("<a href='javascript: history.back()'>Eksik bilgilerinizi girmelisiniz<br>");
		
		
		SistemIslemleri giris = new SistemIslemleri();
		SistemKullanicisi kisi = null;
		if((sifre != null) && (sifre.length()>0)&& (adi != null) && (adi.length()>0))
			kisi = giris.Login(adi, sifre);
		else{// Eğer ad/şifre girilmediyse
			HttpSession islemler = request.getSession(true);
			islemler.setAttribute("sifre", "gecersiz");
			out.println("<a href='login.jsp'>Giriş</a>sayfasına giderek ad ve şifre giriniz.<br>");
		}
			
		
		if(kisi != null){
		
			String hatirlatma;
			hatirlatma = request.getParameter("Hatirlatma");
			//out.println(hatirlatma);
			
				if(sifre.equals(kisi.getSifre()) && adi.equals(kisi.getAdi()) ){//Eğer ad/şifre geçerliyse
					HttpSession islemler = request.getSession(true);
					islemler.setAttribute("sifre", "gecerli");
					islemler.setAttribute("KullaniciAdi", kisi.getAdi());
					if(hatirlatma != null){
						Cookie cookieKullaniciAdi = new Cookie("KullaniciAdi",kisi.getAdi());
						cookieKullaniciAdi.setMaxAge(900000);
						response.addCookie(cookieKullaniciAdi);
						Cookie cookieSifre = new Cookie("Sifre",kisi.getSifre());
						cookieSifre.setMaxAge(900000);
						response.addCookie(cookieSifre);
						
					}else{
						Cookie cookieKullaniciAdi = new Cookie("KullaniciAdi","");
						cookieKullaniciAdi.setMaxAge(900000);
						response.addCookie(cookieKullaniciAdi);	
						Cookie cookieSifre = new Cookie("Sifre","");
						cookieSifre.setMaxAge(900000);
						response.addCookie(cookieSifre);
						out.println("Bir daha ki sefere Login bilgilerinizi hatırlayacağım.<br>");
						
					}
					
					if(kisi.getkullaniciTuru().equals("yonetici"))
						response.sendRedirect("yoneticisayfasi.jsp?type=0");// otamatik yönlendirma
					else if(kisi.getkullaniciTuru().equals("sorumlu")){
						response.sendRedirect("gorevsorumlusu.jsp?type=0");// otamatik yönlendirma
					}
					else if(kisi.getkullaniciTuru().equals("verihazirlayici"))
						response.sendRedirect("verigirisi.jsp");// otamatik yönlendirma
					// manuel yönlendirme
					out.println("Sifreniz gecerli. Sitemizde istediginiz sayfaya gidebilirsiniz<br>");
					//out.println("Hatta <a href='uyeislemsec.html'>onemli bilgiler icren sayfamiza</a> bile!<br>");
				}else{// Eğer ad/şifre geçersizse
					HttpSession islemler = request.getSession(true);
					islemler.setAttribute("sifre", "gecersiz");
					response.sendRedirect("login.jsp");// otamatik yönlendirma
				}
			}
	%>
		   
		  



