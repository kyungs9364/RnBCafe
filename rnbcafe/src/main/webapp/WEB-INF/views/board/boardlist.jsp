<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container" style="margin-top: 70px">
	<div class="row">
		<!-- 사이드바 -->
		<div class="col-sm-3 sidenav">
			<%@ include file="/WEB-INF/views/common/left.jsp"%>
		</div>
		<!-- 여기서부터 게시판 메인 꾸미기 -->

		<div class="col-sm-9 main">
			<!-- 			<div class="jumbotron" style=""> -->
			<!-- 				<h3> -->
			<!-- 					<i class="fa fa-quote-left"></i> &nbsp;<b>커뮤니티</b> <i -->
			<!-- 						class="   fa fa-quote-right"></i> -->
			<!-- 				</h3> -->
			<!-- 			</div> -->

			<h5>자유게시판</h5>
			<button class="btn btn-default btn-sm">
				<span class="glyphicon glyphicon-pencil"></span> 글쓰기
			</button>
			<br>
			<br>
			<!-- 			<div class="col-sm-10 col-sm-offset-2"> -->
			<table class="table">
				<tr>
					<th>#</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
				<tr>
					<th>3</th>
					<td>행운은 반드시 아침에 찾아온다.</td>
					<td>류상민</td>
					<td>17.09.18</td>
					<td>23</td>
				</tr>
				<tr>
					<th>2</th>
					<td>친구</td>
					<td>류상민</td>
					<td>17.09.13</td>
					<td>37</td>
				</tr>
				<tr>
					<th>1</th>
					<td>경청</td>
					<td>류상민</td>
					<td>17.08.21</td>
					<td>34</td>
				</tr>
			</table>
			<!-- 			</div> -->
		</div>

		<!-- 여기까지가 우리가 꾸밀부분 -->
		<!-- 푸터 -->

	</div>
</div>
</body>
</html>