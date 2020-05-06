<%-- 
    Document   : search
    Created on : Jul 6, 2019, 8:05:57 PM
    Author     : DUONG
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Student"%>
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
                // this function runs when a user selects an option from a <select> element
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
                    <form action="searchstudent" method="post">
                        <div class="search1">
                            <label>Tìm kiếm theo:</label>
                            <select onchange="location = this.options[this.selectedIndex].value;">
                                <option value="/AssignmentWeb/searchstudent">Học viên</option>
                                <option value="/AssignmentWeb/searchcourse">Khóa học</option>
                            </select></br>
                            <label>Tên:</label><input type="text" value="${requestScope.name}" name="name"></br>
                            <label>Ngày sinh từ</label><input type="text" value="${requestScope.dobf}" name="dobf"><span style="padding-left: 10px;">(yyyy-mm-dd)</span></br>
                            <label>đến</label><input type="text" value="${requestScope.dobt}" name="dobt"></br>
                            <label>Giới tính</label><input type="radio" style="width:80px;" name="gender" <c:if test="${requestScope.gender eq 'Nam'}">checked</c:if> value="Nam">Nam<input type="radio" style="width:80px;" <c:if test="${requestScope.gender eq 'Nữ'}">checked</c:if> name="gender" value="Nữ">Nữ                     
                                <div class="col"><button type="submit">Tìm kiếm</button></div>
                            </div>                      
                        </form>
                    </div>
                </section>
                <div class="center"><hr></div>
                <section id="teach">
                    <div class="teach1">
                        <span>Thông tin học sinh</span>
                        <table>
                            <tr>
                                <td>ID Student</td>
                                <td>Tên</td>
                                <td>Ngày sinh</td>
                                <td>Giới tính</td>
                                <td>SĐT</td>
                                <td>Email</td>
                            </tr>
                        <c:forEach items="${requestScope.student}" var="h">
                            <tr>
                                <td>${h.ID}</td>
                                <td>${h.name}</td>
                                <td>${h.dob}</td>
                                <td>${h.gender}</td>
                                <td>${h.sdt}</td>
                                <td>${h.email}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <%
                        DBContext db = new DBContext();
                        String name = (String) request.getAttribute("name");
                        String dobf = (String) request.getAttribute("dobf");
                        String dobt = (String) request.getAttribute("dobt");
                        String gender = (String) request.getAttribute("gender");
                        int lsize = (Integer) request.getAttribute("size");
                        if (name == null) {
                            name = "";
                        }if (dobf == null) {
                            dobf = "";
                        }if (dobt == null) {
                            dobt = "";
                        }if (gender == null) {
                            gender = "";
                        }
                        int a, b;
                        int size = 4;
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
                    <a href="searchstudent?start=<%=a%>&end=<%=b%>&name=<%=name%>&dobf=<%=dobf%>&dobt=<%=dobt%>&gender=<%=gender%>"><%=i%></a>
                    <%
                        }
                    %>
                </div>
            </section>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
