<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- Popper Js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>

<!-- Bootstrap 4 Framework -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>


<title>MT Store</title>
</head>
<style>
.nav-item {
	position: relative;
}

.header__cart-notice {
	position: absolute;
	top: 0px;
	right: 90px;
	padding: 1px 5px;
	font-size: 0.6rem;
	/* line-height: 1rem; */
	border: 2px solid #7B6BEE;
	border-radius: 50%;
	background-color: #fff;
	color: #7B68EE;
}

/* begin filter css */
.home-filter {
	display: flex;
	align-items: center;
	padding: 12px 22px;
	border-radius: 2px;
	background-color: rgba(0, 0, 0, 0.04);
}

.home-filter__label {
	font-size: 16px;
	font-weight: 500;
	color: #333;
	margin-right: 16px;
}

.home-filter__btn {
	background-color: #fff;
	min-width: 90px;
	margin-right: 12px;
	font-weight: 500;
}

.home-filter__page {
	display: flex;
	align-items: center;
	margin-left: auto; /*Tự động dịch*/
}

.home-filter__page-num {
	font-size: 16px;
	color: black;
	margin-right: 22px;
}

.home-filter__page-current {
	color: #7B68EE;
}

.home-filter__page-control {
	border-radius: 2px;
	overflow: hidden;
	display: flex;
	width: 72px;
	height: 36px;
}

.home-filter__page-btn {
	flex: 1;
	display: flex;
	background-color: #7B68EE;
	text-decoration: none;
}

.home-filter__page-btn--disable {
	cursor: default;
	background-color: #f9f9f9;
}

.home-filter__page-btn--disable .home-filter__page-icon {
	color: #ccc;
}

.home-filter__page-btn:first-child {
	border-right: 1px solid #EEE;
}

.home-filter__page-icon {
	font-size: 16px;
	margin: auto;
	color: #fff;
}

/* end filter css */


