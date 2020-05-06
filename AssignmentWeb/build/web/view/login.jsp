<%-- 
    Document   : admin
    Created on : Jul 6, 2019, 8:05:00 PM
    Author     : DUONG
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/main.css" type="text/css"/>
        <title>Login</title>
        <c:if test="${sessionScope.Login ne null}">
            <script>
                    alert("${sessionScope.Login}");
            </script>
        </c:if>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <section id="hi" class="text-center">
               
                <div class="title">
                    <h2>Login</h2>
                    <p class="css"></p>
                </div>
            </section>
            <section id="login" class="text-center">
                <div class="full">
                    <div class="full1">
                        <form action="login" method="post">
                            <label>Tên đăng nhập:</label></br><input type="text" name="id" autofocus required=""></br>
                            <label>Mật khẩu:</label></br><input type="password" name="password" required=""></br>
                    <button type="submit">Đăng nhập</button>
                    </form>
                    </div>
                </div>
            </section>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
        <c:if test="${requestScope.login eq 0}">    
            <script>
            alert("Sai tài khoản hoặc mật khẩu");
            </script>
        </c:if>