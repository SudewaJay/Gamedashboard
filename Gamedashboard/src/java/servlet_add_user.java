/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class servlet_add_user extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name= request.getParameter("name");
            String Address= request.getParameter("Address");
            String tel= request.getParameter("tel");
            String age= request.getParameter("age");
            String email= request.getParameter("email");
            String game= request.getParameter("game");     
            String gamil= request.getParameter("email");
            String pageName= request.getParameter("pageName");
            String image= request.getParameter("image");
            
            boolean insertSucsses = class_add_NewPlayer.addNewPlayer(name, Address, tel, age, email, game);
            if(insertSucsses == true){ 
                              out.println("<script type='text/javascript'>");
	                      out.println("alert('Added A New User');");
	                      out.println("location='giveRate.jsp?id="+game+"&name="+pageName+"&image="+image+"'");
		              out.println("</script>");
                             
                       }
                       else{ 
                       
                        out.println("<script type='text/javascript'>");
	                out.println("alert('User Not Add');");
	                 out.println("location='giveRate.jsp?id="+game+"&name="+pageName+"&image="+image+"'");
		        out.println("</script>");
                        } 
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
