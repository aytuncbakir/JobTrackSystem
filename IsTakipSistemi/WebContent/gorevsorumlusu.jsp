<%
	HttpSession onemliSayfa = request.getSession(true);
	if(onemliSayfa.getValue("sifre")!= "gecerli")
		response.sendRedirect("login.jsp");
%>
<%@page import="java.util.ArrayList"%>
<%@page import="javalar.DBOperations"%>
<%@page import="javalar.Gorev"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>cleansed - a free css template</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!--
cleansed, a free CSS web template by ZyPOP (zypopwebtemplates.com/)

Download: http://zypopwebtemplates.com/

License: Creative Commons Attribution
//-->
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>

<body>

		<header>
			<div class="width">
				<center><h1><a href="#">IS TAKIP VE YÖNETIM SISTEMI</a></h1></center>
			</div>
		</header>
		<nav>
			<div class="width">
					<ul>
        					<li class=""><a href="gorevsorumlusu.jsp?type=0">Tüm Görevlerim</a></li>
        	    			<li class=""><a href="gorevsorumlusu.jsp?type=1">Devam Eden Görevlerim</a></li>
        	    			<li class=""><a href="gorevsorumlusu.jsp?type=2">Tamamladığım Görevler</a></li>
          	 				<li class="end"><a href="#">Contact</a></li>
				
        				</ul>
			</div>
		</nav>
		

		<section id="body" class="width clear">
			<aside id="sidebar" class="column-left">
				<ul>
                
			<li>
					<h4>Navigate</h4>
                        <ul class="blocklist">
                         <li class=""><a href="gorevsorumlusu.jsp?type=0">Tüm Görevlerim</a></li>
        	    			<li class=""><a href="gorevsorumlusu.jsp?type=1">Devam Eden Görevlerim</a></li>
        	    			<li class=""><a href="gorevsorumlusu.jsp?type=2">Tamamladığım Görevler</a></li>
          	 				<li class="end"><a href="#">Contact</a></li>
				
                        </ul>

					</li>
                
                <li class="bg">
                    <h4>About us</h4>
                    <ul>
                        <li class="text">
                        	<p style="margin: 0;">Aenean nec massa a tortor auctor sodales sed a dolor. Duis vitae lorem sem. Proin at velit vel arcu pretium luctus. 					<a href="#" class="readmore">Read More &raquo;</a></p>
                        </li>
                    </ul>
                </li>
                		
					<li>
						 <h4>Extra Links</h4>
                    				<ul>
                    					    <li> <li><a href="verigirisi.jsp">Veri Giriş Sayfası</a></li>
                        				<li><a href="http://www.dreamhost.com/r.cgi?259541" title="web hosting">Dreamhost</a> - Cheap web hosting from Dreamhost</li>
                      					  <li><a href="http://tuxthemes.com" title="Tux Themes">Tux Themes</a> - Premium Web & WordPress themes</li>
                    				</ul>
					</li>
				</ul>
			</aside>
			<section id="content" class="column-right" style= "overflow-x:scroll;height:450px; overflow-y:scroll; width:1000px;">
<%
	
		
		
	//satın alınabilecek ürünlerin listesini gösterilmesi
		String KullaniciAdi ="";
		DBOperations dbops = new DBOperations();
		
		session = request.getSession(true);
		if(session != null)
			 KullaniciAdi = session.getAttribute("KullaniciAdi").toString();
		else
			response.sendRedirect("login.jsp");
		
		 String type = request.getParameter("type");
		ArrayList<Gorev> gorevler = dbops.gorevlerimiGetir(KullaniciAdi,Integer.valueOf(type));

		

		 
%>
<div class="scroll_table">
<center><table id="data_table"  border = "2" width="950px">
<tr>
	<th  align="center"><h5><font color="#fff">ID</font></h5></th>
	<th  align="center"><h5><font color="#fff">Görev Adı</font></h5></th>
	<th align="center"><h5><font color="#fff">Firma</font></h5></th>
	<th align="center"><h5><font color="#fff">Sorun</font></h5></th>
	<th align="center"><h5><font color="#fff">İşlem</font></h5></th>
	<th align="center"><h5><font color="#fff">Durum</font></h5></th>
	<th align="center"><h5><font color="#fff">Sorumlu</font></h5></th>
	<th align="center"><h5><font color="#fff">Ürün</font></h5></th>
	<th align="center"><h5><font color="#fff">Problem</font></h5></th>
	<th align="center"><h5><font color="#fff">Çözüm</font></h5></th>
	<th align="center"><h5><font color="#fff">Type</font></h5></th>

