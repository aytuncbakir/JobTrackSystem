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
                           <li class=""><a href="raporlama.jsp?type=4">Görevler</a></li>
        	    			
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
						 <h4>Helpful Links</h4>
                    				<ul>
                    					    <li><a href="http://www.themeforest.net/?ref=spykawg" title="premium templates">ThemeForest</a> - Premium HTML web templates from $10</li>
                        				<li><a href="http://www.dreamhost.com/r.cgi?259541" title="web hosting">Dreamhost</a> - Cheap web hosting from Dreamhost</li>
                      					  <li><a href="http://tuxthemes.com" title="Tux Themes">Tux Themes</a> - Premium Web & WordPress themes</li>
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
	<th  align="center"><h5><font color="#fff">Completed</font></h5></th>
	<th  align="center"><h5><font color="#fff">Ongoing</font></h5></th>
	<th align="center"><h5><font color="#fff">Not Assigned</font></h5></th>
	

</tr>


<%
	
	
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
		

		out.println("<tr><td><h5>"+tamamlanan+"</h5></td>");	
		out.println("<td><h5>"+devameden+"</h5></td>");	
		out.println("<td><h5>"+atanmayan+"</h5></td></tr>");	
	
	
	
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
