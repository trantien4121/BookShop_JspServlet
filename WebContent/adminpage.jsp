<%@page import="bean.dangnhapadminbean"%>
<%@page import="bean.khachhangbean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		style="background-color: #7B68EE; height: 12vh">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent"
			style="font-weight: 600">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link ml-3"
					href="htadminpage" style="color: #fff;">Trang chủ</a>
				</li>
				<li><a href="loaiadminCRUDservlet" class="nav-link ml-3"
					style="color: #fff;">Quản lý loại</a></li>
				<li><a href="sachadminCRUDservlet" class="nav-link ml-3"
					style="color: #fff;">Quản lý sách</a></li>
				<li><a href="xacnhanservlet" class="nav-link ml-3"
					style="color: #fff;">Xác nhận</a></li>
				<li><a href="danhsachchuyentienservlet" class="nav-link ml-3"
					style="color: #fff;">danh sách chuyển tiền</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
      <li><a href="#" class="nav-link ml-3"
					href="htsachservlet" style="color: #fff;"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li>
      <%if(session.getAttribute("admin")==null){ %>
      <a href="dangnhapadminservlet" class="nav-link ml-3"
					href="htsachservlet" style="color: #fff;">
      <span class="glyphicon glyphicon-log-in"></span>
       Login
       </a>
       <%}else{ %>
       <a href="#" class="nav-link ml-3"
					href="htsachservlet" style="color: #fff;">
	      <i class="fa fa-sign-out" aria-hidden="true"></i>
	       Hi: <%
	       dangnhapadminbean kh =(dangnhapadminbean)session.getAttribute("admin");
	        out.print(kh.getTenDangNhap());
	       %>
	       </a>
	       <%} %>
       </li>
    </ul>
		</div>
	</nav>
  
<table width="1000" align="center">
  
</table>
</body>
</html>
