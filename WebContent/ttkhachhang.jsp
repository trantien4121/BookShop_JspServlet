<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@page import="bo.giohangbo"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
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
	<title>MT Store</title>
</head>

<style>
.nav-item{
	position: relative;
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
</style>

<body>
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #7B68EE">
    	<a class="navbar-brand ml-5" href="#" style="color: #fff; font-weight: 700;">MT Store</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link ml-3" href="htsachservlet" style="color: #fff"><i class="fa fa-home" aria-hidden="true"></i> Trang chủ <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link ml-3" href="htgioservlet" style="color: #fff"> 
              	<i class="fa fa-cart-plus mr-2" aria-hidden="true"></i>  <span>Giỏ hàng</span>
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
            </li>
            <li class="nav-item">
                <a class="nav-link ml-3" href="#" style="color: #fff"> <i class="fa fa-history" aria-hidden="true"></i> Lịch sử mua</a>
              </li>
          </ul>
          <ul class="navbar-nav mr-5">
            <li class="mr-3">
               <!--   <a href="#" style="color: #fff">
                   <i class="fa fa-user" aria-hidden="true"></i> Register
                </a>	-->
                <%if(session.getAttribute("dn")==null){ %>
                <a href="dangkyservlet" style="color: #fff;text-decoration: none;">
                   <i class="fa fa-user" aria-hidden="true"></i> Register
                </a>
                <%}%>
            </li>
            <li>
                <%if(session.getAttribute("dn")==null){ %>
                <a href="dangnhapservlet" style="color: #fff; text-decoration: none;" >
                    <i class="fa fa-user-circle-o" aria-hidden="true"></i> Login
                </a>
                <%}else{ %>
                <a href="#" style="color: #fff;text-decoration: none;" class="drop-down">
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
<table width="1200" align="center" class="mt-3">
   <tr>
      <td width="800" valign="top"> 
      	<table class="mt-2">
      		<form action="ktdkservlet" method="post">	<!-- TRUOC LA KTDN.JSP -->
       		<!--	un <input name="txtun" type="text"> <br>
       			pass <input name="txtpass" type="password"> <br>
       			<input name="but1" type="submit" value="Login"> -->
       			
       		<div class="row">
       			<div class="offset-3 col-6">
       				<div class="card mt-2">
       					<div class="card-header">
                            <div class="d-flex justify-content-center">
                            	Nhập thông tin khách hàng
                            </div>
                        </div>
                  		<div class="card-body">
                      		<div class="form-group">
                        		<label for="username">Họ tên</label>
                        		<input type="text"
                          			class="form-control" name="txtun" placeholder="Username">
                      		</div>
                      		<div class="form-group">
                        		<label for="username">Địa chỉ</label>
                        		<input type="text"
                          			class="form-control" name="txtun" placeholder="Username">
                      		</div>
                      		<div class="form-group">
                        		<label for="username">Số điện thoại</label>
                        		<input type="text"
                          			class="form-control" name="txtun" placeholder="Username">
                      		</div>
                      		<div class="form-group">
                        		<label for="username">Email</label>
                        		<input type="text"
                          			class="form-control" name="txtun" placeholder="Username">
                      		</div>
                  		</div>
                  		<div class="card-footer text-muted d-flex justify-content-end">
                      		<button class="btn btn-success" type="submit">Mua hàng</button>
                  		</div>
              		</div>
       			</div>
       		</div>
    		</form>
       	</table>
      </td>
   </tr>

</table>
</body>
</html>
