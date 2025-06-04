<!-- 成績登録完了JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/common/base.jsp">
	<c:param name="title">
		得点管理システム
	</c:param>

	<c:param name="content">
		<div>
			<h2>成績管理</h2>
			<div>
				<p>登録が完了しました</p>

				<br>
				<!-- 成績管理一覧画面に遷移 -->
				<a href="TestRegist.action">戻る</a>
				<br>
				<!-- 成績参照検索画面に遷移 -->
				<a href="TestList.action">成績参照</a>
			</div>
		</div>
	</c:param>
</c:import>