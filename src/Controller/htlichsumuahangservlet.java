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

import bean.hoadonbean;
import bean.lichsumuahangbean;
import dao.DangNhapdao;
import dao.hoadondao;

/**
 * Servlet implementation class htlichsumuahangservlet
 */
@WebServlet("/htlichsumuahangservlet")
public class htlichsumuahangservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public htlichsumuahangservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String tendn = session.getAttribute("dn").toString();
		DangNhapdao dn = new DangNhapdao();
		try {
			request.setAttribute("tenmua", tendn);
			int makh = dn.getMakh(tendn);
			
			hoadondao hd = new hoadondao();
			hd.getLichSuMuaHang(makh);
			
			ArrayList<lichsumuahangbean> listLS = hd.getLichSuMuaHang(makh);
			request.setAttribute("listlichsumua", listLS);
			
			RequestDispatcher rd = request.getRequestDispatcher("lichsumuahang.jsp");	
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
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
