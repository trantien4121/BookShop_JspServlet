package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.loaibean;
import bo.loaibo;
import bo.xacnhanbo;

/**
 * Servlet implementation class loaiadminCRUDservlet
 */
@WebServlet("/loaiadminCRUDservlet")
public class loaiadminCRUDservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loaiadminCRUDservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
	    if(session.getAttribute("admin")!=null) {
//			xacnhanbo xnbo=new xacnhanbo();
//		    request.setAttribute("ds", xnbo.getdanhsach());
//		    RequestDispatcher rd=request.getRequestDispatcher("xacnhan.jsp");
//		    rd.forward(request, response);
	    	loaibo lbo = new loaibo();
	    	ArrayList<loaibean> dsloai = lbo.getLoai();
	    	request.setAttribute("dsloai", dsloai);
	    	RequestDispatcher rd = request.getRequestDispatcher("loaiadminCRUD.jsp");
	    	rd.forward(request, response);
		 }else
			 response.sendRedirect("dangnhapadminservlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
