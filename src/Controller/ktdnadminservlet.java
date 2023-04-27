package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DangNhapdao;

/**
 * Servlet implementation class ktdnadminservlet
 */
@WebServlet("/ktdnadminservlet")
public class ktdnadminservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ktdnadminservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String un = request.getParameter("txtun");
		String pass = request.getParameter("txtpass");
		if (un!=null && pass!=null) {
			DangNhapdao DN = new DangNhapdao();
			try {
				if (DN.KtDangNhapadmin(un, pass)==true){	//Dang nhap dung
					//Tao doi tuong session
					HttpSession session = request.getSession();
					session.setAttribute("dn", un);
					
//				RequestDispatcher rd = request.getRequestDispatcher("htsachservlet");
//				rd.forward(request, response);	 Code cũ thầy
					response.sendRedirect("htadminpage");
				} else {	//Dang nhap sai
					//int i=1;
					RequestDispatcher rd = request.getRequestDispatcher("dangnhapadmin.jsp?isLogin=false");
					HttpSession session = request.getSession();
					
					request.setAttribute("isLogin", 0);
					rd.forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else { //chay Lan dau
//			RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
//			rd.forward(request, response);		Code cũ Thầy
			
			response.sendRedirect("dangnhapadminservlet");
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
