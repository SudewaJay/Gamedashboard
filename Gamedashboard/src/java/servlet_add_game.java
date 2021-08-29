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
public class servlet_add_game extends HttpServlet {

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
            String price= request.getParameter("price");
            String platform= request.getParameter("platform");
            String realeseDate= request.getParameter("realeseDate");
            String Tags1= request.getParameter("Tags1");
            String Tags2= request.getParameter("Tags2");
            String Tags3= request.getParameter("Tags3");
            String image= request.getParameter("image");
            String story= request.getParameter("story");
            String requiments= request.getParameter("requiments");
            String tag = Tags1+" ,"+Tags2+" , "+Tags3;
            
            boolean insertSucsses = class_addGame.addGame( name, price, tag, platform, realeseDate, story, requiments, image);
             if(insertSucsses == true){ 
                              out.println("<script type='text/javascript'>");
	                      out.println("alert('Game Added');");
	                      out.println("location='index.jsp'");
		              out.println("</script>");
                             
                       }
                       else{ 
                       
                        out.println("<script type='text/javascript'>");
	                out.println("alert('Game Not Add');");
	                out.println("location='index.jsp'");
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
