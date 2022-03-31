<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>瀏覽課程資訊</title>
<meta content="" name="description">
<meta content="" name="keywords">

<style>
.position_fixed {
	position: fixed;
}

.top64 {
	height: 100px;
}
</style>
<!-- Favicons -->
<jsp:include page="../incloud/favicons.jsp" />

<!-- Head CSS -->
<jsp:include page="../incloud/head-css.jsp" />

<!-- article CSS -->
<link rel="stylesheet" href="css/articles.css" />

<!-- jQuery -->
<script src="/SpecialTopic/js/jquery-3.6.0.js"></script>

<!-- 購物車 -->
<script src="/SpecialTopic/js/shopping_cart.js"></script>
</head>

<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../incloud/header-section.jsp" />
	<div class="top64">
	</div>
	<main id="main">
		<div class="container">
			<c:choose>
				<c:when test="${not empty errMsg}">
					${errMsg}
				</c:when>
				<c:otherwise>
					<div class="row">
						<!-- 課程介紹 -->
						<div class="col-8 min-vh-100">
							<div class="shadow p-3">
								<h3>${classBean.getTitle()}</h3>
								<img src="${classBean.getPhoto()}" alt="課程圖片" width="300"
									height="200">
								<a>${classBean.getClassType()}</a>
							</div>
						</div>

						<!-- 購物車 -->
						<div class="col-4">
							<div class="shadow p-3 position_fixed">
								<h3>價格:${classBean.getPrice()}</h3>
								<c:choose>
									<c:when test="${not empty classManagerBean}">
										<h3>課程已購買</h3>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${not empty ShoppingCart}">
												<button id="sc_btn" class="btn btn-danger"
													onclick="sc_del(${classBean.getCid()})">移除購物車</button>
											</c:when>
											<c:otherwise>
												<button id="sc_btn" class="btn btn-success"
													onclick="sc_add(${classBean.getCid()})">加入購物車</button>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</div>
						</div>

					</div>
				</c:otherwise>
			</c:choose>
		</div>



	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<jsp:include page="../incloud/footer-section.jsp" />

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Templete JS -->
	<jsp:include page="../incloud/body-js.jsp" />

	<!-- ======= errMsg ======= -->

</body>

</html>