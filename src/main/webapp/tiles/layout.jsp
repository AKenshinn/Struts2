<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
	<title>
		<tiles:insertAttribute name="title" ignore="true"/>
	</title>
	<!-- jQuery -->
	<script type="text/javascript" src="./assets/jQuery.min.js"></script>
	<!-- Bootstrap -->
	<script type="text/javascript" src="./assets/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="./assets/bootstrap/css/bootstrap.min.css"/>
	<!-- Font Awesome -->
	<link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.min.css"/>
</head>
<body>
	
	<div class="container">
		<tiles:insertAttribute name="content" ignore="false" />
	</div>
	
</body>
</html>