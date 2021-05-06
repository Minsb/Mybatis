package com.kim12152143.UserController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kim12152143.dao.UserDao;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/findUser")
public class findController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    UserDao userDao ;
    public findController(){
        this.userDao = new UserDao();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 출력 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String category = request.getParameter("category");
		
		if(category.equals("findid"))
		{
			String email = request.getParameter("email");
			String result = userDao.findUserId(email);
			
			request.setAttribute("userid", result);
			RequestDispatcher view = request.getRequestDispatcher("find_res.jsp");
			view.forward(request, response);
		}
		else if(category.equals("findpw"))
		{
			String id = request.getParameter("id");
			String result = userDao.findUserPw(id);
			
			int question = Integer.parseInt(userDao.findUserQuest(id));
			String answer = userDao.findUserAnswer(id);
			
			request.setAttribute("result", result);
			request.setAttribute("question", question);
			request.setAttribute("answer", answer);
			RequestDispatcher view = request.getRequestDispatcher("find_res2.jsp");
			view.forward(request, response);
		}
		else {
			System.out.println("부적절한 입력");
			response.sendRedirect("login.jsp");	
		}	
	}
}



