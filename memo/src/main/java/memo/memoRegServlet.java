package memo;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/memoReg")
public class memoRegServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		textFile file = new textFile();
		boolean b;
		
		file.setTitle(req.getParameter("title"));
		file.setMemo(req.getParameter("memo"));
		b = file.saveFile();
		
		if(b==true) {
			out.println("<h3>저장 완료!");
		} else if(b==false) {
			out.println("<h3>저장 실패!");
		}
		
		out.close();
	}
	
}
