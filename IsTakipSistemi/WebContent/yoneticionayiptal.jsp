<%@page import="java.util.ArrayList"%>
<%@page import="javalar.DBOperations"%>
<%@page import="javalar.Gorev"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
				<h1><a href="#">IS TAKIP VE YÖNETIM SISTEMI</a></h1>
			</div>
		</header>
		<nav>
			<div class="width">
					<ul>
        					
        	    			<li class="selected"><a href="verigirisi.jsp">Veri Giriş Sayfası</a></li>
         	   				
        				</ul>
			</div>
		</nav>
		

		<section id="body" class="width clear">
			<aside id="sidebar" class="column-left">
				<ul>
                
					<li>
						<h4>Morbi fermentum</h4>
						<ul>
							<li><a href="http://www.zypopwebtemplates.com" title="ZyPOP">ZyPOP free CSS templates</a></li>
							<li><a href="http://www.justfreetemplates.com" title="free web templates">Free website templates</a></li>
							<li><a href="http://www.awesomestyles.com/mybb-themes" title="mybb themes">Free MyBB themes</a></li>
							<li><a href="http://www.awesomestyles.com" title="free phpbb3 themes">phpBB3 forum styles</a></li>
		
						</ul>
					</li>
                
                <li class="bg">
                    <h4>About us</h4>
                    <ul>
                        <li class="text">
                        	<p style="margin: 0;">Aenean nec massa a tortor auctor sodales sed a dolor. Duis vitae lorem sem. Proin at velit vel arcu pretium luctus. 					<a href="#" class="readmore">Read More &raquo;</a></p>
                        </li>
                    </ul>
					<li>
						 <h4>Helpful Links</h4>
                    				<ul>
                    					    <li><a href="http://www.themeforest.net/?ref=spykawg" title="premium templates">ThemeForest - Premium HTML web templates from $10</a></li>
                        				<li><a href="http://www.dreamhost.com/r.cgi?259541" title="web hosting">Dreamhost</a> - Cheap web hosting from Dreamhost</li>
                      					  <li><a href="http://tuxthemes.com" title="Tux Themes">Tux Themes</a> - Premium Web & WordPress themes</li>
                    				</ul>
					</li>
				</ul>
			</aside>
			<section id="content" class="column-right">
                		
	    <article>
				
			
			<h2>Approvement</h2>
			
			<br>
			
			
					 <%
					 		int id = Integer.valueOf(request.getParameter("id"));
					    	DBOperations dbops = new DBOperations();
					    	Gorev gorev = dbops.gorevGetir(id);
					    	
					    %>
						
				<h3>Form</h3>
				<fieldset>

					<legend>Form legend</legend>
					<form action="yoneticionayiptalkayit.jsp?id=<%=id%>" name="basitBirForm" method="post">
						<p><label for="name">Görev Adı:</label>
						<input type="text" name="gorevadi" id="gorevadi" value="<%= gorev.getGorevAdi()%>"/><br /></p>		
						<p><label for="email">Firma:</label>
						<input type="text" name="firma" id="firma" value="<%=gorev.getFirma()%>" /><br /></p>
						<p><label for="name">Sorun:</label>
						<input type="text" name="sorun" id="sorun" value="<%=gorev.getSorun()%>"/><br /></p>		
						<p><label for="email">Ürün:</label>
						<input type="text" name="urun" id="urun" value="<%=gorev.getUrun()%>" /><br /></p>
						<p><label for="name">Problem:</label>
						<input type="text" name="problem" id="problem" value="<%=gorev.getProblem()%>"  /><br /></p>		
						<p><input type="submit" name="send" class="formbutton" value="Approve" /></p>
					</form>
	
				</fieldset>
		</article>
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
