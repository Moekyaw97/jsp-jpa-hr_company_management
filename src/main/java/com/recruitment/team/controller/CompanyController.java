package com.recruitment.team.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.recruitment.model.entity.Company;
import com.recruitment.model.entity.Recruiter;
import com.recruitment.model.entity.Township;
import com.recruitment.team.model.service.CompanyService;
import com.recruitment.team.model.service.RecruiterService;
import com.recruitment.team.model.service.TownshipService;

@WebServlet(urlPatterns = {"/companies","/company-add","/company-edit","/company-delete","/company-detail"},loadOnStartup=1)
public class CompanyController extends HttpServlet{
	
	private CompanyService comService;
	private TownshipService townService;
	private RecruiterService recruService;


	private static final long serialVersionUID = 1L;
	
	@Override
	public void init(ServletConfig config) throws ServletException {

		super.init(config);
		EntityManagerFactory EMF = null;

		Object obj = getServletContext().getAttribute("emf");
		if (obj == null) {
			EMF = Persistence.createEntityManagerFactory("jsp-jpa-recruiter");
			getServletContext().setAttribute("emf", EMF);
		} else {
			EMF = (EntityManagerFactory) obj;
		}
		comService = new CompanyService(EMF.createEntityManager());
		townService = new TownshipService(EMF.createEntityManager());
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
	String action=req.getServletPath();
	if("/company-add".equals(action)) {
		String comid=req.getParameter("comid");
		String name=req.getParameter("company_name");
		String email=req.getParameter("company_email");
		String address=req.getParameter("company_address");
		String website=req.getParameter("website");
		String ishot=req.getParameter("ishot");
		String phone1=req.getParameter("phone_1");
		String phone2=req.getParameter("phone_2");
		String owner=req.getParameter("owner_name");
		String township=req.getParameter("townid");
		String remark=req.getParameter("remark");
		
		System.out.println(name);
		System.out.println(phone1);
		System.out.println(phone2);
		
		//Company company = (comid == null || comid.equals("") ? new Company() : comService.findById(Integer.parseInt(comid)));
		Company company=null;
		
		HttpSession session=req.getSession(true);
		Recruiter recruiter=(Recruiter) session.getAttribute("loginuser");
		
		if(comid!=null && !comid.isEmpty()) {
			company=comService.findById(Integer.parseInt(comid));
			company.setModifyBy(recruService.findById(recruiter.getId()));
			company.setModifyDate(LocalDate.now());
		}
		else {
			company=new Company();
			company.setEntryBy(recruService.findById(recruiter.getId()));
			company.setEntry_date(LocalDate.now());
		}
		
		company.setName(name);
		company.setEmail(email);
		company.setAddress(address);
		company.setWebsite(website);
		company.setIshot(ishot !=null ? "yes" : "no");
			
		
		
		company.setPhone1(phone1);
		company.setPhone2(phone2);
		company.setOwnerName(owner);
		company.setTownship(townService.findById(Integer.parseInt(township)));
		company.setRemak(remark);
		
		
		comService.save(company);
		
		resp.sendRedirect(req.getContextPath().concat("/companies"));
		
	}
	
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		if ("/company-add".equals(path) || "/company-edit".equals(path)) {

			List<Township> townList = townService.findAll();
			req.setAttribute("townships", townList);

			if ("/company-edit".equals(path)) {
				String id = req.getParameter("comid");
				Company comobj = comService.findById(Integer.parseInt(id));
				req.setAttribute("company", comobj);
				
			}
			getServletContext().getRequestDispatcher("/company-add.jsp").forward(req, resp);
		} else if ("/companies".equals(path)) {
			List<Company> list = comService.findAll();
			req.setAttribute("companies", list);
			getServletContext().getRequestDispatcher("/company.jsp").forward(req, resp);
		}
		else if("/company-delete".equals(path)){
			String comid=req.getParameter("comid");
			comService.delete(Integer.parseInt(comid));
			resp.sendRedirect(req.getContextPath().concat("/companies"));
		}
		else if("/company-detail".equals(path)){
			
			String id = req.getParameter("comid");
			Company comobj = comService.findById(Integer.parseInt(id));
			req.setAttribute("company", comobj);
		
			getServletContext().getRequestDispatcher("/company-detail.jsp").forward(req, resp);
		}
	}

}
