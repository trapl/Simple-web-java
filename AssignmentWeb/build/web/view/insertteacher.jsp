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
                    <form action="insertteacher" method="post">
                        <div class="search1">
                            <label>Thêm bản ghi theo:</label>
                            <select onchange="location = this.options[this.selectedIndex].value;">
                                <option <c:if test="${requestScope.Type eq 'Course'}">selected</c:if> value="/AssignmentWeb/insertcourse">Khóa học</option>
                                <option value="/AssignmentWeb/insertteacher" <c:if test="${requestScope.Type eq 'Teacher'}">selected</c:if>>Giáo viên</option>
                                </select></br>
                                <label>ID:</label><input type="text" value="${requestScope.id}" name="id" readonly></br>
                            <label>Tên:</label><input type="text" name="name" required></br>
                            <label>Giới tính</label><input type="radio" style="width:80px;"name="gender" value="Nam">Nam<input type="radio" style="width:80px;" name="gender" value="Nữ">Nữ</br>
                            <label>Ngày sinh:</label><input type="date" name="dob"></br>
                            <label>SĐT:</label><input type="text" name="sdt" required></br>
                            <label>Email:</label><input type="email" name="email" required></br>
                            <div class="col"><button type="submit">Lưu</button></div>
                        </div>                      
                    </form>
                </div>
            </section>            
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
