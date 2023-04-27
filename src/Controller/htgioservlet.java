package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.loaibean;
import bo.giohangbo;
import bo.loaibo;

/**
 * Servlet implementation class htgioservlet
 */
@WebServlet("/htgioservlet")
public class htgioservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public htgioservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		loaibo lbo=new loaibo();
		ArrayList<loaibean> dsloai=lbo.getLoai();
		request.setAttribute("dsloai", dsloai);

		// Bat dau hanh dong xoa sua
		HttpSession session = request.getSession();
		giohangbo gh = (giohangbo) session.getAttribute("gio");
		
		
		if(request.getParameterValues("check")!=null) {
			//Hiển thị all các giá trị butcheck vừa chọn
			String[] gtcheck = request.getParameterValues("check");
			if(request.getParameterValues("butsua")==null && request.getParameterValues("butxoa")==null) {
				for(String ss: gtcheck) 
					gh.xoaMotSach(ss);
			}
		}
		if(request.getParameter("butsua")!=null) {
			String ms = request.getParameter("butsua");
			Long sl = Long.parseLong(request.getParameter("txtsl"+"-"+ms));
			gh.CapnhapCart(ms, sl);
		}
		if(request.getParameter("butxoa")!=null) {
			String ms = request.getParameter("butxoa");
			gh.xoaMotSach(ms);
		}
		
		if(request.getParameter("butxoatatca")!=null) {
			gh.xoaTatCa();
		}		
		// Ket Thu Hanh Dong Xoa sua

			
		
		if(gh!=null) {
			if(gh.ds.size()!=0) {
				//Hiển thị hàng ra giỏ
				RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
				rd.forward(request, response);
			}
			else {
				//Nếu giỏ hàng không có sản phẩm thì chuyển về htsachservlet
				response.sendRedirect("htsachservlet");
			}
		}else {
			//Nếu chưa có giỏ(session gio là null) thì forward về htgio.jsp
			RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
			rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
