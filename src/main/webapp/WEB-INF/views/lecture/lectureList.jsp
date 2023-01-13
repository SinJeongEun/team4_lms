<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/fragment/head.jsp"%>

<!-- home -->
<link rel="icon" type="image/x-icon"
	href="<c:url value='/h/assets/favicon.ico'/>" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/h/css/styles.css'/>" rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/h/js/scripts.js'/>"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<style>
body{
background-color: #efefef;;
}
</style>
<%@ include file="/WEB-INF/views/fragment/nav.jsp"%>
	<div class="content" style="border-bottom: 1px gray solid;">
		<div class="container">
			<div style="border-top: 1px solid gray;">
				<h1 class="mb-5 mt-3" style="font-weight: 400 !important;">강의 출결 관리</h1>
			</div>
			<div class="row justify-content-center" style="border-top: 1px solid gray">
				<p></p><br/>
				<c:forEach var="lecture" items="${lectureList}">
					<form action="<c:url value='/lecture/${lecture.lectureId}'/>"
						method="get" class="form-horizontal" style="width: 100%;">
						<input type="hidden" value="${lecture.lectureName}"
							name="lectureName" />
						<button type="submit" class="btn mb-1"
							style="background-color: #F9F6F1; width: 100%; height:200px;">${lecture.lectureName}</button>
					</form>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</head>
</html>
<%@ include file="/WEB-INF/views/fragment/footer.jsp"%>