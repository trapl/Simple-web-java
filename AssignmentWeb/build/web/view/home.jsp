<%-- 
    Document   : home
    Created on : Jul 1, 2019, 2:45:27 PM
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
        <script src='gmap.js'></script>
        <title>Finding Course Online</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <section id="hi" class="text-center">
                
                <div class="title">
                    <h2>COURSE</h2>
                    <p class="css"></p>
                </div>
            </section>
            
            <section id="gallery">              
                    <div>
                        <c:forEach items="${requestScope.course}" var="h">
                    <div class="card">
                        <img src="./img/imgd.png" class="card-img-top">
                        <div class="card-body">                       
                        <h5 class="card-title">${h.name}</h5>
                        <p class="card-text">${h.info}</p>
                        <p class="card-time">Thời gian: ${h.slot} buổi</p>
                        <a href="/AssignmentWeb/courseinfo?id=${h.ID}" class="card-info">Chi tiết</a>(${h.status})
                        <div class="card-footer">
                            <small>${fn:money(h.cost)}<sup>đ</sup></small>
                        </div>
                        </div>
                    </div>
                    </c:forEach>
                        <div class="clear-fix"></div>
                    </div>
            </section>
            <section>
                <div class="title">
                    <h2 class="text-center">CONTACT</h2>
                    <p class="css"></p>
                </div>
                <div id ="gmap" style="width:100%;height:400px" ></div>
                    <script>
                        function myMap() {
                            var myCenter = new google.maps.LatLng(21.026842,105.6170397);
                            var mapCanvas = document.getElementById("gmap");
                            var mapOptions = {
                                center: myCenter,
                                zoom: 16
                            };
                            var map = new google.maps.Map(mapCanvas, mapOptions);
                            var marker = new google.maps.Marker({
                                position: myCenter
                            });
                            marker.setMap(map);
                            var infowindow = new google.maps.InfoWindow({
                                content: "Finding Course Online"
                            });
                            infowindow.open(map, marker);
                        }
                    </script>
                    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2LlIj3sk2akFpnpNcXzX9_NS08Xda1sE&callback=myMap"></script>
            </section>
            <%@include file="footer.jsp" %>
        </main>
    </body>
</html>