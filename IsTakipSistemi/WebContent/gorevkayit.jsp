<%@page import="java.util.ArrayList"%>
<%@page import="javalar.DBOperations"%>
<%@page import="javalar.Gorev"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="utf-8"%>
<%
		DBOperations dbops = new DBOperations();
		Gorev g = new Gorev();
		g.setGorevAdi(request.getParameter("gorevadi"));
		g.setFirma(request.getParameter("firma"));
		g.setSorun(request.getParameter("sorun"));
		g.setUrun(request.getParameter("urun"));
		g.setUrun(request.getParameter("problem"));
		g.setCozum("Henüz çözüm üretilmedi");
		g.setDurum("false");
		g.setIslem("false");
		g.setSorumlu("Atanmadı");
		g.setProblem(request.getParameter("problem"));
		
		boolean durum = dbops.insert(g);
		
		response.sendRedirect("verigirisi.jsp");// otamatik yönlendirma
		
		
		

	%>