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
        <title>Insert Teacher</title>
        <script>
            $('select.menu').change(function (e) {
                window.location.href = $("select.menu option:selected").attr('value');
            });
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <section id="allsearch">
                <div>
                    <form action="updatestudent" method="post">
                        <label style="font-size: 35px;width: auto;padding: 10px 0px 10px 150px;">Cập nhật học sinh</label>
                        <div class="search1">
                            <label>ID:</label><input type="text" value="${requestScope.stu.ID}" name="id" readonly></br>
                            <label>Tên:</label><input type="text" value="${requestScope.stu.name}" name="name" required></br>
                            <label>Giới tính</label><input type="radio" style="width:80px;" <c:if test="${requestScope.stu.gender eq 'Nam'}">checked</c:if>  name="gender" value="Nam">Nam<input type="radio" style="width:80px;" name="gender" <c:if test="${requestScope.stu.gender eq 'Nữ'}">checked</c:if> value="Nữ">Nữ</br>
                            <label>Ngày sinh:</label><input type="date" value="${requestScope.stu.dob}" name="dob"></br>
                            <label>SĐT:</label><input type="text" value="${requestScope.stu.sdt}" name="sdt" required></br>
                            <label>Email:</label><input type="email" value="${requestScope.stu.email}" name="email" required></br>
                            <label>Chuyển môn học </label>
                            <select name="coursef">
                                <c:forEach items="${requestScope.co}" var="h">
                                    <option value="${h.id}">${h.name}</option>
                                </c:forEach>
                                <option value="">Đăng kí</option>
                            </select></br>
                            <label>sang</label>
                            <select name="courset">
                                <c:forEach items="${requestScope.course}" var="h">
                                    <option <c:if test="${h.status eq 'Đóng đơn'}">disabled</c:if> value="${h.ID}">${h.name}</option>
                                </c:forEach>
                            </select></br>
                            <div class="col"><button type="submit">Lưu</button></div>
                        </div>                      
                    </form>
                </div>
            </section>            
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
