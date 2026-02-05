/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package emp;

import DB.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RAZI KHAN
 */
public class Attendance extends HttpServlet {

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
          HttpSession session=request.getSession();
          String user=session.getAttribute("user").toString();
          String atnd=request.getParameter("atnd");
          DBConnection db=new DBConnection();
          Calendar c=Calendar.getInstance();
          String time=c.get(Calendar.HOUR)+":"+c.get(Calendar.MINUTE)+":"+c.get(Calendar.SECOND);
          if(atnd.equals("1"))
          {
            db.pstmt=db.con.prepareStatement("insert into emp_attendance (ecode,atnd_date,time_in) values(?,curdate(),?)");
            db.pstmt.setString(1,user);
            db.pstmt.setString(2,time);
            int i=db.pstmt.executeUpdate();
            if(i>0)
            {
                response.sendRedirect("EmployeeHome.jsp?CheckIn");
            }
          }
          else
          {
              db.pstmt=db.con.prepareStatement("update emp_attendance set time_out=? where ecode=?");
              db.pstmt.setString(1,time);
              db.pstmt.setString(2,user);
              int i=db.pstmt.executeUpdate();
              if(i>0)
              {
                 response.sendRedirect("index.html?msg=CheckOut Successfully");
              }
          }
        }
        catch(Exception e)
        {
            e.printStackTrace();
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
