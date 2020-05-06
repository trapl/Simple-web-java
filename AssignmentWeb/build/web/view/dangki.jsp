<%-- 
    Document   : insertcourse
    Created on : Jul 10, 2019, 3:45:07 PM
    Author     : DUONG
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/main.css" type="text/css"/>
        <title>Đăng kí khóa học</title>
        <script>
            function a(){
                alert("Đăng kí thành công");
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <section id="allsearch">
                <div>
                    <form action="dangki" method="post">
                    <div class="search1">
                        <label>Chọn môn học:</label>
                        <select name="type">
                            <c:forEach items="${requestScope.course}" var="h">
                                <option <c:if test="${h.status eq 'Đóng đơn'}">disabled="true"</c:if> <c:if test="${h.ID eq requestScope.id}">selected</c:if> value="${h.ID}">${h.name}</option>
                            </c:forEach>
                        </select></br>
                        <label>Tên:</label><input type="text" name="name" required></br>
                        <label>Giới tính</label><input type="radio" style="width:80px;" name="gender" value="Nam">Nam<input type="radio" style="width:80px;" name="gender" value="Nữ">Nữ</br>
                        <label>Ngày sinh:</label><input type="date" name="dob"></br>
                        <label>SĐT:</label><input type="text" name="sdt" required ></br> 
                        <label>Email:</label><input type="email" name="email" required ></br>
                        <div class="col"><button type="submit" onclick="a()">Đăng kí</button></div>
                    </div>                      
                    </form>
                </div>
            </section>            
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
