<%-- 
    Document   : EditProfile
    Created on : 5 Mar, 2024, 2:20:27 PM
    Author     : RAZI KHAN
--%>
<%@page import="DB.DBConnection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="AdminHeader.jsp"%>
<div>
    <center>
        <br>
        <span style="font-size: 30px;color: brown;font-style: normal;">Edit Profile</span>
        <br><br>
        <%
            String user=session.getAttribute("user").toString();
            DBConnection db=new DBConnection();
            if(request.getParameter("code")==null)
            {
            db.pstmt=db.con.prepareStatement("select * from emp_mstr where ecode=?");
            db.pstmt.setString(1,user);
            db.rst=db.pstmt.executeQuery();
            if(db.rst.next())
            {
                out.println("<form action=#>");
                out.println("<table width='600 border='1' cellpadding='10'>");
                out.println("<tr><td width='300'>Employee Code (user)</td><td><input type='number'name='code'value="+db.rst.getString(1)+"></td></tr>");
                out.println("<tr><td width='300'>Employee Name</td><td><input type='text'name='name'value="+db.rst.getString(2)+"></td></tr>");
                out.println("<tr><td width='300'>Date of Birth</td><td><input type='date'name='dob'value="+db.rst.getString(3)+"></td></tr>");
                out.println("<tr><td width='300'>Gender</td><td><input type='text'name='gen'value="+db.rst.getString(4)+"></td></tr>");
                out.println("<tr><td width='300'>Post</td><td><input type='text'name='post'value="+db.rst.getString(5)+"></td></tr>");
                out.println("<tr><td width='300'>Adderess</td><td><input type='text'name='addr'value="+db.rst.getString(6)+"></td></tr>");
                out.println("<tr><td width='300'>City</td><td><input type='text'name='city'value="+db.rst.getString(7)+"></td></tr>");
                out.println("<tr><td width='300'>Contect</td><td><input type='number'name='cont'value="+db.rst.getString(8)+"></td></tr>");
                out.println("<tr><td width='300'>Email</td><td><input type='email'name='mail'value="+db.rst.getString(9)+"></td></tr>");
                out.println("<tr><td width='300'>Id Name</td><td><input type='text'name='idname'value="+db.rst.getString(10)+"></td></tr>");
                out.println("<tr><td width='300'>Id Number</td><td><input type='number'name='idno'value="+db.rst.getString(11)+"></td></tr>");
                out.println("<tr><td width='300'><input type='submit'value='Update'></td></tr>");
                out.println("</table></form>");
            }
            else
            {
                response.sendRedirect("Employee.jsp?msg=Date Not Found");
            }
            }
            else
            {
                String code=request.getParameter("code");
                String name=request.getParameter("name");
                String dob=request.getParameter("dob");
                String gen=request.getParameter("gen");
                String post=request.getParameter("post");
                String addr=request.getParameter("addr");
                String city=request.getParameter("city");
                String cont=request.getParameter("cont");
                String mail=request.getParameter("mail");
                String idname=request.getParameter("idname");
                String idno=request.getParameter("idno");
                db.pstmt=db.con.prepareStatement("Update emp_mstr set ename=?,edob=?,egender=?,epost=?,eaddr=?,ecity=?,econt=?,email=?,idname=?,idno=?where ecode=?");
                db.pstmt.setString(1,name);
                db.pstmt.setString(2,dob);
                db.pstmt.setString(3,gen);
                db.pstmt.setString(4,post);
                db.pstmt.setString(5,addr);
                db.pstmt.setString(6,city);
                db.pstmt.setString(7,cont);
                db.pstmt.setString(8,mail);
                db.pstmt.setString(9,idname);
                db.pstmt.setString(10,idno);
                db.pstmt.setString(11,code);
                int i=db.pstmt.executeUpdate();
                if(i>0)
                {
                    response.sendRedirect("EmployeeHome.jsp?msg=Profile Update Successfully");
                }
            }
            
        %>

