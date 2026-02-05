/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Admin;

import DB.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RAZI KHAN
 */
public class ChangePassword extends HttpServlet {

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
           String opswd=request.getParameter("opswd");
           String npswd=request.getParameter("npswd");
           String cpswd=request.getParameter("cpswd");
           HttpSession session=request.getSession();
           String user=session.getAttribute("user").toString();
           String utype=session.getAttribute("user_type").toString();
           
           if(utype.equalsIgnoreCase("admin"))
           {
           DBConnection db=new DBConnection();
           db.pstmt=db.con.prepareStatement("select * from login where user=? and pswd=?");
           db.pstmt.setString(1,user);
           db.pstmt.setString(2,opswd);
           db.rst=db.pstmt.executeQuery();
                   if(db.rst.next())
                   {
                       if(npswd.equals(cpswd))
                       {
                           db.pstmt=db.con.prepareStatement("update login set pswd=? where user=?");
                           db.pstmt.setString(1,npswd);
                           db.pstmt.setString(2,user);
                           int i=db.pstmt.executeUpdate();
                           if(i>0)
                           {
                           response.sendRedirect("AdminHome.jsp?msg=Password Update Succssefully");
                           }
                       }
                       else{
                           out.println("<h1>New and Conferm Password does not match</h1");
                       }
                   }
                   else
                   {
                       out.println("<h1>Old Password does not Match</h1>");
                   }
           }
           else if(utype.equalsIgnoreCase("employee"))
           {
               DBConnection db=new DBConnection();
           db.pstmt=db.con.prepareStatement("select * from login where user=? and pswd=?");
           db.pstmt.setString(1,user);
           db.pstmt.setString(2,opswd);
           db.rst=db.pstmt.executeQuery();
                   if(db.rst.next())
                   {
                       if(npswd.equals(cpswd))
                       {
                           db.pstmt=db.con.prepareStatement("update login set pswd=? where user=?");
                           db.pstmt.setString(1,npswd);
                           db.pstmt.setString(2,user);
                           int i=db.pstmt.executeUpdate();
                           if(i>0)
                           {
                           response.sendRedirect("EmployeeHome.jsp?msg=Password Update Succssefully");
                           }
                       }
                       else{
                           out.println("<h1>New and Conferm Password does not match</h1");
                       }
                   }
                   else
                   {
                       out.println("<h1>Old Password does not Match</h1>");
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
