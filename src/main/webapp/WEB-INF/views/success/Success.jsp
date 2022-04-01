<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>
<link rel="stylesheet" href="/css/ordersystem.css">

</head>
<body>
	<table>
		<thead>
			<tr>
				<td>資料成功存入:</td>
				<td>老師名字:</td>
				<td>年份:</td>
				<td>數量:</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="th" items="${ypteacherList}">
				<tr>
					<td ><c:out value="" /></td>
					<td style="border-top:1px solid #000"><c:out value="${th.getMemberInformation().getFullname()}" /></td>
					<td style="border-top:1px solid #000"><c:out value="${th.getYear()}" /></td>
					<td style="border-top:1px solid #000"><c:out value="${th.getYearAmount()}" /></td>						
				</tr>
			</c:forEach>
		</tbody>
	</table>
	

</body>
</html>