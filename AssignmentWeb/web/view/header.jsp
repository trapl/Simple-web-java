<%-- 
    Document   : header
    Created on : Mar 22, 2020, 10:54:19 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="/WEB-INF/tlds/newtag_library" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <header>
        <nav>
            <a href="home" rel="home">
                    <img src="./img/logo_1.png"></a>
            <ul>   
                <div class="container">
                    <li><a href="/AssignmentWeb/home">TRANG CHỦ</a></li>
                    <li><a href="/AssignmentWeb/home#gallery">KHÓA HỌC</a></li>
                    <li><a href="#footer">LIÊN HỆ</a></li>
                    <c:if test="${sessionScope.user eq null}">
                    <li><a href="/AssignmentWeb/login">LOGIN</a></li>
                    </c:if>
                    <c:if test="${sessionScope.user ne null}">
                    <li><a href="/AssignmentWeb/featureadmin">${sessionScope.user.get(1).username}</a></li>
                    </c:if>
                </div>
            </ul>
        </nav>
    </header>
    </body>
</html>