</tr>


<%
	
	for(int i=0; i<gorevler.size(); i++){
		Gorev gorev = gorevler.get(i);
		
	
		/* 
		String URL =
				"urunKod="+URLEncoder.encode(+
				"&urunFiyat="+URLEncoder.encode(""+)+
				"&urunMiktar="+ URLEncoder.encode(""+)+
				"&urunFiyat="+URLEncoder.encode(""+gorev.getIslem())+
				"&urunMiktar="+ URLEncoder.encode(""+gorev.getDurum())+
				"&urunMiktar="+ URLEncoder.encode(""+gorev.getSorumlu())+
				"&urunFiyat="+URLEncoder.encode(""+gorev.getUrun())+
				"&urunMiktar="+ URLEncoder.encode(""+gorev.getProblem())+
				"&urunIsmi="+URLEncoder.encode(gorev.get); */
		
		out.println("<tr><td><h5>"+gorev.getId());	
		out.println("</h5></td><td><h5>"+gorev.getGorevAdi());
		out.println("</h5></td><td><h5>"+gorev.getFirma());
		out.println("</h5></td><td><h5>"+gorev.getSorun());
		out.println("</h5></td><td><h5>"+gorev.getIslem());
		out.println("</h5></td><td><h5>"+gorev.getDurum());
		out.println("</h5></td><td><h5>"+gorev.getSorumlu());
		out.println("</h5></td><td><h5>"+gorev.getUrun());
		out.println("</h5></td><td><h5>"+gorev.getProblem());
		out.println("</td><td align =\"right\"></h5>"+ gorev.getCozum());
		out.println("</td><td align =\"right\"></h5>"+ "<form action='yoneticisayfasi.jsp?type=0' method='post'>"+"<input type='submit' style='color:#fff;background-color: #B10058;background-image: linear-gradient(#B10058, #99004D);color:#fff;border: none;border-radius: 30px;padding:8px 25px;font-size: 1.0em;' class='formbutton' name='ileri' value='ileri'></input>");

	
		
	}
%>
</td>
	
</tr>
<tr>

		
	
</tr>
</table><center>
                		
	  </div> 		

		</section>

	</section>
	
	<footer class="clear">
        <div class="footer-content width">
            <ul>
            	<li><h4>Proin accumsan</h4></li>
                <li><a href="#">Rutrum nulla a ultrices</a></li>
                <li><a href="#">Blandit elementum</a></li>
                <li><a href="#">Proin placerat accumsan</a></li>
                <li><a href="#">Morbi hendrerit libero </a></li>
                <li><a href="#">Curabitur sit amet tellus</a></li>
            </ul>
            
            <ul>
            	<li><h4>Condimentum</h4></li>
                <li><a href="#">Curabitur sit amet tellus</a></li>
                <li><a href="#">Morbi hendrerit libero </a></li>
                <li><a href="#">Proin placerat accumsan</a></li>
                <li><a href="#">Rutrum nulla a ultrices</a></li>
                <li><a href="#">Cras dictum</a></li>
            </ul>
            
            <ul class="endfooter">
            	<li><h4>Suspendisse</h4></li>
                <li><a href="#">Morbi hendrerit libero </a></li>
                <li><a href="#">Proin placerat accumsan</a></li>
                <li><a href="#">Rutrum nulla a ultrices</a></li>
                <li><a href="#">Curabitur sit amet tellus</a></li>
                <li><a href="#">Donec in ligula nisl.</a></li>
            </ul>
            
            <div class="clear"></div>
        </div>
        <div class="footer-bottom">
            <p>&copy; YourSite 2014. <a href="http://zypopwebtemplates.com/">Free HTML5 Templates</a> by ZyPOP</p>
         </div>
    </footer>
</body>
</html>
