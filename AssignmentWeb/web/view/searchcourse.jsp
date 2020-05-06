<%-- 
    Document   : search
    Created on : Jul 6, 2019, 8:05:57 PM
    Author     : DUONG
--%>

<%@page import="java.util.List"%>
<%@page import="model.Course"%>
<%@page import="dbcontext.DBContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="/WEB-INF/tlds/newtag_library" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/main.css" type="text/css"/>
        <title>Advanced Search</title>
        <script>
            $('select.menu').change(function (e) {
                window.location.href = $("select.menu option:selected").attr('value');
            });
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <section id="hi" class="text-center">
              
                <div class="title">
                    <h2 class="search">Tìm kiếm</h2>
                </div>
            </section>
            <section id="allsearch">
                <div>
                    <form action="searchcourse" method="post">
                        <div class="search1">
                            <label>Tìm kiếm theo:</label>
                            <select onchange="location = this.options[this.selectedIndex].value;">
                                <option <c:if test="${requestScope.Type eq 'Student'}">selected</c:if> value="/AssignmentWeb/searchstudent">Học viên</option>
                                <option <c:if test="${requestScope.Type eq 'Course'}">selected</c:if> value="/AssignmentWeb/searchcourse">Khóa học</option>
                                </select></br>
                                <label>Tên khóa học:</label><input type="text" value="${requestScope.name}" name="name"></br>
                            <label>Mức phí trong khoảng từ</label><input type="text" value="${requestScope.costf}" name="costf"></br>
                            <label>đến</label><input type="text" value="${requestScope.costt}" name="costt"></br>
                            <div class="col"><button type="submit">Tìm kiếm</button></div>
                        </div>                      
                    </form>
                </div>
            </section>
            <div class="center"><hr></div>
            <section id="teach">
                <div class="teach1">
                    <span>Thông tin khóa học</span>
                    <table>
                        <tr>
                            <td>ID Course</td>
                            <td>Name</td>
                            <td>Số buổi</td>
                            <td>Mức phí</td>
                            <td>Tình trạng</td>
                        </tr>
                        <c:forEach items="${requestScope.course}" var="h">
                            <tr>
                                <td>${h.ID}</td>
                                <td>${h.name}</td>
                                <td>${h.slot}</td>
                                <td>${h.cost}<sup>đ</sup></td>
                                <td>${h.status}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <%
                        DBContext db = new DBContext();

                        int lsize = (Integer) request.getAttribute("size");
                        String name = (String) request.getAttribute("name");
                        String costf = (String) request.getAttribute("costf");
                        String costt = (String) request.getAttribute("costt");
                        if (name == null) {
                            name = "";
                        } if (costf == null) {
                            costf = "";
                        }if (costt == null) {
                            costt = "";
                        }
                        int a, b;
                        int size = 3;
                        int numofpage = lsize / size;
                        if ((numofpage * size) < lsize) {
                            numofpage++;
                        }
                        for (int i = 1; i <= numofpage; i++) {
                            a = (i - 1) * size;
                            b = i * size;
                            if (b > lsize) {
                                b = lsize;
                            }
                    %>
                    <a href="searchcourse?start=<%=a%>&end=<%=b%>&name=<%=name%>&costf=<%=costf%>&costt=<%=costt%>#teach"><%=i%></a>
                    <%
                        }
                    %>
                </div>
            </section>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
