<%@page import="java.util.ArrayList"%>
<%@page import="javalar.DBOperations"%>
<%@page import="javalar.Gorev"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Task Management System</title>
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
				<center><h1><a href="#">TASK MANAGEMENT SYSTEM</a></h1></center>
			</div>
		</header>
		<nav>
			<div class="width">
					<ul>
        					<li class=""><a href="yoneticisayfasi.jsp?type=0">Tasks</a></li>
        	    			<li class=""><a href="yoneticisayfasi.jsp?type=1">Ongoing</a></li>
        	    			<li class=""><a href="yoneticisayfasi.jsp?type=2">Completed</a></li>
         	   				<li  class=""><a href="yoneticisayfasi.jsp?type=3">Task Assignment</a></li>
          	  				<li  class=""><a  href="raporlama.jsp?type=4">Reports</a></li>
          	  				<li  class=""><a  href="yoneticisayfasi.jsp?type=5">Approvement</a></li>
          	 				
				
        				</ul>
			</div>
		</nav>
		

		<section id="body" class="width clear">
			<aside id="sidebar" class="column-left">
				<ul>
                
			<li>
					<h4>Navigate</h4>
                        <ul class="blocklist">
                           <li class=""><a href="yoneticisayfasi.jsp?type=0">Tasks</a></li>
        	    			<li class=""><a href="yoneticisayfasi.jsp?type=1">Ongoing</a></li>
        	    			<li class=""><a href="yoneticisayfasi.jsp?type=2">Completed</a></li>
         	   				<li  class=""><a href="yoneticisayfasi.jsp?type=3">Task Assignment</a></li>
          	  				<li  class=""><a  href="raporlama.jsp?type=4">Reports</a></li>
          	  				<li  class=""><a  href="yoneticisayfasi.jsp?type=5">Approvement</a></li>
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
                    					  <li><a href="verigirisi.jsp">Data Insertion</a></li>
                    					  <li><a href="verigirisi.jsp">User Management</a></li>
                    					  <li><a href="verigirisi.jsp">Authorization Managemnet</a></li>
                        				
                    				</ul>
					</li>
				</ul>
			</aside>
			<section id="content" class="column-right" style= "overflow-x:scroll;height:450px; overflow-y:scroll; width:1000px;">
<%
	//satın alınabilecek ürünlerin listesini gösterilmesi
	
		DBOperations dbops = new DBOperations();
        String type = request.getParameter("type");
		ArrayList<Gorev> gorevler = dbops.gorevleriGetir(Integer.valueOf(type));
		

		 
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
	

	if(type.equals("4")){
		int tamamlanan = 0;
		int devameden = 0;
		int atanmayan = 0;
		
		for(int i=0; i<gorevler.size(); i++){
			Gorev gorev = gorevler.get(i);
			if(gorev.getSorumlu().equals("Atanmadı"))
				atanmayan = atanmayan + 1;
			else if(gorev.getDurum().equals("Tamamlandı"))
				tamamlanan = tamamlanan + 1;
			else if(gorev.getDurum().equals("Devam ediyor") )
				devameden = devameden + 1;
		}
		
		out.println("<th  align='center'><h5><font color=''#fff'>Tamamlanan</font></h5></th>");	
		out.println("<th  align='center'><h5><font color=''#fff'>devameden</font></h5></th>");	
		out.println("<th  align='center'><h5><font color=''#fff'>atanmayan</font></h5></th>");	
		out.println("<tr><td><h5>"+tamamlanan+"</h5></td>");	
		out.println("<td><h5>"+devameden+"</h5></td>");	
		out.println("<td><h5>"+atanmayan+"</h5></td></tr>");	
	
		
		
		
	}else{
	
		for(int i=0; i<gorevler.size(); i++){
			Gorev gorev = gorevler.get(i);
			
			String urunURL2 = "gorevatama.jsp?gorev=";
			String urunURL3 = "yoneticionay.jsp?id=";
			String urunURL4 = "yoneticionayiptal.jsp?id=";
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
			out.println("</h5></td><td><h5>"+gorev.getCozum());
			if(type.equals("0"))
			out.println("</td><td align =\"right\"></h5>"+ "<form action='yoneticisayfasi.jsp?type=0' method='post'>"+"<input type='submit' style='color:#fff;background-color: #B10058;background-image: linear-gradient(#B10058, #99004D);color:#fff;border: none;border-radius: 30px;padding:8px 25px;font-size: 1.0em;' class='formbutton' name='ileri' value='ileri'></input>");
			else if(type.equals("1"))
				out.println("</td><td align =\"right\"></h5>"+ "<form action='yoneticisayfasi.jsp?type=1' method='post'>"+"<input type='submit' style='color:#fff;background-color: #B10058;background-image: linear-gradient(#B10058, #99004D);color:#fff;border: none;border-radius: 30px;padding:8px 25px;font-size: 1.0em;' class='formbutton' name='ileri' value='ileri'></input>");
			else if(type.equals("2"))
				out.println("</td><td align =\"right\"></h5>"+ "<form action='yoneticisayfasi.jsp?type=2' method='post'>"+"<input type='submit' style='color:#fff;background-color: #B10058;background-image: linear-gradient(#B10058, #99004D);color:#fff;border: none;border-radius: 30px;padding:8px 25px;font-size: 1.0em;' class='formbutton' name='ileri' value='ileri'></input>");
			else if(type.equals("3"))
				out.println(
					"</td><td><a href=\""+urunURL2+gorev.getId()+"\"> "+
					"<img src=\"/IsTakipSistemi/resimler/ayrinti.gif\" "+
					"width =\"62\"height=\"24\" alt=\"\" "+
					"border=0></a>");
			else if(type.equals("5")){				
				out.println("</td><td align =\"right\"></h5>"+ "<form action='yoneticionay.jsp?id="+String.valueOf(gorev.getId())+"' method='post'>"+"<input type='submit' style='color:#fff;background-color: #B10058;background-image: linear-gradient(#B10058, #99004D);color:#fff;border: none;border-radius: 30px;padding:8px 25px;font-size: 1.0em;' class='formbutton' name='ileri' value='ileri'></input>");
				out.println("</td><td align =\"right\"></h5>"+ "<form action='yoneticionayiptal.jsp?id="+String.valueOf(gorev.getId())+"' method='post'>"+"<input type='submit' style='color:#fff;background-color: #B10058;background-image: linear-gradient(#B10058, #99004D);color:#fff;border: none;border-radius: 30px;padding:8px 25px;font-size: 1.0em;' class='formbutton' name='ileri' value='ileri'></input>");
			
			}
			
		}
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
