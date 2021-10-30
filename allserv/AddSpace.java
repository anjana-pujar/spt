package allserv;
import java.sql.*;
import calldatabase.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddSpace
 */
@WebServlet("/AddSpace")
public class AddSpace extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out=response.getWriter();
			int id=(int)(Math.random()*1000);
			String size=request.getParameter("size");
			int cost=Integer.parseInt(request.getParameter("cost"));
			String facility=request.getParameter("facility");
			String status="free";
			
			Connection cn=GetData.getCn();
			PreparedStatement ps=cn.prepareStatement("insert into space values(?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, size);
			ps.setInt(3, cost);
			ps.setString(4, facility);
			ps.setString(5, status);
			ps.execute();
			out.print("record saved...");
			RequestDispatcher rd=request.getRequestDispatcher("create.html");
			rd.include(request, response);
			
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
