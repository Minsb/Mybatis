package com.kim12152143.UserController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kim12152143.dao.UserDao;
import com.kim12152143.model.User;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/userUpdate")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    UserDao userDao ;
    public UpdateController(){
        this.userDao = new UserDao();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 출력 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String category = request.getParameter("category");
		String newvalue = request.getParameter("newvalue");
		String uid = request.getParameter("userid");
		
		int result = userDao.updateUser(category, newvalue, uid);
		
		int check = Integer.parseInt(category);
		
		request.setAttribute("category", check);
		request.setAttribute("newvalue", newvalue);
		
		RequestDispatcher view = request.getRequestDispatcher("update_res.jsp");
		view.forward(request, response);
	}
}



