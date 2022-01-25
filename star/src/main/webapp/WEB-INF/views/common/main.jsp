<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Ehshe Project</title>
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<style>
.intro{
    height:100vh;
    background: url(resources/images/mainbackground3.jpg) no-repeat center center;
    background-size: cover;
}
nav{
    opacity: 0.7;
}
 @media(max-width:768px){
    .intro{
           height: 35vh;
    }
 }


</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="main-section">
        <main class="intro">
        </main>

        <section class="about">
            <div class="inner">
                <div class="about-content">
                    <div class="description">
                       
                    </div>
                  
                </div>
            </div>
        </section>

        
    </div>
	
	
	
	<jsp:include page="footer.jsp" />
</body>
</html>