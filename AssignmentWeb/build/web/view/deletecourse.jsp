<%-- 
    Document   : deletestudent
    Created on : Jul 11, 2019, 11:36:20 AM
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
        <title>JSP Page</title>
        <script>
            $('select.menu').change(function (e) {
                // this function runs when a user selects an option from a <select> element
                window.location.href = $("select.menu option:selected").attr('value');
            });
        </script>
        <SCRIPT LANGUAGE="JavaScript">
            function confirmAction() {
                return confirm("Bạn có chắc muốn xóa bản ghi này ?");
            }

        </SCRIPT>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <section id="allsearch">
                <div>
                    <form action="searchcourse" method="post">
                        <div class="search1">
                            <label>Xóa bản ghi theo:</label>
                            <select onchange="location = this.options[this.selectedIndex].value;">
                                <option <c:if test="${requestScope.Type eq 'Student'}">selected</c:if> value="/AssignmentWeb/deletestudent">Học viên</option>
                                <option <c:if test="${requestScope.Type eq 'Course'}">selected</c:if> value="/AssignmentWeb/deletecourse">Khóa học</option>
                                <option <c:if test="${requestScope.Type eq 'Teacher'}">selected</c:if> value="/AssignmentWeb/deleteteacher">Giáo viên</option>
                                </select></br>
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
                                <td>Tên</td>
                                <td>Số buổi</td>
                                <td>Mức phí</td>
                                <td>Tình trạng lớp</td>
                            </tr>
                        <c:forEach items="${requestScope.course}" var="h">
                            <tr>
                                <td>${h.ID}</td>
                                <td>${h.name}</td>
                                <td>${h.slot}</td>
                                <td>${h.cost}</td>
                                <td>${h.status}</td>
                                <td><a onclick="return confirmAction()" href="/AssignmentWeb/deletecourse?user=${h.ID}">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                         <% 
                  DBContext db = new DBContext();
                  List<Course> list = db.getallCourse();
                    int a,b;
                    int size = 3; 
                    int numofpage=list.size()/size;
                    if((numofpage*size)<list.size()){
                        numofpage++;
                    }
                    for (int i = 1; i <= numofpage; i++) {
                            a=(i-1)*size;
                            b=i*size;
                            if(b>list.size()){
                                b= list.size();
                            }
                            %>
                   <a href="deletecourse?start=<%=a %>&end=<%=b%>"><%=i%></a>
                   <%
                        }
                        %>
                </div>
            </section>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
