package Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giohangbean;
import bo.giohangbo;
import bo.hoadonbo;
import dao.DangNhapdao;
import dao.chitiethoadondao;
import dao.hoadondao;

/**
 * Servlet implementation class hoadonservlet
 */
@WebServlet("/hoadonservlet")
public class hoadonservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hoadonservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//Insert giohang vào csdl hóa đơn và chi tiết hóa đơn với tình trạng là chưa mua(damua=0)
		HttpSession session = request.getSession(); 
		giohangbo gh =(giohangbo)session.getAttribute("gio");
		DangNhapdao Dn = new DangNhapdao();
		String tendn = session.getAttribute("dn").toString();
		request.setAttribute("tendn", tendn);
		hoadondao hd = new hoadondao();
		Random r = new Random();
		Date n = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
		
		if(request.getParameter("butmuahang")!=null) {
			
			try {
				int makh = Dn.getMakh(tendn);
				//int mahd = r.nextInt(10000);
				
				int mahdmax = hd.getMaxOfMaHoaDon();
				
				if(hd.themHoaDon(mahdmax + 1, makh , dd.format(n), 0)==true) {
					
					chitiethoadondao cthd = new chitiethoadondao();
					for (giohangbean s: gh.ds) {
						cthd.themChiTietHoaDon(s.getMasach(), (int)s.getSoluong(), mahdmax +1);
					}
					// Lưu hóa đơn vào session và hiển thị ra chứ chưa dùng sql để hiển thị hóa đơn
					
//					hoadonbo hoadon =null;
//					if(session.getAttribute("hoadon")==null){
//						hoadon = new hoadonbo();	//Cap vung nho		
//						session.setAttribute("hoadon", hoadon);	//Tao session
//					}
//
//					hoadon = (hoadonbo)session.getAttribute("hoadon");
//					
//					hoadon.themHoaDon(mahd, makh, "2022-11-07", 0);
//					session.setAttribute("hoadon", hoadon);
					
					// Kết thúc việc đưa hóa đơn vào session
					
					gh.xoaTatCa();
					
					response.sendRedirect("htthanhtoanservlet");
				}
			} catch (Exception e) {
				e.printStackTrace();
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
