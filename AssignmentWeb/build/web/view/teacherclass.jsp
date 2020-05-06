<%-- 
    Document   : teaching
    Created on : Jul 10, 2019, 8:04:12 AM
    Author     : DUONG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/main.css" type="text/css"/>
        <title>Teacher Page</title>
        <script>
            function edit(action,user){
                document.location.href = action + '?user=' + user;
            }
        </script>  
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <section id="teach">
                <div class="teach1">
                    <span>Danh sách học sinh</span>
                    <table>
                        <tr>
                            <td>Tên</td>
                            <td>Giới tính</td>               
                            <td>Ngày sinh</td>
                            <td>SĐT</td>
                            <td>Email</td>
                        </tr>
                        <c:forEach items="${requestScope.stu}" var="h">
                            <tr>
                                <td>${h.name}</td>
                                <td>${h.gender}</td>
                                <td>${h.dob}</td>
                                <td>${h.sdt}</td>
                                <td>${h.email}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </section>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
