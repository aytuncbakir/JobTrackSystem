<%@page import="java.util.ArrayList"%>
<%@page import="javalar.DBOperations"%>
<%@page import="javalar.Gorev"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="utf-8"%>
<%
		DBOperations dbops = new DBOperations();
		
		
		int id = Integer.valueOf(request.getParameter("id"));
		dbops.updateYoneticiOnayIptal(id);
		
		response.sendRedirect("yoneticisayfasi.jsp?type=5");// otamatik yönlendirma
		
		
		

	%>