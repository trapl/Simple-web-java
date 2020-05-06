<%-- 
    Document   : deletestudent
    Created on : Jul 11, 2019, 11:36:20 AM
    Author     : DUONG
--%>
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
        <script>
            function edit(action, user) {
                document.location.href = action + '?user=' + user;
            }
        </script>  
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <section id="allsearch">
                <div>
                    <form action="update" method="post">
                        <div class="search1">
                            <label>Cập nhật bản ghi cho:</label>
                            <select onchange="location = this.options[this.selectedIndex].value;">
                                <option <c:if test="${requestScope.Type eq 'Student'}">selected</c:if> value="/AssignmentWeb/update?type=Student">Học viên</option>
                                <option <c:if test="${requestScope.Type eq 'Course'}">selected</c:if> value="/AssignmentWeb/update?type=Course">Khóa học</option>
                                <option <c:if test="${requestScope.Type eq 'Teacher'}">selected</c:if> value="/AssignmentWeb/update?type=Teacher">Giáo viên</option>
                                </select></br>
                            </div>                      
                        </form>
                    </div>
                </section>
                <div class="center"><hr></div>
                <section id="teach">
                    <div class="teach1">
                        <span>Thông tin ${requestScope.Type}</span>
                    <table>
                        <tr>
                            <c:if test="${requestScope.Type eq 'Course'}">
                                <td>ID Course</td>
                                <td>Tên</td>
                                <td>Số buổi</td>
                                <td>Mức phí</td>
                                <td>Tình trạng lớp</td>
                            </c:if>
                            <c:if test="${requestScope.Type eq 'Student'}">
                                <td>ID Student</td>
                                <td>Tên</td>
                                <td>Ngày sinh</td>
                                <td>Giới tính</td>
                                <td>SĐT</td>
                                <td>Email</td>
                            </c:if>
                            <c:if test="${requestScope.Type eq 'Teacher'}">
                                <td>ID Teacher</td>
                                <td>Tên</td>
                                <td>Ngày sinh</td>
                                <td>Giới tính</td>
                                <td>SĐT</td>
                                <td>Email</td>
                            </c:if>                            
                        </tr>
                        <c:forEach items="${requestScope.course}" var="h">
                            <tr>
                                <c:if test="${requestScope.Type eq 'Course'}">
                                    <td>${h.ID}</td>
                                    <td>${h.name}</td>
                                    <td>${h.slot}</td>
                                    <td>${h.cost}</td>
                                    <td>${h.status}</td>
                                    <td><input type="button" value="Update" onclick="edit('/AssignmentWeb/updatecourse',${h.ID})"></td>
                                    </c:if>
                                    <c:if test="${requestScope.Type eq 'Student'}">
                                    <td>${h.ID}</td>
                                    <td>${h.name}</td>
                                    <td>${h.gender}</td>
                                    <td>${h.dob}</td>
                                    <td>${h.sdt}</td>
                                    <td>${h.email}</td>
                                    <td><input type="button" value="Update" onclick="edit('/AssignmentWeb/updatestudent',${h.ID})"></td>
                                    </c:if>
                                    <c:if test="${requestScope.Type eq 'Teacher'}">
                                    <td>${h.ID}</td>
                                    <td>${h.name}</td>
                                    <td>${h.gender}</td>
                                    <td>${h.dob}</td>
                                    <td>${h.sdt}</td>
                                    <td>${h.email}</td>
                                    <td><input type="button" value="Update" onclick="edit('/AssignmentWeb/updateteacher',${h.ID})"></td>
                                    </c:if>                           
                            </tr>
                        </c:forEach>
                    </table>
                             <% 
                  DBContext db = new DBContext();
                  
                 int lsize = (Integer) request.getAttribute("size");
                 String type = (String)request.getAttribute("Type");
                 
                    int a,b;
                    int size = 3; 
                    int numofpage=lsize/size;
                    if((numofpage*size)<lsize){
                        numofpage++;
                    }
                    for (int i = 1; i <= numofpage; i++) {
                            a=(i-1)*size;
                            b=i*size;
                            if(b>lsize){
                                b= lsize;
                            }
                            %>
                   <a href="update?type=<%=type%>&start=<%=a %>&end=<%=b%>#teach"><%=i%></a>
                   <%
                        }
                        %>

                </div>
            </section>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
