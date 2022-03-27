<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
	integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>관리자 토탈</title>
</head>

<style>
body {
	margin: 0;
}


.boardList_section {
	width: 1200px;
	height: 600px;
	background: white;
	margin: 0 auto;
	position: relative;
}

.board_title {
	width: 1000px;
	height: 40px;
	background: wheat;
	position: absolute;
	left: 100px;
}

.board_title h2 {
	text-align: center;
	margin: 0 auto;
}
.board_chart {
	width: 500px;
	height: 500px;
	position: absolute;
	left: 60px;
	top: 80px;
}
.board_table {
	width: 500px;
	height: 500px;
	position: absolute;
	right: 60px;
	top: 80px;
}
</style>
<body>
	<header>
		<%@include file="../admin_include/admin_header.jsp"%>
	</header>
	<!-- 보드 섹션 -->
	<section class="boardList_section">
		<div class="board_title">
			<h2>board List & chart</h2>
		</div>

		<div class="board_chart">
			<div>
				<div id="chart_div" style="height: 500px"></div>
			</div>
		</div>

		<div class="board_table">
			<div>
				<input class="datepicker" id="date1" placeholder="날자선택"> ~ <input
					class="datepicker" id="date2" placeholder="날자선택">
				<script>
					$(function() {
						$('.datepicker').datepicker();
					})
				</script>
				<input type="button" value="조회" id="join-date">
			</div>

			<table id="chart-tbl">
				<thead>
					<tr>
						<th>게시판 종류</th>
						<th>게시물 수</th>
					</tr>
				</thead>
				<tbody id="board_info">
					<!-- 
					<c:forEach var="vo" items="${allTotal}">
						<tr>
							<td>${vo.board_type}</td>
							<td>${vo.count}</td>
						</tr>
					</c:forEach>
					 -->
				</tbody>

			</table>
		</div>
	</section>



</body>
<script>
	$(function() {
		$('#join-date')
				.click(
						function() {
							var date1 = $('#date1').val();
							var date2 = $('#date2').val();

							str = '';
							$
									.ajax({
										type : 'post',
										url : '<c:url value ="/admin/findDate"/>',
										dataType : "json",
										data : {
											date1 : date1,
											date2 : date2
										},
										success : function(data) {
											for ( var i = 1 in data) {
												str += "<tr>"
												str += "<td>"
												if(data[i].BOARD_TYPE == 1){
													str += "사기업게시판(1)"
												}
												else if(data[i].BOARD_TYPE == 2){
													str += "공기업게시판(2)"
												}
												else if(data[i].BOARD_TYPE == 3){
													str += "아시아게시판(3)"
												}
												else if(data[i].BOARD_TYPE == 4){
													str += "유럽게시판(4)"
												}
												else if(data[i].BOARD_TYPE == 5){
													str += "남미게시판(5)"
												}
												else if(data[i].BOARD_TYPE == 6){
													str += "북미게시판(6)"
												}
												else if(data[i].BOARD_TYPE == 7){
													str += "아프리카(7)"
												}
												else if(data[i].BOARD_TYPE == 8){
													str += "국가자격증(8)"
												}
												else if(data[i].BOARD_TYPE == 9){
													str += "민간자격증(9)"
												}
												else if(data[i].BOARD_TYPE == 10){
													str += "어학자격증(10)"
												}
												else if(data[i].BOARD_TYPE == 11){
													str += "자유게시판(11)"
												}
												else if(data[i].BOARD_TYPE == 12){
													str += "취뽀게시판(12)"
												}
												else if(data[i].BOARD_TYPE == 13){
													str += "취업게시판(13)"
												}
												else if(data[i].BOARD_TYPE == 14){
													str += "자격증게시판(14)"
												}
												else if(data[i].BOARD_TYPE == 15){
													str += "자소서게시판(15)"
												}
												else if(data[i].BOARD_TYPE == 16){
													str += "삭제(16)"
												}
												str +=	 "</td>"
												str += "<td>" + data[i].COUNT
														+ "</td>"
												str += "</tr>"
											}
											$("#board_info").html(str);
											$("#chart-tbl").DataTable();

											google.charts.load('current',
													{
														packages : [
																'corechart',
																'bar' ]
													});

											google.charts
													.setOnLoadCallback(drawBasic);

											function drawBasic() {

												console.log(data.length);

												var dataTable = new google.visualization.DataTable();
												dataTable.addColumn('number',
														'날짜');
												dataTable.addColumn('number',
														'글수');

												chart_data = [];

												for ( var i = 1 in data) {
													chart_data.push([
															data[i].BOARD_TYPE,
															data[i].COUNT ])
												}

												console.log(chart_data);

												dataTable.addRows(chart_data);

												var options = {

													title : '게시글 수',
													hAxis : {
														title : '게시판명'
													},
													vAxis : {
														title : '글수'
													}
												};

												var chart = new google.visualization.ColumnChart(

														document
																.getElementById('chart_div'));

												chart.draw(dataTable, options);

											}
										},
										error : function(request, status, error) {
											console.log('에러발생!!');
											console.log("code:"
													+ request.status + "\n"
													+ "message:"
													+ request.responseText
													+ "\n" + "error:" + error);
										}
									}) // end ajax
						})
		//$("#board-admin").DataTable();
	})
</script>
</html>