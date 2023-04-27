<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<title>MT Store</title>
<title>Đăng nhập hệ thống</title>
</head>
<body>
	<table width="1200" align="center" class="mt-5">
   <tr>
      <td width="200" valign="top"> <span style="font-weight: 700"></span>
      	<table>
       	</table>
       </td>
      <td width="800" valign="top"> 
      	<table class="mt-2">
      		<!-- <form action="ktdnadminservlet" method="post"> -->	<!-- TRUOC LA KTDN.JSP -->
      		<form action="dangnhapadminservlet" method="post">
       		<!--	un <input name="txtun" type="text"> <br>
       			pass <input name="txtpass" type="password"> <br>
       			<input name="but1" type="submit" value="Login"> -->
       			
       		<div class="row">
       			<div class="offset-3 col-6">
       				<div class="card mt-2">
       					<div class="card-header">
                            <div class="d-flex justify-content-center">
                            	<b>Admin đăng nhập</b>
                            </div>
                        </div>
                  		<div class="card-body">
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
                  		</div>
                  		<div class="card-footer text-muted d-flex justify-content-center">
                      		<button class="btn btn-success" type="submit">Login</button>
                  		</div>
              		</div>
       			</div>
       		</div>
       			
       			
       			<%-- <% if(request.getParameter("isLogin")!=null){
    	   			out.print("<center><b>Login Fail!</b></center>");
       			} %> --%>
       			<c:if test="${isLogin ==0 }">
					<center><b>Login Failed!</b></center> 			
       			</c:if>
    		</form>
       	</table>
      </td>
      <td width="200" valign="top"> <span style="font-weight: 700"></span>
      </td>
   </tr>

</table>
</body>
</html>