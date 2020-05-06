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
                    <form action="updateteacher" method="post">
                        <label style="font-size: 35px;width: auto;padding: 10px 0px 10px 150px;">Cập nhật giáo viên</label>
                        <div class="search1">
                            <label>ID:</label><input type="text" value="${requestScope.tea.ID}" name="id" readonly></br>
                            <label>Tên:</label><input type="text" value="${requestScope.tea.name}" name="name" required></br>
                            <label>Giới tính</label><input type="radio" style="width:80px;" <c:if test="${requestScope.tea.gender eq 'Nam'}">checked</c:if>  name="gender" value="Nam">Nam<input type="radio" style="width:80px;" name="gender" <c:if test="${requestScope.tea.gender eq 'Nữ'}">checked</c:if> value="Nữ">Nữ</br>
                            <label>Ngày sinh:</label><input type="date" value="${requestScope.tea.dob}" name="dob"></br>
                            <label>SĐT:</label><input type="text" value="${requestScope.tea.sdt}" name="sdt" required></br>
                            <label>Email:</label><input type="email" value="${requestScope.tea.email}" name="email" required></br>
                            <div class="col"><button type="submit">Lưu</button></div>
                        </div>                      
                    </form>
                </div>
            </section>            
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
