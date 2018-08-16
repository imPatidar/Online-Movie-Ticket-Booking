/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pankaj.servlet;

import com.pankaj.Bean.AdminBean;
import com.pankaj.sound.Model.AdminModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class LoginAction extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
           
    {
       RequestDispatcher rd=null;
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
                   
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginAction</title>");            
            out.println("</head>");
            out.println("<body>");
          
            int userid=Integer.parseInt(request.getParameter("userid"));
            String password=request.getParameter("password");
            String role=request.getParameter("role");
            int status=0;
            if(role.equals("admin"))
            {
            AdminBean ad=new AdminBean();
            ad.setUserid(userid);
            ad.setPassword(password);
            ad.setRole(role);
            
            
             status=new AdminModel().selectAdminData(ad);
            if(status==1)
            {
            rd=request.getRequestDispatcher("adminPage.jsp");
            rd.forward(request, response);
            }
            else
            {
            out.println("Sorry userid or password is incorrect");
            rd=request.getRequestDispatcher("Login.jsp");
            rd.include(request, response);
            }
            
            
            }
            else
            {
             AdminBean ad=new AdminBean();
            ad.setUserid(userid);
            ad.setPassword(password);
            ad.setRole(role);
           status =new AdminModel().selectPosData(ad);
            
            if(status==1)
            {
            rd=request.getRequestDispatcher("MovieSelection.jsp");
            rd.forward(request, response);
            }
            else
            {
            out.println("Sorry userid or password is incorrect");
            rd=request.getRequestDispatcher("Login.jsp");
            rd.include(request, response);
            }
            out.println(status);     
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
