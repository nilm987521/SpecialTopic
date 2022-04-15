<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<header id="header" class="fixed-top" style="background-color:rgb(60, 60, 60)">

	<div id="header2" class="container d-flex align-items-center">

		<h1 class="logo me-auto">
			<a href="/SpecialTopic/">OOXX</a>
		</h1>
		<nav id="navbar" class="navbar order-last order-lg-0">
			<ul class="headerfont">
				<li><a class="active" href="/SpecialTopic/">首頁</a></li>
				<li><a class="a" href="/SpecialTopic/about">關於</a></li>
				<li><a class="a" href="/SpecialTopic/courses">課程</a></li>
				<li><a class="a" href="/SpecialTopic/trainers">教師</a></li>
				<li><a class="a" href="/SpecialTopic/articles">知識補給站</a></li>
				<li><a class="a" href="contact">聯繫我們</a></li>
				<c:choose>
					<c:when test="${not empty pageContext.request.userPrincipal.name}">
						<li class="dropdown"><a href="#"> <span class="bgfunction">後台功能</span><i
								class="bi bi-chevron-down dropdown"></i></a>
							<ul class="dropdown mydropdown">
								<li class="dropdown"><a href="#"><span class="bgfunction">金流</span> <i
										class="bi bi-chevron-right"></i></a>
									<ul>
										<li><a href="/SpecialTopic/tradeRecord/teacher">教師售課紀錄</a></li>
										<li><a href="#">Deep Drop Down 2</a></li>
										<li><a href="#">Deep Drop Down 3</a></li>
										<li><a href="#">Deep Drop Down 4</a></li>
										<li><a href="#">Deep Drop Down 5</a></li>
									</ul>
								<li class="dropdown"><a href="#"><span class="bgfunction">課程管理 </span> <i
										class="bi bi-chevron-right"></i></a>
									<ul>
										<li><a href="class/list">課程清單</a></li>
										<li><a href="#">Deep Drop Down 2</a></li>
										<li><a href="#">Deep Drop Down 3</a></li>
										<li><a href="#">Deep Drop Down 4</a></li>
										<li><a href="#">Deep Drop Down 5</a></li>
									</ul></li>
								<li class="dropdown"><a class="a" href="inputmain">學員資料統計</a></li>
								<li class="dropdown"><a class="a" href="ypclasscontrolltop5">年度熱門課程</a></li>
								<li class="dropdown"><a class="a" href="mpclasscontrolltop5">當月熱門課程</a></li>
								<li class="dropdown"><a href="#"><span class="bgfunction">熱門課程管理 </span> <i
										class="bi bi-chevron-right"></i></a>
									<ul>
										<li><a class="a" href="ypclasscontrolltop5">年度熱門課程</a></li>
										<li><a class="a" href="mpclasscontrolltop5">當月熱門課程</a></li>
										<li><a href="#">Deep Drop Down 3</a></li>
										<li><a href="#">Deep Drop Down 4</a></li>
										<li><a href="#">Deep Drop Down 5</a></li>
									</ul></li>
								<li class="dropdown"><a class="a" href="/SpecialTopic/member/editInformation"
									type="button">個人資料</a></li>
								<sec:authorize
									access="hasRole('ROLE_admin') and isAuthenticated()">
									<li class="dropdown"><a class="a" href="/SpecialTopic/member/membermanage"
										type="button">學員管理</a></li>
								</sec:authorize>

								<li class="dropdown"><a class="a" href="/SpecialTopic/logout_page">登出</a></li>
							</ul> <i class="bi bi-list mobile-nav-toggle"></i></li>
						<li id="scl"></li>
					</c:when>
				</c:choose>
			</ul>
		</nav>
		<!-- .navbar -->

		<c:choose>
			<c:when test="${empty pageContext.request.userPrincipal.name}">
				<!-- Button trigger modal -->
				<a type="button" id="login" class="get-started-btn"
					data-bs-toggle="modal" data-bs-target="#loginform">登入</a>
				<!-- Modal -->
				<div class="modal fade" id="loginform" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<!-- Header -->
							<div class="modal-header"
								style="background-color: hsla(89, 43%, 51%, 0.3)">
								<h5 class="modal-title" id="exampleModalLabel">登入</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<!-- Body -->
							<div class="modal-body"
								style="background-color: hsla(89, 43%, 51%, 0.3)">
								<form action="/SpecialTopic/login" method="POST">
									<!-- username -->
									<div class="form-group">
										<input type="text" name="username" required="required"
											class="username form-control" placeholder="帳號: ">

									</div>
									<!-- passowrd -->
									<div class="form-group">
										<input type="password" name="password" required="required"
											class="password form-control" placeholder="密碼: ">

									</div>
									<!-- checkbox -->
									<div class="form-group">
										<input type="checkbox" id="rememberMe-key"
											name="rememberMe-key" class="remember">記住我的密碼 <a
											href="registerPage1" type="button" class="memberregister"
											style="float: right; font-size: 20px">點擊註冊</a> <span
											style="float: right; font-size: 20px">尚未成為學員?</span>
									</div>
									<!-- 送出按鈕 -->
									<div>
										<button type="submit" class="btn btn-primary">登入</button>
									</div>
								</form>

							</div>
							<!-- Footer -->
							<div class="modal-footer"
								style="background-color: hsla(89, 43%, 51%, 0.3)">
								<div class="signup"></div>

							</div>
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
	</div>
</header>
<!-- End Header -->