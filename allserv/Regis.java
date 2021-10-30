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
 * Servlet implementation class Regis
 */
@WebServlet("/Regis")
public class Regis extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out=response.getWriter();
			int cid=(int)(Math.random()*10000);
			String cpass=request.getParameter("cpass");
			String cname=request.getParameter("cname");
			String cmail=request.getParameter("cmail");
			String cphn=request.getParameter("cphn");
			
			Connection cn=GetData.getCn();
			PreparedStatement ps=cn.prepareStatement("insert into customer values(?,?,?,?,?)");
			ps.setInt(1, cid);
			ps.setString(2, cname);
			ps.setString(3, cphn);
			ps.setString(4, cmail);
			ps.setString(5, cpass);
			ps.execute();
			out.print("Registration success for ID :"+cid);
			RequestDispatcher rd=request.getRequestDispatcher("register.html");
			rd.include(request, response);
			
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
