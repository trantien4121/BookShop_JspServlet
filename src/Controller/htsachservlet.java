package Controller;

import java.io.IOException;
import java.net.Authenticator.RequestorType;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import bean.loaibean;
import bean.sachbean;
import bo.loaibo;
import bo.sachbo;

/**
 * Servlet implementation class htsach
 */
@WebServlet("/htsachservlet")
public class htsachservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public htsachservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Click để hiển thj sách theo danh mục tên loại sách. //Vì ở htsach.jsp có dsloai
		loaibo lbo=new loaibo();
		ArrayList<loaibean> dsloai=lbo.getLoai();
		request.setAttribute("dsloai", dsloai);


		//Tìm kiếm theo key
		request.setCharacterEncoding("utf-8");
  		response.setCharacterEncoding("utf-8");
  		

  		sachbo sbo = new sachbo();
  		
  		int sachBegin;
  		String tranght="";
  		ArrayList<sachbean> dssach;
  		
  		if( request.getParameter("ml")!=null || request.getParameter("txttk")!=null) {
  			tranght = "1";
  			dssach = sbo.getSach();
  		}
  		else if(request.getParameter("page")==null && request.getParameter("ml")==null) {
  			tranght = "1";
  			sachBegin =0;
  			dssach = sbo.getSach(sachBegin, 9);
  		}
  		else {
  			tranght = request.getParameter("page");
  	  		
  			sachBegin = Integer.parseInt(tranght);
  	  		dssach = sbo.getSach((sachBegin-1)*9, 9);
  		}
  		request.setAttribute("currentPage", tranght);
  		 //dssach = sbo.getSach(curPage, 9);
  		
  		request.setAttribute("TotalPage", 20);
  		
  		
  		//ArrayList<sachbean> dssach = sbo.getSach();
  			
  		String ml = request.getParameter("ml");
  		String key = request.getParameter("txttk");
  		if (ml != null) 
  			dssach = sbo.TimMa(ml);
  			
  		else  if (key != null)
  			dssach = sbo.Tim(key);
  		
  		request.setAttribute("dssach", dssach);
  		
  		
		RequestDispatcher rd = request.getRequestDispatcher("htsach2.jsp");	///de test //truoc la htsach.jsp
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
