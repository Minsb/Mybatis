package com.kim12152143.UserController;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
@WebServlet("/insertUser")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    UserDao userDao ;
    public RegisterController(){
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
		
		User user = new User();
		user.setId(request.getParameter("id"));
		user.setPassword(request.getParameter("password"));
		user.setName(request.getParameter("name"));
		user.setNickname(request.getParameter("nickname"));
		
		try {
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
			Date to = fm.parse(request.getParameter("dob"));
			user.setDob(to); 

        } catch (Exception e) {
        	return;
        }
		user.setQuestionidx(Integer.parseInt(request.getParameter("questionidx")));
		user.setAnswer(request.getParameter("answer"));
		
		Date now = new Date();
		user.setDor(now);
		
		user.setEmail(request.getParameter("email"));
		
		int result = userDao.insertUser(user);
		
		request.setAttribute("user", user);
		request.setAttribute("result", result);

		RequestDispatcher view = request.getRequestDispatcher("register_res.jsp");
		view.forward(request, response);
	}
}



