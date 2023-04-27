<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.giohangbo"%>
<%@page import="bo.hoadonbo"%>
<%@page import="dao.hoadondao"%>
<%@page import="dao.DangNhapdao"%>
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
	
	<!-- Popper Js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

	<!-- Bootstrap 4 Framework -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	
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
            <li class="nav-item">
              <a class="nav-link ml-3" href="htsachservlet" style="color: #fff;"><i class="fa fa-home" aria-hidden="true"></i> Trang chủ <span class="sr-only">(current)</span></a>
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
                <a class="nav-link ml-3" href="htthanhtoanservlet" style="color: #fff"> <i class="fa fa-money mr-2" aria-hidden="true"></i> Thanh toán</a>
                <% 
              			
              		hoadondao hd = new hoadondao();
              		int soHoaDon = 0;
              		String tendn="";
              		if(session.getAttribute("dn")!=null){
              			tendn = session.getAttribute("dn").toString();
              			DangNhapdao dnha = new DangNhapdao();
                  		
                  		int makh = dnha.getMakh(tendn);
                  		
                  		soHoaDon = hd.getTongHoaDon(makh);
              		}
              		
              		if(soHoaDon!=0){
              			
              	%>
              		<span class="header__cart-notice"><%=soHoaDon%></span>
              	<%} %>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-3" href="htlichsumuahangservlet" style="color: #fff"> <i class="fa fa-history" aria-hidden="true"></i> Lịch sử mua</a>
                 <% 
                	int soLsMua = 0;
              		if(session.getAttribute("dn")!=null){
              			tendn = session.getAttribute("dn").toString();
              			DangNhapdao dnha = new DangNhapdao();
                  		
                  		int makh = dnha.getMakh(tendn);
                  		
                  		soLsMua = hd.getTongLichSuMua(makh);
              		}
              		
              		if(soLsMua!=0){
              			
              	%>
              		<span class="header__cart-notice"><%=soLsMua%></span>
              	<%} %>
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
      <td width="200" valign="top"> <span style="font-weight: 700">Loại sách</span>
      	<table>
      		<%--  <%	//loaibo lbo=new loaibo();	TRuowcs khi servlet
        		//ArrayList<loaibean> dsloai=lbo.getLoai();
        		ArrayList<loaibean> dsloai= (ArrayList<loaibean>)request.getAttribute("dsloai");
        		
        		 for(loaibean l: dsloai){
      		%>
          	<tr>
           		<td>
            		<a href="htsachservlet?ml=<%=l.getMaloai() %>">
            		<!-- <a href="htsachservlet"> -->
             			<%=l.getTenloai()%>
             		</a> 
          		</td>
          	</tr> 
          		 <%}%> --%>
          	<c:forEach var="l" items="${dsloai}">
          	<tr>
           		<td>
            		<div class="loaisach">
            			<a href="htsachservlet?ml=${l.getMaloai()}" style="text-decoration: none">
             			${l.getTenloai()}
             		</a>
            		</div> 
          		</td>
          	</tr>
          	</c:forEach>
       	</table>
       </td>
      <td width="800" valign="top"> <span style="font-weight: 700">Hiển thị sách</span>
      	<table class="mt-2">
      		<%
      		ArrayList<sachbean> dssach = (ArrayList<sachbean>) request.getAttribute("dssach");

      		int n = dssach.size();
      		for (int i = 0; i < n; i++) {
      			sachbean s = dssach.get(i);
      		%>
         <tr>
         <td class="pb-5">
            <img src="<%=s.getAnh() %>" width="200px" height="200px" class="mb-1"><br>
            <%=s.getTensach() %> <br>
            Tác giả: <%=s.getTacgia() %> <br>
            Giá: <%=s.getGia() %> đ<br>
            
			 <%if (session.getAttribute("dn")!=null) {%>		
            	<a href="giohangservlet?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
            		<img src="buynow.jpg" class="mt-2"> <br>
            	</a>
            <%}else{ %>
            	<a href="" onclick=buyFailed()>
            		<img src="buynow.jpg" class="mt-2"> <br>
            	</a>
            <%}%>
            
         </td>
         <%i++;
         if(i<n){
         s=dssach.get(i);%>
         <td class="pr-5 pl-5 pb-5">
            <img src="<%=s.getAnh() %>" width="200px" height="200px" class="mb-1"> <br>
            <%=s.getTensach() %> <br>
            Tác giả: <%=s.getTacgia() %> <br>
            Giá: <%=s.getGia() %> đ <br>
            
            <%if (session.getAttribute("dn")!=null) {%>		
            	<a href="giohangservlet?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
            		<img src="buynow.jpg" class="mt-2"> <br>
            	</a>
            <%}else{ %>
            	<a href="" onclick=buyFailed()>
            		<img src="buynow.jpg" class="mt-2"> <br>
            	</a>
            <%}%>
            
         </td>
         <%} %>
         <%i++;
         if(i<n){
         s=dssach.get(i);%>
         <td class="pb-5">
            <img src="<%=s.getAnh() %>" width="200px" height="200px" class="mb-1"> <br>
            <%=s.getTensach() %> <br>
            Tác giả: <%=s.getTacgia() %> <br>
            Giá: <%=s.getGia() %> đ <br>
            
			 <%if (session.getAttribute("dn")!=null) {%>		
            	<a href="giohangservlet?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
            		<img src="buynow.jpg" class="mt-2"> <br>
            	</a>
            <%}else{ %>
            	<a href="" onclick=buyFailed()>
            		<img src="buynow.jpg" class="mt-2"> <br>
            	</a>
            <%}%>
			
         </td>
         <%} %>
         </tr>
       <%} %>
      		
       	</table>
      </td>
      <td width="200" valign="top"> <span style="font-weight: 700">Tìm kiếm</span>
      	<form action="htsachservlet" method="post" class="form-group pt-1">
 		 <input  name="txttk" type="text" value="" placeholder="Nhập thông tin sách" class="form-control"><br>
  		 <input name="butt" type="submit" value="Search" class="btn btn-success" style="margin-top: -10px">
		</form>
      	
      </td>
   </tr>

</table>

<c:choose>
	<c:when test="${dssach.size()!=0}">
		<ul class="pagination d-flex justify-content-center">
			<li><span class="active"></span></li>
			<c:forEach var="i" begin="${curentPage+1}" end="${TotalPage}" step="1">
				<li>
					<a class="page-link" href="htsachservlet?page=${i}">${i}</a>
				</li>
			</c:forEach>
		</ul>
	</c:when>
	<c:otherwise>
	
	</c:otherwise>
</c:choose>


	<script>
		function buyFailed(){
            alert("Bạn cần đăng nhập để mua hàng")
        }
	</script>
</body>
</html>
