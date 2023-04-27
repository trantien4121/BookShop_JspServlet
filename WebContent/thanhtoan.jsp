<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@page import="bean.sachbean"%>
<%@page import="bean.giohangbean"%>
<%@page import="bean.hoadonbean"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.giohangbo"%>
<%@page import="bo.hoadonbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<title>MT Store</title>
</head>
<style>
.nav-item{
	position: relative
}
.header__cart-notice{
	position: absolute;
    top: 0px;
    right: 70px;
    padding: 1px 5px;
    font-size: 0.6rem;
    /* line-height: 1rem; */
    border: 2px solid #7B6BEE;
    border-radius: 50%;
    background-color: #fff;
    color: #7B68EE;
}
.tbd{
	position: relative;
}
/* .btn-clear-selection{
	position: absolute;
	top: 40px;
	right: 150px;
} */
/* .btn-check-out{
	position: absolute;
	right: 57px;
	top: 40px;
} */

</style>
<body>
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #7B68EE">
    	<a class="navbar-brand ml-5" href="#" style="color: #fff; font-weight: 700;">MT Store</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link ml-3" href="htsachservlet" style="color: #fff;"><i class="fa fa-home" aria-hidden="true"></i> Trang chủ <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link ml-3" href="htgioservlet" style="color: #fff"> 
              	<i class="fa fa-cart-plus mr-2" aria-hidden="true"></i> <span>Giỏ hàng</span>
              	<% 
              		giohangbo gh=(giohangbo)session.getAttribute("gio");
              		if(session.getAttribute("gio")!=null && gh.ds.size()!=0){
              	%>
              		<span class="header__cart-notice"><%=gh.ds.size()%></span>
              	<%} %>
              </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-3" href="#" style="color: #fff"> <i class="fa fa-money" aria-hidden="true"></i> Thanh toán</a>
                <% 
              		hoadonbo hoadon=(hoadonbo)session.getAttribute("hoadon");
              		if(session.getAttribute("hoadon")!=null && hoadon.ds.size()!=0){
              	%>
              		<span class="header__cart-notice"><%=hoadon.ds.size()%></span>
              	<%} %>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-3" href="#" style="color: #fff"> <i class="fa fa-history" aria-hidden="true"></i> Lịch sử mua</a>
              </li>
          </ul>
          <ul class="navbar-nav mr-5">
            <li class="mr-3">
                <%if(session.getAttribute("dn")==null){ %>
                <a href="#" style="color: #fff">
                   <i class="fa fa-user" aria-hidden="true"></i> Register
                </a>
                <%}%>
            </li>
            <li>
                <%if(session.getAttribute("dn")==null){ %>
                <a href="dangnhap.jsp" style="color: #fff;text-decoration: none;">
                    <i class="fa fa-user-circle-o" aria-hidden="true"></i> Login
                    
                </a>
                <%}else{ %>
                <a href="#" style="color: #fff;text-decoration: none;">
                    <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                    <%=session.getAttribute("dn")%>
                </a>
                <a href="dangxuat.jsp" class="ml-3" style="color: #fff;text-decoration: none;" class="drop-down">
                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                </a>
                <% }%>
            </li>
          </ul>
        </div>
    </nav>
<table width="1200" align="center" class="mt-3 tbd">
   	<tr>
      
      <td width="1000" valign="top" class="pr-4"> <span style="font-weight: 700">Chờ thanh toán</span>
      	<table class="table table-hover mt-2 table-bordered">
      		<% 
      			/*giohangbo gh=
           		(giohangbo)session.getAttribute("gio"); */
           	%>
      		
      		<%if(session.getAttribute("hoadon")!=null && hoadon.ds.size()!=0){%> 
      			
      		
      		<thead>
      			<tr>
      				<th>Mã hóa đơn</th>
                	<th>Mã khách hàng</th>
                	<th>Ngày đặt</th>
                	<th>Tình trạng</th>
                	<th>Tên khách hàng</th>
      			</tr>
      		</thead>
      		<% }%> 
      		
      		<%  
      			if(hoadon!=null){
      	  			for(hoadonbean s: hoadon.ds){		
      		%> 
      		
      		<tbody>
      			<tr>
      			<form action="htgioservlet" method="post" class="input-group pl-4 pr-4"> 	<!-- Bắt đầu form sửa xóa -->   
          			<td> <%=s.getMaHoaDon()%></td>
           			<td> <%=s.getMakh()%> </td>
           			<td> <%=s.getNgayMua()%> </td>
           			<td><%=s.getDamua()==0?"Chưa mua":"Đã mua"%></td>
           			<td><%=request.getAttribute("tendn") %></td>
           					
      		<%} }%>	
      			
      			</tr>
      			<tr>
      				<td  colspan="6">
      					<div class="butmuahang d-flex justify-content-center">
      						<a href="" class="btn btn-success btn-check-out pl-4 pr-4">
      							<span>Xác nhận mua</span>
      						</a>
      					</div>
      				</td>
      			</tr>
      			</form> <!-- Kết thúc form sửa xóa -->   
      		</tbody>
      	</table>
      </td>
   </tr>
</table>
</body>
</html>

