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
                    <form action="updatecourse" method="post">
                        <label style="font-size: 35px;width: auto;padding: 10px 0px 10px 150px;">Cập nhật học sinh</label>
                        <div class="search1">
                            <label>ID:</label><input type="text" value="${requestScope.stu.ID}" name="id" readonly></br>
                            <label>Tên:</label><input type="text" value="${requestScope.stu.name}" name="name" required></br>
                            <label>Slot:</label><input type="text" value="${requestScope.stu.slot}" name="slot" required></br>
                            <label>Mức phí:</label><input type="text" value="${requestScope.stu.cost}" name="cost" required></br>
                            <label>Info:</label><input type="text" value="${requestScope.stu.info}" name="info"></br>
                            <label>Tình trạng:</label>
                            <select name="status">
                                <option <c:if test="${requestScope.stu.status eq 'Mở đơn'}">selected</c:if> value="Mở đơn">Mở đơn</option>
                                <option <c:if test="${requestScope.stu.status eq 'Đóng đơn'}">selected</c:if> value="Đóng đơn">Đóng đơn</option>
                                </select>
                                </br>
                                <div class="col"><button type="submit">Lưu</button></div>
                            </div>                      
                        </form>
                    </div>
                </section>            
            </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
