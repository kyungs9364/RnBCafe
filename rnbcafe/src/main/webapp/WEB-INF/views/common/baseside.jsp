<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function() {
   $("#boardmenu a.category_name").click(function(){
      $(this).next("div.board_name").slideDown(500).siblings("div.board_name").slideUp("slow");
   });
});
</script>
<style type="text/css">
body {
	margin: 10px auto;
}

.category_name {
	padding: 5px 10px;
	cursor: pointer;
	position: relative;
	margin: 2px;
	font-weight: bold;
	text-align: left;
	background-color: #FFB2D9 #F361A6;
}

.board_name {
	display: none;
	text-align: left;
}

.board_name a {
	display: block;
	color: #2457BD;
	background: #F2F7FC;
	padding-left: 10px;
	text-decoration: none;
}

.board_name a:hover {
	color: #000000;
	text-decoration: underline;
}

.sidenav {
	/* background-color: #f1f1f1; */
	height: 100%;
}
</style>

	<div>여기에 내정보</div>

	<div class="list-group" id="boardmenu">

		<a href="#" class="category_name list-group-item active"> <span
			class="glyphicon glyphicon-tags"> 카테고리1 </span>
		</a>
		<div class="board_name">
			<a href="#"> <span class="glyphicon glyphicon-comment">게시판1</span>
			</a> <a href="#"> <span class="glyphicon glyphicon-comment">게시판2</span>
			</a> <a href="#"> <span class="glyphicon glyphicon-comment">게시판3</span>
			</a>
		</div>

		<a href="#" class="category_name list-group-item active"> <span
			class="glyphicon glyphicon-tags"> 카테고리2 </span>
		</a>
		<div class="board_name">
			<a href="#"> <span class="glyphicon glyphicon-comment">게시판1</span>
			</a> <a href="#"> <span class="glyphicon glyphicon-comment">게시판2</span>
			</a> <a href="#"> <span class="glyphicon glyphicon-comment">게시판3</span>
			</a>
		</div>

	</div>