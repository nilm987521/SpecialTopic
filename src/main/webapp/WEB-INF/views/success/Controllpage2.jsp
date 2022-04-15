<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../incloud/head-css.jsp" />
<jsp:include page="../incloud/head-css.jsp" />
<title>當月熱門課程排序設定</title>
<script src="/SpecialTopic/js/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.position_fixed {
	position: fixed;
}

.height100 {
	height: 100px;
}
.width{
	width: 400px;
}
.twidth{
	width: 75px;
}
.table-striped>tbody>tr:nth-child(odd)>td, 
.table-striped>tbody>tr:nth-child(odd)>th {
   background-color: rgb(210, 244, 224   ); 
 }
</style>
</head>
<body>
	<jsp:include page="../incloud/header-section.jsp" />
	<div class="height100"></div>
	<div class="container">
		<div class="row">
			<div class="col min-vh-100">
			<h2><font color="success">當月訂單量前五名課程</font></h2>
				<table class="table2excel width table table-striped">
					<thead>
						<tr>
							<td align="center" style="border-bottom:5px solid #000">課程ID</td>
							<td align="center" style="border-bottom: 5px solid #000">課程名稱</td>
							<td align="center" style="border-bottom:5px solid #000">月份</td>
							<td align="center" style="border-bottom:5px solid #000">數量</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="th" items="${mpclasscontroll}">
							<tr>
								<td id="cid" align="center"><c:out value="${th.getClassID()}" /></td>
								<td align="center"><c:out value="${th.getClassBean().getTitle()}" /></td>
								<td align="center"><c:out value="${th.getMonth()}月" /></td>
								<td align="center"><c:out value="共${th.getMonthAmount()}筆" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<form action="mpclasschangetop5" method="get" id="rankForm">
				<div style="border-width:2px;border-style:dashed;border-color:#DEE2DF;padding:5px;" class="width">
					
							<div class="row g-3 align-items-center" style="margin:1px;">
								<div class="col-auto">
									<label for="inputPassword6" class="col-form-label">首頁排序一</label>
								</div>
								<div class="col-auto">
									<input id="pi1ID" type="text" class="form-control twidth" name="pi1" placeholder="課程ID">
								</div>
								<div class="col-auto">
									<span class="form-text"><font size="3" id="errorpi1" color="red"></font></span>
								</div>
							</div>
							

							<div class="row g-3 align-items-center" style="margin:1px;">
								<div class="col-auto">
									<label for="inputPassword6" class="col-form-label">首頁排序二</label>
								</div>
								<div class="col-auto">
									<input id="pi2ID" type="text" class="form-control twidth" name="pi2" placeholder="課程ID">
								</div>
								<div class="col-auto">
									<span class="form-text"><font size="3" id="errorpi2" color="red"></font></span>
								</div>
							</div>




							<div class="row g-3 align-items-center" style="margin:1px;">
								<div class="col-auto">
									<label for="inputPassword6" class="col-form-label">首頁排序三</label>
								</div>
								<div class="col-auto">
									<input id="pi3ID" type="text" class="form-control twidth" name="pi3" placeholder="課程ID">
								</div>
								<div class="col-auto">
									<span class="form-text"><font size="3" id="errorpi3" color="red"></font></span>
								</div>
							</div>
						</div>
				</form>	
				<div class="col-auto">
					<input type="button" onclick="sendRank()" class="btn btn-success"
						value="送出" /> <span class="form-text"><font size="3" id="errorID"
						color="red"></font></span> <span> <input
						type="button" onclick="reset()" class="btn btn-danger"
						value="回復正常排序" /> <span>${errors.resetmsg}</span>
					</span>
				</div>
						
			</div>
		</div>
	</div>
	<script>
	function sendRank() {
		var firstid = $('input#pi1ID');
		var secondid = $('input#pi2ID');
		var thirdid = $('input#pi3ID');
		$('font#errorID').html('');

		if (firstid.val() ==='') {
			$('font#errorpi1').html('請輸入排序一課程ID');
		}else{
			$('font#errorpi1').html('');
		}
		if (secondid.val() ==='') {
			$('font#errorpi2').html('請輸入排序二課程ID');
		}else{
			$('font#errorpi2').html('');
		}
		if (thirdid.val() ==='') {
			$('font#errorpi3').html('請輸入排序三課程ID');
		}else{
			$('font#errorpi3').html('');
		}
		if (thirdid.val() ===''|| firstid.val() ==='' || secondid.val() ==='') {
			return ;
		}else{
			var tdList=$("td#cid");
			var List =[];
			var cidListLength=tdList.length;
			for(let i = 0; i < cidListLength; i++){
				List.push( tdList[i].innerHTML );
				
				}
			
			if(List.indexOf($("input#pi1ID").val())==-1){
				$('font#errorID').html('請確認課程ID存在於列表');
				return;
			}
			if(List.indexOf($("input#pi2ID").val())==-1){
				$('font#errorID').html('請確認課程ID存在於列表');
				return ;
			}
			if(List.indexOf($("input#pi3ID").val())==-1){
				$('font#errorID').html('請確認課程ID存在於列表');
				return ;
			}
			swal("排序成功更新!", "瀏覽器即將跳轉回首頁", "success");
			$('form#rankForm').submit();
		}
	};
	function reset() {				
		swal("成功回復排序!", "瀏覽器即將跳轉回首頁", "success");
		window.location.href="/SpecialTopic/resetmpclass";

	}
	
	</script>
	<jsp:include page="../incloud/footer-section.jsp" />

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Templete JS -->
	<jsp:include page="../incloud/body-js.jsp" />

</body>
</html>