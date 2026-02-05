
package Admin;
import DB.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class login1 extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())
        {
           String utype=request.getParameter("t1");
           String user=request.getParameter("t2");
           String pswd=request.getParameter("t3");
           HttpSession session=request.getSession();
           session.setAttribute("user",user);
           session.setAttribute("user_type",utype);
           DBConnection db=new DBConnection();
           db.pstmt=db.con.prepareStatement("select ac_status from login where user=? and pswd=? and utype=?");
           db.pstmt.setString(1,user);
           db.pstmt.setString(2, pswd);
           db.pstmt.setString(3, utype);
           
           db.rst=db.pstmt.executeQuery();
           
           if(db.rst.next())
           {
               if(utype.equalsIgnoreCase("admin"))
               {
                   response.sendRedirect("AdminHome.jsp");
               }
               else if(utype.equalsIgnoreCase("employee"))
               {
                   response.sendRedirect("EmployeeHome.jsp");
               }
               else
               {
                   out.println("<html><body bgcolor=red><script>alert('This Account has been Blocked')</script></body></html>");
                   response.sendRedirect("index.html");
                   
               }
               
           }
           else
           {
               out.println("<html><body bgcolor=red><script>alert('Incorrect User Name or Password')</script></body></html>");
               
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
