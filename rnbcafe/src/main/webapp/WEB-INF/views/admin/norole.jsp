<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }" />

	<div class="col-sm-9 main">
		
		<div class="row jumbotron">
      	<h2><font color="red">${bname}</font> 게시판 권한 안내</h2><br>
      	회원님은 현재							<font color="blue">
      										 ${mrole==1?"새내기":""}
											 ${mrole==2?"일반회원":""}
											 ${mrole==3?"우수회원":""}
											 ${mrole==4?"관리자":""}</font> 이세요. 
		이 게시판은 회원공개로 설정된 글의 경우			 <font color="blue">
											 ${brole==1?"새내기":""}
											 ${brole==2?"일반회원":""}
											 ${brole==3?"우수회원":""}
											 ${brole==4?"관리자":""}</font> 이상 읽기 가능해요.<br>
		등업신청 관련 게시판을 통해 신청하거나, 카페 활동을 열심히 하셔서 회원 등급을 올려보세요. 
		</div>
      
   </div>
