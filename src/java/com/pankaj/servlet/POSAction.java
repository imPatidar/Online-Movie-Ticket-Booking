/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pankaj.servlet;


import com.pankaj.Bean.POSBean;
import com.pankaj.sound.Model.AdminModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class POSAction extends HttpServlet
{

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException ,SQLException
    {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())
        {
       RequestDispatcher rd=null;
        response.setContentType("text/html;charset=UTF-8");
        
                 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>POS LoginAction</title>");            
            out.println("</head>");
            out.println("<body>");
          
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String prole=request.getParameter("role");
            String city=request.getParameter("city");
            
            POSBean ad1=new POSBean();
            ad1.setuName(username);
            ad1.setPassword(password);
            ad1.setProle(prole);
            ad1.setCity(city);
            int id=new AdminModel().addPOS(ad1);
            if(id>0)
            {
            out.println("<b>Your POS User ID IS"+" "+id+"</b>");
            rd=request.getRequestDispatcher("index.html");
            rd.include(request, response);
            
            }
            out.println("</body>");
            out.println("</html>");
        }
    }
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(POSAction.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(POSAction.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    public String getServletInfo() 
    {
        return "Short description";
    }// </editor-fold>
    }
   

    


