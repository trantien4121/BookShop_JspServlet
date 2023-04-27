<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@page import="bean.sachbean"%>
<%@page import="bean.giohangbean"%>
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

<title>MT Store</title>
</head>
<style>
.nav-item {
	position: relative
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

.tbd {
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
	<table width="1200" align="center" class="mt-3 tbd">
		<tr>

			<td width="1000" valign="top" class="pr-4"><span
				style="font-weight: 700">Hiển thị sách</span>
				<table class="table table-hover mt-2 table-bordered">
					<%
					/*giohangbo gh=
					(giohangbo)session.getAttribute("gio"); */
					%>

					<%-- <%if(session.getAttribute("gio")!=null && gh.ds.size()!=0){%> --%>
					<c:if test="${gio!=null && gh.ds.size()!=0}">


						<thead>
							<tr>
								<th>Chọn</th>
								<th>Mã sách</th>
								<th>Tên sách</th>
								<th>Giá</th>
								<th class="pl-5">Số lượng</th>
								<th>Thành tiền</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
					</c:if>
					<%-- <% }%> --%>

					<%
					if (gh != null) {
						for (giohangbean s : gh.ds) {
					%>

					<tbody>
						<tr>
							<form action="htgioservlet" method="post"
								class="input-group pl-4 pr-4">
								<!-- Bắt đầu form sửa xóa -->
								<td><input type="checkbox" name="check"
									value="<%=s.getMasach()%>" /></td>
								<td><%=s.getMasach()%></td>
								<td><%=s.getTensach()%></td>
								<td><%=s.getGia()%></td>
								<td width="150px"><input type="number"
									name="txtsl-<%=s.getMasach()%>" value="<%=s.getSoluong()%>"
									min=0 class="form-control"></td>
								<td><%=s.getThanhtien()%></td>
								<td>
									<!-- <button type="submit" class="btn btn-info pr-2" name="butsua" value ="Update">
							Update
						</button>
           				<button type="submit" class="btn btn-danger" name="butxoa" value ="Delete">
           					<i class="fa fa-trash" aria-hidden="true"></i>
           				</button> --> <!-- But tu thiet ke, tuong ung voi phan sua xoa da comment -->

									<div class="butsuaxoa d-flex justify-content-center">
										<button name="butsua" value="<%=s.getMasach()%>"
											class="btn btn-info" type="submit">Update</button>
										<button name="butxoa" value="<%=s.getMasach()%>"
											class="btn btn-danger ml-2" type="submit">
											<i class="fa fa-trash" aria-hidden="true"></i>
										</button>
									</div>

								</td>

								<%
								}
								}
								%>
							
						</tr>
						<%
						if (session.getAttribute("gio") != null && gh.ds.size() != 0) {
						%>

						<tr>
							<td>
								<div class="butxoachon d-flex justify-content-center">
									<button type=submit class="btn btn-clear-selection"
										style="border: 1px solid red">
										<i class="fa fa-trash" aria-hidden="true"
											style="color: red; font-size: 18px"></i>
									</button>
								</div>
							</td>
							<td colspan="4" class="pl-5 pt-3 ">
								<div class="totalprice__title d-flex justify-content-end pr-4">
									<span> <b>Tổng tiền: </b>
									</span>
								</div>
							</td>
							<td><input type="text" class="pb-1 pt-1"
								value="<%=gh.Tongtien()%>" disabled size="8" /></td>
							<td>
								<%-- <a href="xoatatcasach.jsp?sls=<%=gh.Tongtien() %>" class="btn btn-danger">
            				<i class="fa fa-trash" aria-hidden="true" style="color: white;"></i> 
            				<span class="ml-1" style="color: white">Xóa tất cả</span>
      					</a>  --%> <!-- Đoạn code chạy trên xoatatca.jsp  -->

								<div class="butxoatatca d-flex justify-content-center">
									<button type="submit" name="butxoatatca"
										value="<%=gh.Tongtien()%>" class="btn btn-danger">
										<i class="fa fa-trash" aria-hidden="true"
											style="color: white;"></i> <span class="ml-1"
											style="color: white">Xóa tất cả</span>
									</button>
								</div>
							</td>
						</tr>
						</form>
						<!-- Kết thúc form sửa xóa -->
						<td colspan="7">
							<form action="hoadonservlet" method=post>
								<div class="butmuahang d-flex justify-content-center">
									<button type="submit" name="butmuahang"
									value="<%=gh.Tongtien()%>"
									class="btn btn-success btn-check-out pl-4 pr-4">
									<span>Mua hàng</span>
								</button>
								</div>
							</form>
						</td>
						<%
						}
						%>
					</tbody>
				</table></td>
		</tr>

	</table>
</body>
</html>