</style>
<body style="padding-top: 80px">
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		style="background-color: #7B68EE; height: 12vh">
		<a class="navbar-brand ml-5 pl-5" href="#"
			style="color: #fff; font-weight: 700;">MT Store</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent"
			style="font-weight: 600">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link ml-3"
					href="htsachservlet" style="color: #fff;"><i class="fa fa-home"
						aria-hidden="true"></i> Trang chủ <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link ml-3"
					href="htgioservlet" style="color: #fff"> <i
						class="fa fa-cart-plus mr-2" aria-hidden="true"></i> <span>Giỏ
							hàng</span> <%
 giohangbo gh = (giohangbo) session.getAttribute("gio");
 if (session.getAttribute("gio") != null && gh.ds.size() != 0) {
 %> <span class="header__cart-notice"><%=gh.ds.size()%></span> <%
 }
 %>
				</a></li>
				<li class="nav-item"><a class="nav-link ml-3"
					href="htthanhtoanservlet" style="color: #fff"> <i
						class="fa fa-money mr-2" aria-hidden="true"></i> Thanh toán
				</a> <%
 hoadondao hd = new hoadondao();
 int soHoaDon = 0;
 String tendn = "";
 if (session.getAttribute("dn") != null) {
 	tendn = session.getAttribute("dn").toString();
 	DangNhapdao dnha = new DangNhapdao();

 	int makh = dnha.getMakh(tendn);

 	soHoaDon = hd.getTongHoaDon(makh);
 }

 if (soHoaDon != 0) {
 %> <span class="header__cart-notice"><%=soHoaDon%></span> <%
 }
 %></li>
				<li class="nav-item"><a class="nav-link ml-3"
					href="htlichsumuahangservlet" style="color: #fff"> <i
						class="fa fa-history mr-2" aria-hidden="true"></i> Lịch sử mua
				</a> <%
 int soLsMua = 0;
 if (session.getAttribute("dn") != null) {
 	tendn = session.getAttribute("dn").toString();
 	DangNhapdao dnha = new DangNhapdao();

 	int makh = dnha.getMakh(tendn);

 	soLsMua = hd.getTongLichSuMua(makh);
 }

 if (soLsMua != 0) {
 %> <span class="header__cart-notice"><%=soLsMua%></span> <%
 }
 %></li>
				<li>
					<form class="form-inline ml-3 pl-3" action="htsachservlet"
						method="post">
						<input class="form-control mr-sm-2" name="txttk" value=""
							type="text" placeholder="Search" aria-label="Search"
							style="width: 75%">
						<button class="btn my-2 my-sm-0" type="submit"
							style="background-color: white">
							<i class="fa fa-search" aria-hidden="true" style="color: #7B68EE"></i>
						</button>
					</form>
				</li>
			</ul>
			<ul class="navbar-nav mr-5 pr-5">
				<li class="mr-3">
					<!--   <a href="#" style="color: #fff">
                   <i class="fa fa-user" aria-hidden="true"></i> Register
                </a>	--> <%
 if (session.getAttribute("dn") == null) {
 %> <a href="dangkyservlet" style="color: #fff; text-decoration: none;">
						<i class="fa fa-user" aria-hidden="true"></i> Register
				</a> <%
 }
 %>
				</li>
				<li>
					<%
					if (session.getAttribute("dn") == null) {
					%> <a href="dangnhapservlet"
					style="color: #fff; text-decoration: none;"> <i
						class="fa fa-user-circle-o" aria-hidden="true"></i> Login
				</a> <%
 } else {
 %> <a href="#" style="color: #fff; text-decoration: none;"
					class="drop-down"> <i class="fa fa-user-circle-o"
						aria-hidden="true"></i> <%=session.getAttribute("dn")%>
				</a> <a href="dangxuat.jsp" class="ml-3"
					style="color: #fff; text-decoration: none;" class="drop-down">
						<i class="fa fa-sign-out" aria-hidden="true"></i>
				</a> <%
 }
 %>
				</li>
			</ul>
		</div>
	</nav>

	<main class="container-fluid mt-3 mb-3">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="row">
					<div class="col-3 pt-3" style="background-color: #7B68EE;">
						<div class="header__title-tesach">
							<span style="color: white; font-weight: 700"> Loại sách </span>
						</div>
						<c:forEach var="l" items="${dsloai}">

							<div class="loaisach pt-3" style="border-bottom: 1px solid white">
								<i class="fa fa-chevron-right mr-1" aria-hidden="true"
									style="color: white"></i> <a
									href="htsachservlet?ml=${l.getMaloai()}"
									style="text-decoration: none; color: white; font-weight: 400">
									${l.getTenloai()} </a>
							</div>

						</c:forEach>
					</div>
					<div class="col-9">
						<!-- begin filter sesion -->
						<div class="home-filter">
							<span class=" __label">Sắp xếp theo</span>
							<button class="home-filter__btn btn"
								style="background-color: #7B68EE; color: white">Tất cả</button>
							<button class="home-filter__btn btn">Phổ biến</button>
							<button class="home-filter__btn btn">Mới nhất</button>
							<button class="home-filter__btn btn">Bán chạy</button>

							<div class="home-filter__page">
								<span class="home-filter__page-num"> <span
									class="home-filter__page-current">${currentPage}</span>/20
								</span>

								<div class="home-filter__page-control">
									<c:choose>
										<c:when test="${currentPage lt 2 }">
											<div
												class="home-filter__page-btn home-filter__page-btn--disable"
												style="text-decoration: none"> <i
												class=" home-filter__page-icon fa fa-chevron-left"></i>
											</div> 
										</c:when>
										<c:otherwise>
											<a href="htsachservlet?page=${currentPage -1}"
												class="home-filter__page-btn"
												style="text-decoration: none"> <i
												class=" home-filter__page-icon fa fa-chevron-left"></i>
											</a> 
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${currentPage lt TotalPage }">
											<a href="htsachservlet?page=${currentPage +1}"
												class="home-filter__page-btn home-filter__page-btn"
												style="text-decoration: none"> <i
												class=" home-filter__page-icon fa fa-chevron-right"></i>
											</a> 
										</c:when>
										<c:otherwise>
											<div
												class="home-filter__page-btn home-filter__page-btn--disable"
												style="text-decoration: none"> <i
												class=" home-filter__page-icon fa fa-chevron-right"></i>
											</div> 
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<!-- end filter sesion -->
						<div class="row" style="background-color: rgba(0, 0, 0, 0.04); margin: 12px 1px 0 1px">
							<%
							ArrayList<sachbean> dssach = (ArrayList<sachbean>) request.getAttribute("dssach");

				      		int n = dssach.size();
				      		for (int i = 0; i < n; i++) {
				      			sachbean s = dssach.get(i);
							%>
							<div class="col-4" style="border: 1px solid #7B68EE;">
								<div class="cart-sach" style="text-align: center; font-weight: 500">
									<img src="<%=s.getAnh() %>" width="220px" height="220px" class="mb-3 mt-3"><br> 
            						<div class="cart-sach__title" style="line-height: 30px; max-height: 30px;overflow: hidden; ">
            							Tên sách: <%=s.getTensach() %>
            						</div>
            						<div class="cart-sach-author" style="line-height: 20px; max-height: 20px; overflow: hidden">
            							Tác giả: <%=s.getTacgia() %>
            						</div>
            						Giá: <%=s.getGia() %> đ<br>
            
			 						<div class="btn-AddtoCart d-flex justify-content-center pb-3">
			 							<%if (session.getAttribute("dn")!=null) {%>		
            								<a href="giohangservlet?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
            									<img src="buynow.jpg" class="mt-2"> <br>
            								</a>
            							<%}else{ %>
            								<a href="" onclick=buyFailed()>
            									<img src="buynow.jpg" class="mt-2"> <br>
            								</a>
            							<%}%>
			 						</div>
								</div>
							</div>
							<%i++;
         					if(i<n){
         					s=dssach.get(i);%>
							<div class="col-4" style="border-top: 1px solid #7B68EE; border-bottom: 1px solid #7B68EE;">
								<div class="cart-sach" style="text-align: center; font-weight: 500">
									<img src="<%=s.getAnh() %>" width="220px" height="220px" class="mb-3 mt-3"><br> 
            						<div class="cart-sach__title" style="line-height: 30px; max-height: 30px;overflow: hidden; ">
            							Tên sách: <%=s.getTensach() %>
            						</div>
            						<div class="cart-sach-author" style="line-height: 20px; max-height: 20px; overflow: hidden">
            							Tác giả: <%=s.getTacgia() %>
            						</div>
            						Giá: <%=s.getGia() %> đ<br>
            
			 						<div class="btn-AddtoCart d-flex justify-content-center pb-3">
			 							<%if (session.getAttribute("dn")!=null) {%>		
            								<a href="giohangservlet?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
            									<img src="buynow.jpg" class="mt-2"> <br>
            								</a>
            							<%}else{ %>
            								<a href="" onclick=buyFailed()>
            									<img src="buynow.jpg" class="mt-2"> <br>
            								</a>
            							<%}%>
			 						</div>
								</div>
							</div>
							<%} %>
							<%i++;
         					if(i<n){
         					s=dssach.get(i);%>
							<div class="col-4" style="border: 1px solid #7B68EE">
								<div class="cart-sach" style="text-align: center; font-weight: 500">
									<img src="<%=s.getAnh() %>" width="220px" height="220px" class="mb-3 mt-3"><br> 
            						<div class="cart-sach__title" style="line-height: 30px; max-height: 30px;overflow: hidden; ">
            							Tên sách: <%=s.getTensach() %>
            						</div>
            						<div class="cart-sach-author" style="line-height: 20px; max-height: 20px; overflow: hidden">
            							Tác giả: <%=s.getTacgia() %>
            						</div>
            						
            						Giá: <%=s.getGia() %> đ<br>
            
			 						<div class="btn-AddtoCart d-flex justify-content-center pb-3">
			 							<%if (session.getAttribute("dn")!=null) {%>		
            								<a href="giohangservlet?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
            									<img src="buynow.jpg" class="mt-2"> <br>
            								</a>
            							<%}else{ %>
            								<a href="" onclick=buyFailed()>
            									<img src="buynow.jpg" class="mt-2"> <br>
            								</a>
            							<%}%>
			 						</div>
								</div>
							</div>
							<%} %>
							<%} %>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>
	<table class="d-flex justify-content-center pb-4 pt-3">
			<tr>
				<%-- For displaying Previous link except for the 1st page --%>
				<c:if test="${currentPage != 1}">
					<td>
						<a href="htsachservlet?page=${currentPage -1}" style="color: white; text-decoration: none;">
							<button class="btn" style="background-color: #7B68EE">
								<i class=" home-filter__page-icon fa fa-chevron-left" style="color: white"></i>
							</button>
						</a>
					</td>
				</c:if>

				<td>
					<%-- For displaying Page numbers, The when condition does not display a link for the current page --%>
					<table>
						<tr>
							<c:forEach begin="${currentPage}" end="${currentPage+4}" var="i"> <!-- trước là begin 1 end 20 -->
								<c:choose>
									<c:when test="${currentPage eq i}">
										<td>
											<button class="btn m-1" style="color: white; background-color: #7B68EE">
												${i}
											</button>
										</td>
									</c:when>
									<c:otherwise>
										<td>
											<c:if test="${i lt TotalPage}"> <!-- Mới thêm -->
											<a href="htsachservlet?page=${i}" style="color: black; text-decoration: none;">
												<button class="btn btn-outline-primary m-1">
													${i}
												</button>
											</a>
											
											</c:if>
										</td>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tr>
					</table>
				</td>

				<%-- For displaying Next link --%>
				<c:if test="${currentPage lt TotalPage}">
        			<td>
        				<a href="htsachservlet?page=${currentPage + 1}" style="color: white; text-decoration: none;">
        					<button class="btn" style="background-color: #7B68EE">
        						<i class=" home-filter__page-icon fa fa-chevron-right" style="color: white"></i>
        					</button>
        				</a>
        			</td>
    			</c:if>
			</tr>
		</table>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script>
		function buyFailed(){
            alert("Bạn cần đăng nhập để mua hàng")
        }
	</script>
</body>
</html>
