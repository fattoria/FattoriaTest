package com.douglasferreira.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.douglasferreira.infra.*;
import com.douglasferreira.domain.*;

@WebServlet("/crud")
public class CrudServlet extends HttpServlet{
	
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("cadastro.jsp").forward(request, response);
    }
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		Map<String, String> messages = new HashMap<String, String>();
		request.setAttribute("messages", messages);
		
		String pName = request.getParameter("pName");
		if(pName == null || pName.trim().isEmpty()) {
			messages.put("pName", "Insira o nome do produto");
		}
		
		try {
		DbConnection connection = DbConnection.getInstance();
		Product p = new Product(request.getParameter("pName"), Integer.parseInt(request.getParameter("pPrice")), Integer.parseInt(request.getParameter("pAmount")));
		connection.createObject(p);
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		
		request.getRequestDispatcher("cadastro.jsp").forward(request, response);
		
	}
	
}