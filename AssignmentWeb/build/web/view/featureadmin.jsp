<%-- 
    Document   : featureadmin
    Created on : Jul 11, 2019, 8:55:36 AM
    Author     : DUONG
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/main.css" type="text/css"/>
        <title>Admin Feature</title>
        <script>
            function a(){
                 var  a = confirm("Bạn có chắc muốn đăng xuất");
                 if(a == true){
                     document.location.href = "logout";
                 }else{
                     document.location.href = "featureadmin";
                 }
            }
        </script>
        <c:if test="${sessionScope.Feature ne null}">
            <script>
                    alert("${sessionScope.Feature}");
            </script>
        </c:if>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <section id="feature">
                <div class="feature1">
                    <div class="col2f"><label>Xin chào ༼ つ ◕_◕ ༽つ ༼ つ ◕_◕ ༽つ</label></div>
                    <ul>
                        <div class="col1f">
                            <c:forEach items="${requestScope.feat}" var="h">
                                <li><a href="${h.url}">${h.feature}</a></li>
                            </c:forEach>
                                <li><a style="color: blue; cursor: pointer;" onclick="a()">Logout</a></li>
                        </div>
                    </ul>
                </div>
            </section>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
