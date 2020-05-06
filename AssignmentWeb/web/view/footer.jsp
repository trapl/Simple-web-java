<%-- 
    Document   : footer
    Created on : Mar 22, 2020, 11:08:56 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="/WEB-INF/tlds/newtag_library" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/main.css" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="footer">
        <div class="container">
            <div class="contact">
                <div class="card">
                    <h6>LIÊN HỆ</h6>
                    <p>Mọi thắc mắc - góp ý vui lòng liên hệ</p>
                    <ul>
                      <li>Email: traplhe130637@fpt.edu.vn</li>
                      <li>Phone: (+84) 096 906 0934</li>
                    </ul>
                </div>
                <div class="card">
                  <h6>KHÓA HỌC</h6>
                  <p>Tất cả các khóa học</p>
                  <form action= "courseinfo" >
                  <ul>
                      <c:forEach items="${requestScope.course}" var="h">
                          <li>${h.name}</li>
                      </c:forEach>
                  </ul></form>
                </div>
                <div class="card">
                  <h6>SOCIAL</h6>
                  <p>Cập nhật những tin tức mới nhất</p>
                  <ul>
                    <li>
                      <a href="https://www.facebook.com/profile.php?id=100009174480179" target="_blank">
                        Facebook
                      </a>
                    </li>
                    <li>
                        <a href="/AssignmentWeb/dangki" target="_blank" class="btn btn-md btn-success mt-3">
                        Đăng ký ngay
                      </a>
                    </li>
                  </ul>
                </div>
                <div class="clear-fix" ></div>
            </div>
        </div>
    </div>
    </body>
</html>
