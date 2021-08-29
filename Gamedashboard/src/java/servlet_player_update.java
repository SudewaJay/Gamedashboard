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
public class servlet_player_update extends HttpServlet {

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
          String matchCountCurrent= request.getParameter("matchCountCurrent");
          String scoreCurrent= request.getParameter("scoreCurrent");
          String scoreNew= request.getParameter("scoreNew");
          String matchNew= request.getParameter("matchNew");
          String playerid= request.getParameter("playerid");
          String game= request.getParameter("game"); 
          String pageName= request.getParameter("gameName");
          String image= request.getParameter("image");
          
          int finalscore = Integer.parseInt(scoreCurrent) + Integer.parseInt(scoreNew);
          int finalmatch= Integer.parseInt(matchCountCurrent) + Integer.parseInt(matchNew);
          
            
           int update;
                   update = class_addGame.updatePlayer(playerid, finalmatch, finalscore);
                   if(update == 1){ 
                        out.println("<script type='text/javascript'>");
	                out.println("alert('Player Update');");
	                 out.println("location='giveRate.jsp?id="+game+"&name="+pageName+"&image="+image+"'");
		        out.println("</script>");
                       }
                       else{ 
                        out.println("<script type='text/javascript'>");
	                out.println("alert('Player Not Update');");
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
