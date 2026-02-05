<%-- 
    Document   : SearchEmployee
    Created on : 29 Feb, 2024, 5:43:58 PM
    Author     : Sujeet's PC
--%>
<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="AdminHeader.jsp" %>
    <div>
        <center>
            <br>
        <span style="font-size: 30px; color: blueviolet; font-style: normal">Search Employee</span>
        <br><br>
        <%
            if(request.getParameter("code")==null)
            {%>
            <form action="#">
                <table widtth="600" border="1" cellpadding="20">
                    <tr><td>Enter Employee Code</td><td><input type="number" name="code"></td></tr>
                    <tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
                </table>
            </form>
        <%
            }
            else{
        String code=request.getParameter("code");
         DB.DBConnection db=new DB.DBConnection();
        db.pstmt=db.con.prepareStatement("select * from emp_mstr where ecode=?");
        db.pstmt.setString(1, code);
        
        db.rst=db.pstmt.executeQuery();
        
        if(db.rst.next())
        {
            String v1=db.rst.getString(1);
            out.println("<form action=UpdateEmployee>");
                out.println("<table width='800' border='1' cellpadding='10'>");
                out.println("<tr><td width='400'>Employee Code (user)</td><td><input type='number'name='code'value="+db.rst.getString(1)+"></td></tr>");
                out.println("<tr><td width='400'>Employee Name</td><td><input type='text'name='name'value="+db.rst.getString(2)+"></td></tr>");
                out.println("<tr><td width='400'>Date of Birth</td><td><input type='date'name='dob'value="+db.rst.getString(3)+"></td></tr>");
                out.println("<tr><td width='400'>Gender</td><td><input type='text'name='gen'value="+db.rst.getString(4)+"></td></tr>");
                out.println("<tr><td width='400'>Post</td><td><input type='text'name='post'value="+db.rst.getString(5)+"></td></tr>");
                out.println("<tr><td width='400'>Adderess</td><td><input type='text'name='addr'value="+db.rst.getString(6)+"></td></tr>");
                out.println("<tr><td width='400'>City</td><td><input type='text'name='city'value="+db.rst.getString(7)+"></td></tr>");
                out.println("<tr><td width='400'>Contect</td><td><input type='number'name='cont'value="+db.rst.getString(8)+"></td></tr>");
                out.println("<tr><td width='400'>Email</td><td><input type='email'name='mail'value="+db.rst.getString(9)+"></td></tr>");
                out.println("<tr><td width='400'>Id Name</td><td><input type='text'name='idname'value="+db.rst.getString(10)+"></td></tr>");
                out.println("<tr><td width='400'>Id Number</td><td><input type='number'name='idno'value="+db.rst.getString(11)+"></td></tr>");
                out.println("<tr><td width='400'><input type='submit'value='Update'></td><td><a href=BlockAccount?user="+code+"><input type='button' value=BlockAccount></td></tr>");
                out.println("</table></form>");
        }
        else{
            out.println("<h1>Record dose not match</h1>");
        }
            }
            
        %>
     </center>
    </div>
