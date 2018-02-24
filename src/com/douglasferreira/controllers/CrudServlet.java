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

@WebServlet("/cadastro")
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
		} else {
		
			try {
				DbConnection connection = DbConnection.getInstance();
				Product p = new Product(request.getParameter("pName"), Float.parseFloat(request.getParameter("pPrice")), Integer.parseInt(request.getParameter("pAmount")));
				connection.createObject(p);
				messages.put("success", "Produto gravado com sucesso!");
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
		
		}
				
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}
	
}
