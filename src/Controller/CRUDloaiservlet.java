package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.loaibean;
import bo.loaibo;
import dao.loaidao;

/**
 * Servlet implementation class actionloaiadminCRUD
 */
@WebServlet("/CRUDloaiservlet")
public class CRUDloaiservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CRUDloaiservlet() {
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
		
		
		if(request.getParameter("butthemloai")!=null) {
			String maloai = request.getParameter("txtml");
			String tenloai = request.getParameter("txttl");
			if(maloai!=null && tenloai!=null) {
				loaidao ld = new loaidao();
				if (ld.themLoai(maloai, tenloai)==true) {
					response.sendRedirect("loaiadminCRUDservlet");
				}
			}
		}
		if(request.getParameter("butsualoai")!=null) {
			String maloaicu= request.getParameter("butsualoai");
			
			String maloai = request.getParameter("txtmls");
			String tenloai = request.getParameter("txttls");
			if(maloai!=null && tenloai!=null) {
				loaidao ld = new loaidao();
				if (ld.suaLoai(maloaicu, maloai, tenloai)==true) {
					response.sendRedirect("loaiadminCRUDservlet");
				}
			}
		}
		if(request.getParameter("butxoa")!=null) {
			String ms = request.getParameter("butxoa");
			loaidao ld = new loaidao();
			if (ld.xoaLoai(ms)==true) {
				response.sendRedirect("loaiadminCRUDservlet");
			}
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
