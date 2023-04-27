package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DangKydao;
import dao.DangNhapdao;

/**
 * Servlet implementation class ktdkservlet
 */
@WebServlet("/ktdkservlet")
public class ktdkservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ktdkservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String un = request.getParameter("txtun");
		String pass = request.getParameter("txtpass");
		String passagain = request.getParameter("txtpassagain");
		String hoten = request.getParameter("txtname");
		String diachi = request.getParameter("txtdiachi");
		String sodienthoai = request.getParameter("txtsodienthoai");
		String email = request.getParameter("txtemail");
		if (un!=null && pass!=null && passagain!=null && hoten!=null && email!=null && diachi!=null && sodienthoai!=null) {
			DangKydao dk = new DangKydao();
			try {
				if (dk.dangKy(un, pass, passagain, hoten, diachi, sodienthoai, email)==true){	//Dang nhap dung
					//Tao doi tuong session
					HttpSession session = request.getSession();
					session.setAttribute("dn", un);
					
//				RequestDispatcher rd = request.getRequestDispatcher("htsachservlet");
//				rd.forward(request, response);	 Code cũ thầy
					response.sendRedirect("htsachservlet");
				} else {	//Dang nhap sai
					RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp?isRegister=false");
					request.setAttribute("isRegister", 0);
					rd.forward(request, response);	
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else { //chay Lan dau			
			response.sendRedirect("dangkyservlet");
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
