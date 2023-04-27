<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="bean.dangnhapadminbean"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@page import="bean.xacnhanbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Page - CRUD Sách</title>
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
<body style="padding-top: 75px">
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
					href="htadminpage" style="color: #fff;">Trang chủ</a></li>
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
				<li><a href="#" class="nav-link ml-3" href="htsachservlet"
					style="color: #fff;"><span class="glyphicon glyphicon-user"></span>
						Sign Up</a></li>
				<li>
					<%
					if (session.getAttribute("admin") == null) {
					%> <a href="dangnhapadminservlet" class="nav-link ml-3"
					href="htsachservlet" style="color: #fff;"> <span
						class="glyphicon glyphicon-log-in"></span> Login
				</a> <%
 } else {
 %> <a href="#" class="nav-link ml-3" href="htsachservlet"
					style="color: #fff;"> <i class="fa fa-sign-out"
						aria-hidden="true"></i> Hi: <%
 dangnhapadminbean kh = (dangnhapadminbean) session.getAttribute("admin");
 out.print(kh.getTenDangNhap());
 %>
				</a> <%
 }
 %>
				</li>
			</ul>
		</div>
	</nav>

	<table class="table table-hover">
		<c:if test="${dssach!=null}">
			<thead>
				<tr>
					<th>Mã sách</th>
					<th>Tên sách</th>
					<th>Ảnh</th>
					<th>Số lượng</th>
					<th>Giá</th>
					<th>Tác giả</th>
					<th>
						<div class="modalthemloai d-flex justify-content-center">
							<button type="button" class="btn btn-success" data-toggle="modal"
								data-target="#exampleModal" data-whatever="@getbootstrap">Thêm
								mới sách</button>
							<form action="CRUDsachservlet" method="post" enctype= "multipart/form-data">
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Thêm
													loại sách</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<label for="maloai" class="col-form-label">Mã
														sách:</label> <input type="text" class="form-control" id="masach"
														name="txtms">
												</div>
												<div class="form-group">
													<label for="tenloai" class="col-form-label">Tên
														sách:</label> <input type="text" class="form-control"
														id="tensach" name="txtts">
												</div>
												<div class="form-group">
													<label for="tenloai" class="col-form-label">Ảnh:</label> <input type="file" name="txtfile">
												</div>
												<div class="form-group">
													<label for="tenloai" class="col-form-label">Giá:</label> <input type="text" class="form-control"
														id="giasach" name="txtgia">
												</div>
												<div class="form-group">
													<label for="tenloai" class="col-form-label">Tác giả:</label> <input type="text" class="form-control"
														id="tacgia" name="txttg">
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Trở lại</button>
												<button type="submit" name="butthemsach" value="1"
													class="btn btn-primary">Thêm</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</th>
				</tr>
			</thead>
		</c:if>

		<c:forEach var="l" items="${dssach}">
			<tbody>
				<tr>
					<td>${l.getMasach()}</td>
					<td>${l.getTensach()}</td>
					<td>
						<img src="${l.getAnh()}" alt="" width=80px />
					</td>
					<td>${l.getSoluong()}</td>
					<td>${l.getGia()}</td>
					<td>${l.getTacgia()}</td>
					<td>
						<div class="butsuaxoa d-flex justify-content-center">

							<!-- Sửa -->
							<%-- <button name="butsua" value="${l.getMaloai()}"
								class="btn btn-info ml-2" type="submit">Update</button> --%>
								
							<c:set var ="masach" value ="${fn:replace(l.getMasach(),' ', '')}" />	<!-- Xóa khoảng trắng -->
							<div class="modalsualoai d-flex justify-content-center">
								<button type="button" class="btn btn-info" data-toggle="modal"
									data-target="#modalsua${masach}" data-whatever="@getbootstrap">Chỉnh
									sửa</button>
								<form action="CRUDsachservlet" method="post">
									<div class="modal fade" id="modalsua${masach}" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Sửa
														thông tin sách</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<label for="maloai" class="col-form-label">Mã loại
															sách:</label> 
															<input type="text" class="form-control" id="maloai"
															name="txtmls" value="${l.getMasach()}">
													</div>
													<div class="form-group">
														<label for="tenloai" class="col-form-label">Tên
															loại sách:</label> 
															<input type="text" class="form-control"
															id="tenloai" name="txttls" value="${l.getTensach()}">
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Trở lại</button>
													<button type="submit" name="butsuasach" value="${l.getMasach()}"
														class="btn btn-primary">Lưu thay đổi</button>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>

							<!-- Xóa -->
							<form action="CRUDsachservlet" method="post">
								<button name="butxoasach" value="${l.getMaloai()}"
									class="btn btn-danger ml-2" type="submit">
									<i class="fa fa-trash" aria-hidden="true"></i>
								</button>
							</form>
						</div>
					</td>

				</tr>
			</tbody>
		</c:forEach>

	</table>

</body>
</html>
