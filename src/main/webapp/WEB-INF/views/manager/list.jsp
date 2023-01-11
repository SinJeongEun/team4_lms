<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/fragment/nav.jsp"%>

<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/c/fonts/icomoon/style.css'/>">
<link rel="stylesheet" href="<c:url value='/c/css/owl.carousel.min.css'/>">
<script src="<c:url value='/c/js/jquery-3.3.1.min.js'/>"></script>
<script src="<c:url value='/c/js/popper.min.js'/>"></script>
<script src="<c:url value='/c/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/c/js/main.js'/>"></script>


<%@ include file="/WEB-INF/views/fragment/head.jsp"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>

<div class="content" style="border-bottom: 1px gray solid;">

	<div class="container">
		<div style="border-top: 1px solid gray;">
			<h2 class="mb-5 mt-3">사유 리스트</h2>
		</div>
		<div class="table-responsive">
			<table class="table">
				<tr>
					<td align="left">
						<tag:paging totalPageCount="${totalPageCount}" nowPage="${page}" boardType="${boardType}" />
					</td>
					<td align="right">
						
					</td>
					<td>
						<form method="get">
							<input type="submit" value="달력" />
						</form>
						
					</td>
				</tr> 
			</table>
			<table class="table table-striped custom-table">
				<thead>
					<tr>
						<th scope="col">신청일</th>
						<th scope="col">번호</th>
						<th scope="col">내용</th>
						<th scope="col">사유</th>
						<th scope="col">신청자</th>
						<th scope="col">처리 상태</th>
					</tr>
				</thead>
				<tbody>		
					<c:forEach items="${causeList}" var="causeListDto">
						<tr onclick="DetailList(${causeListDto.causeId})">
							<td class="column1">${causeListDto.writeDate}</td>
							<td class="column2">${causeListDto.causeId}</td>	
							<td class="column3">${causeListDto.content}</td>
							<td class="column4">${causeListDto.attendanceStatusString}</td>
							<td class="column5">${causeListDto.memberName}</td>
							<td class="column6">${causeListDto.causeStatusString}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container">
		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">사유 신청서</h4>
						<button type="button" class="close" data-dismiss="modal">X</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<div class="row">
							<div class="col-6">날짜</div>
							<div id="cd_date" class="col-6"></div>
						</div>
						<div class="row">
							<div class="col-6">이름</div>
							<div id="cd_name" class="col-6"></div>
						</div>
						<div class="row">
							<div class="col-6">출석유형</div>
							<div id="cd_attendance" class="col-6"></div>
						</div>
						<div class="row">
							<div class="col-6">상세 이유</div>
							<div id="cd_category" class="col-6"></div>
						</div>

						<div class="row">
							<div class="col-6">내용</div>
							<div id="cd_content" class="col-6"></div>
						</div>
						<div class="row">
							<div class="col-6">첨부파일</div>
							<div id="cd_file" class="col-6"></div>
						</div>
						<div class="row">
							<div class="col-6">처리</div>
							<div id="cd_status" class="col-6"></div>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-info">허가</button>
						<button type="button" class="btn btn-info">거절</button>			
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</div>
<%@ include file="/WEB-INF/views/fragment/footer.jsp"%>