<%--
    Document   : AttendenceAReport
    Created on : 8 Mar, 2024, 5:48:44 PM
    Author     : RAZI KHAN
--%>
<%@page import="DB.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="AdminHeader.jsp"%>
<center><h2>Attendance Report</h2>
    <form action="#">
        <br><br>Search Employee Attendance:
        <input type="search" name="code" placeholder="Enter Employee code"></br>
        <br><br>
    <table width="1000" cellpadding="5"border="1"bgcolor="lightpink"cellspacing="0">
        <tr bgcolor="lightblue"><td>S.No</td>
            <td>Employee code</td>
            <td>Employee Name</td>
            <td>Employee Gender</td>
            <td>E mail Address</td>
            <td>Attendance Report</td>
            <td>Time In</td>
            <td>Time Out</td>
                </tr>
                <%
                    try
                    {
                        
                    if(request.getParameter("code")!=null)
                    {
                    String user=request.getParameter("code");
                    DBConnection db=new DBConnection();
                    db.pstmt=db.con.prepareStatement("Select emp_mstr.ecode,emp_mstr.ename,emp_mstr.egender,emp_mstr.email,emp_attendance.atnd_date,emp_attendance.time_in,emp_attendance.time_out FROM emp_mstr,emp_attendance WHERE emp_mstr.ecode=emp_attendance.ecode and emp_attendance.ecode=?");
                    db.pstmt.setString(1,user);
                    db.rst=db.pstmt.executeQuery();
                    int count=1;
                    while(db.rst.next())
                    {
                        out.println("<tr ><td bgcolor=dodgerblue style='color:white;'>"+count+"</td><td>"+db.rst.getString(1)+"</td>"
                                + "<td>"+db.rst.getString(2)+"</td>"
                                + "<td>"+db.rst.getString(3)+"</td>"
                                + "<td>"+db.rst.getString(4)+"</td>"
                                + "<td>"+db.rst.getString(5)+"</td>"
                                + "<td>"+db.rst.getString(6)+"</td>"
                                + "<td>"+db.rst.getString(7)+"</td>"
                                + "</tr>");
                        count++;
                    }
                    }
                    else
                    {
                    DBConnection db=new DBConnection();
                    db.pstmt=db.con.prepareStatement("Select emp_mstr.ecode,emp_mstr.ename,emp_mstr.egender,emp_mstr.email,emp_attendance.atnd_date,emp_attendance.time_in,emp_attendance.time_out FROM emp_mstr,emp_attendance WHERE emp_mstr.ecode=emp_attendance.ecode");
                    db.rst=db.pstmt.executeQuery();
                    int count=1;
                    while(db.rst.next())
                    {
                        out.println("<tr ><td bgcolor=dodgerblue style='color:white;'>"+count+"</td><td>"+db.rst.getString(1)+"</td>"
                                + "<td>"+db.rst.getString(2)+"</td>"
                                + "<td>"+db.rst.getString(3)+"</td>"
                                + "<td>"+db.rst.getString(4)+"</td>"
                                + "<td>"+db.rst.getString(5)+"</td>"
                                + "<td>"+db.rst.getString(6)+"</td>"
                                + "<td>"+db.rst.getString(7)+"</td>"
                                + "</tr>");
                        count++;  
                    }
                    }
                    }
                    catch(Exception e)
                            {
                           e.printStackTrace();
                            }
                %>
    </table>
    </form>
</center>

