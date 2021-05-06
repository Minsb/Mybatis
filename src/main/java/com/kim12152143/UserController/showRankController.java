package com.kim12152143.UserController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kim12152143.dao.UserDao;
import com.kim12152143.model.User;
import com.kim12152143.model.Rank;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/showRank")
public class showRankController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    UserDao userDao ;
    public showRankController(){
        this.userDao = new UserDao();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 출력 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		List<Rank> result = userDao.showRank();
		
		request.setAttribute("list", result);
		
		RequestDispatcher view = request.getRequestDispatcher("showRank.jsp");
		view.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		doGet(request,response);
	}
}



