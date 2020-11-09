package com.recruitment.team.controller;

import java.io.IOException;

import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.recruitment.model.entity.Recruiter;
import com.recruitment.team.model.service.RecruiterService;


@WebServlet(urlPatterns = {"/login","/logout"},loadOnStartup=1)
public class RecruiterController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private RecruiterService recruService;
	
	@Override
	public void init(ServletConfig config) throws ServletException {

		super.init(config);
		EntityManagerFactory EMF = null;

		Object obj = getServletContext().getAttribute("emf");// application scope
		if (obj == null) {
			EMF = Persistence.createEntityManagerFactory("jsp-jpa-recruiter");
			getServletContext().setAttribute("emf", EMF);
		} else {
			EMF = (EntityManagerFactory) obj;
		}
		recruService = new RecruiterService(EMF.createEntityManager());
	}

	@Override
	public void destroy() {
		EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
		if (emf != null && emf.isOpen())
			emf.close();

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String email=req.getParameter("user_email");
	String pass=req.getParameter("user_password");
	System.out.println(email);
	System.out.println(pass);
	try {
		Recruiter recruiter=recruService.login(email,pass);
		HttpSession session=req.getSession(true);
		session.setAttribute("loginuser", recruiter);
		
		resp.sendRedirect(req.getContextPath().concat("/companies"));
	}
	catch (NoResultException e) {
		req.setAttribute("message", "Invalid Login User");
		getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		if ("/logout".equals(path)) {
			resp.sendRedirect(req.getContextPath().concat("/index.jsp"));
		}
		
		
	     }  	}



