<%@page import="java.util.ArrayList"%>
<%@page import="javalar.DBOperations"%>
<%@page import="javalar.Gorev"%>
<%@ page language="java"
    session="true"
    isThreadSafe="true"
    contentType="text/html; charset=ISO-8859-9" %>

<%

		String sorumlu = request.getParameter("sorumlu");
		int id = Integer.valueOf(request.getParameter("id"));
		DBOperations dbops = new DBOperations();
		dbops.updateSorumlu(sorumlu, id);
		
		response.sendRedirect("yoneticisayfasi.jsp?type=3");// otamatik yönlendirma
		
		
		

	%>