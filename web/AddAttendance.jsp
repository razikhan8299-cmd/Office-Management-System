<%-- 
    Document   : AddAttendance
    Created on : 5 Mar, 2024, 5:54:06 PM
    Author     : RAZI KHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="EmployeeHeader.jsp"%>
<center>
    <h2>Add Attendance</h2>
    <br><br><br>
    <table width="500">
        <tr><td width="250"><a href="Attendance?atnd=1"><input type="button"name="btn" value="Check In" style="width:100px;height:40px;background-color:brown;color: white; font-size: 20px"></a></td>
        <td width="250"><a href="Attendance?atnd=0"><input type="button"name="btn" value="Check Out" style="width:120px;height:40px;background-color:brown;color: white; font-size: 20px"></a></td></tr>   
    </table>
</center>