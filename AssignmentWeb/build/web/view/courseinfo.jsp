<%-- 
    Document   : courseinfo
    Created on : Jul 8, 2019, 9:32:12 PM
    Author     : DUONG
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="/WEB-INF/tlds/newtag_library" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/main.css" type="text/css"/>
        <title>Course Info</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <section id="courseinfo">
                <div class="courseinfo1">                   
                    <div class="col1">
                        <h4>Khóa học ${requestScope.course.name}</h4>
                        <div class="sum">
                            <label>Thông tin</label>
                            <p>– Khóa học này sẽ cung cấp cho bạn những kiến thức - 
                                khái niệm mới về Java Desktop, giúp bạn làm quen và viết code với 
                                các component trên giao diện desktop.<br>
                                – Sau khoá học bạn sẽ hiểu rõ các làm việc - tương tác với các component
                                của Java Desktop để tạo nên một chương trình có giao diện người dùng,
                                có thể tự tin viết code, làm project trên lớp hoặc lab Java Desktop một cách đơn giản.
                            </p>
                            <hr>
                            <label>Đối tượng</label>
                            <p>– Những bạn sắp lên học chuyên ngành kỳ 3 hoặc đang học kỳ 2 - đã
                                học xong hoặc có kiến thức Java Core.<br>
                                – Là khóa học dành cho những bạn muốn học thật - lấy kiến thức
                                thật cho bản thân, chứ không phải chỉ đơn giản là học cho
                                qua môn (tất nhiên là nếu học tốt khóa học này thì chuyện qua môn là đơn giản).<br>
                                – Dành cho những bạn muốn lập trình một chương trình hoàn chỉnh
                                - có giao diện tương tác với người dùng.
                            </p>
                            <hr>
                            <label>Kiến thức nhận được</label>
                            <p>– Hiểu được Java Desktop là gì - có thể làm được gì.<br>
                                – Nắm được kiến thức về Thread và Multi Thread.<br>
                                – Nắm được cách sử dụng thành thạo các component của Java Desktop. <br>
                                – Nắm được cách sử dụng - tạo - Override các event trong Java Desktop. <br>
                                – Làm project cuối khóa theo chuẩn và kết hợp những thứ đã học vào một project duy nhất. <br>
                                – Định hướng cách học tốt nhất và hiệu quả trong quá trình học ở trường.
                            </p>
                        </div>
                    </div>
                    <div class="col2">
                        <div class="cinfo">
                            <div class="card--title">
                                <span>${requestScope.course.name}</span>
                            </div>
                            <div class="card--body">
                                <div class="card--title2">
                                    <h6>Thông tin khóa học ${requestScope.course.name}</h6>
                                </div>
                                <p>- Số tiết: ${requestScope.course.slot}</p>
                                <p>- Thời gian: ${requestScope.course.time}</p>
                                <p>- Người dạy: ${requestScope.course.mentor}</p>
                                <p>- Mỗi tuần 2 buổi: thứ 2 và thứ 5</p>
                                <p>- Tình trạng lớp: ${requestScope.course.status}</p>
                                <a <c:if test="${requestScope.course.status eq 'Đóng đơn'}">class="not-active"</c:if> href="/AssignmentWeb/dangki?id=${requestScope.course.ID}" target="_blank">Đăng kí</a>
                                </div>
                                <div class="card--footer">
                                ${fn:money(requestScope.course.cost)}<sup>đ</sup>
                            </div>
                        </div>
                    </div>
                </div>

            </section>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
