<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
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
              <a class="nav-link ml-3" href="htgio.jsp" style="color: #fff"> <i class="fa fa-cart-plus" aria-hidden="true"></i> Giỏ hàng</a>
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
                <a href="#" style="color: #fff; text-decoration: none;">
                   <i class="fa fa-user" aria-hidden="true"></i> Register
                </a>
            </li>
            <li>
                <a href="dangnhap.jsp" style="color: #fff;text-decoration: none;">
                    <i class="fa fa-user-circle-o" aria-hidden="true"></i> Login
                </a>
            </li>
          </ul>
        </div>
    </nav>
<table width="1200" align="center" class="mt-3">
   <tr>
      
      <td width="1200" valign="top"> 
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
                            	Đăng ký
                            </div>
                        </div>
                  		<!-- <div class="card-body">
                      		<div class="form-group">
                        		<label for="username">Username</label>
                        		<input type="text"
                          			class="form-control" name="txtun" placeholder="Username">
                      		</div>
                      		<div class="form-group">
                          		<label for="password">Password</label>
                          		<input type="password"
                            		class="form-control" name="txtpass" placeholder="Password">
                      		</div>
                      		<div class="form-group">
                          		<label for="password">Confrim Password</label>
                          		<input type="password"
                            		class="form-control" name="txtpassagain" placeholder="Password">
                      		</div>
                  		</div> -->
                  		<div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                    	<label for="username">Username</label>
                        			  	<input type="text"
                          				class="form-control" name="txtun" placeholder="Username">
                                      	<small id="usernameHid" class="form-text text-muted">Username is required</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="fullname">Fullname</label>
                        				<input type="text"
                          			class="form-control" name="txtname" placeholder="fullname">
                                        <small id="fullnameHid" class="form-text text-muted">Fullname is required</small>
                                    </div>
                                     <div class="form-group">
                                        <label for="address">Address</label>
                        				<input type="text"
                          			class="form-control" name="txtdiachi" placeholder="Address">
                                        <small id="AddressHid" class="form-text text-muted"></small>
                                    </div>
                                    <div class="form-group">
                                        <label for="username">Phone Number</label>
                        				<input type="text"
                          			class="form-control" name="txtsodienthoai" placeholder="Phone number">
                                        <small id="PhoneNumberHid" class="form-text text-muted"></small>
                                    </div>
                                </div>
                                <div class="col">
                                	<div class="form-group">
                                      <label for="email">Email</label>
                                      <input type="text" class="form-control" name="txtemail" placeholder="Email">
                                      <small id="emailHid" class="form-text text-muted">Email is required</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password</label>
                          				<input type="password"
                            			class="form-control" name="txtpass" placeholder="Password">
                            			<small id="PasswordHid" class="form-text text-muted">Password is required</small>
                                    </div>
                                    <div class="form-group">
                                    	<label for="password">Confrim Password</label>
                          				<input type="password"
                            			class="form-control" name="txtpassagain" placeholder="Password">
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                  		<div class="card-footer text-muted d-flex justify-content-center">
                      		<button class="btn btn-success" type="submit">Register</button>
                  		</div>
              		</div>
       			</div>
       		</div>
       			
       			
       			<%-- <% if(request.getParameter("isRegister")!=null){
    	   			out.print("<center><b>Register Fail!</b></center>");
       			} %>  --%>
       			
       			<c:if test="${isRegister==0}">
					<center><b>Register Failed!</b></center>     			
       			</c:if>
       			
    		</form>
       	</table>
      </td>
   </tr>

</table>
</body>
</html>
