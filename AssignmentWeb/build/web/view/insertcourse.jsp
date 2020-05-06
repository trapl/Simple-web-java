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
        <meta charset="utf-8">
        <link rel="stylesheet" href="./css/main.css" type="text/css"/>
        <title>Insert Course</title>
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
                    <form action="insertcourse" method="post">
                        <div class="search1">
                            <label>Thêm bản ghi theo:</label>
                            <select onchange="location = this.options[this.selectedIndex].value;">
                                <option <c:if test="${requestScope.Type eq 'Course'}">selected</c:if> value="/AssignmentWeb/insertstudent">Khóa học</option>
                                <option value="/AssignmentWeb/insertteacher" <c:if test="${requestScope.Type eq 'Teacher'}">selected</c:if>>Giáo viên</option>
                                </select></br>
                                <label>ID Course:</label><input value="${requestScope.ID}" type="text" name="id" readonly></br>
                            <label>Name:</label><input type="text" name="name" required ></br>
                            <label>Số buổi:</label><input type="text" name="slot" required></br>
                            <label>Mức phí:</label><input type="text" name="cost" required></br>
                            <label>Giới thiệu chung:</label><input type="text" name="info"></br>
                            <label>Người phụ trách:</label>
                            <select name="gv">
                                <c:forEach items="${requestScope.teacher}" var="h">
                                    <option value="${h.ID}">${h.name}</option>
                                </c:forEach>
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
