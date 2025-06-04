<!-- 成績管理一覧JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/common/base.jsp" >
	<c:param name="title">
		得点管理システム
	</c:param>

	<c:param name="content">
		<h2>成績管理</h2>

		<form action="TestRegist.action" method="get">
			<div>

			<!-- しかくの中 -->
			    <!-- 入学年度 -->
				<div style="display:inline;">
					<label>入学年度</label>
					<select name="f1">
						<option value="0">--------</option>
						<c:forEach var="year" items="${entYearList }">
							<%-- 現在のyearと選択されていたf1が一致していた場合selectedを追記 --%>
							<option value="${year }" <c:if test="${year==f1 }">selected</c:if>>${year }</option>
						</c:forEach>
					</select>
				</div>
				<!-- クラス -->
				<div style="display:inline;">
					<label>クラス</label>
					<select name="f2">
						<option value="0">--------</option>
						<c:forEach var="num" items="${cNumList }">
							<%-- 現在のnumと選択されていたf2が一致していた場合selectedを追記 --%>
							<option value="${num }" <c:if test="${num==f2 }">selected</c:if>>${num }</option>
						</c:forEach>
					</select>
				</div>
				<!-- 科目 -->
				<div style="display:inline;">
					<label>科目</label>
					<select name="f3">
						<option value="0">--------</option>
						<c:forEach var="subject" items="${list }">
							<%-- 現在のsubject.cdと選択されていたf3が一致していた場合selectedを追記 --%>
							<option value="${subject.cd }" <c:if test="${subject.cd==f3 }">selected</c:if>>${subject.name }</option>
						</c:forEach>
					</select>
				</div>
				<!-- 回数 -->
				<div style="display:inline;">
					<label>回数</label>
					<select name="f4">
						<option value="0">--------</option>
						<c:forEach var="num" items="${countList }">
							<%-- 現在のnumと選択されていたf4が一致していた場合selectedを追記 --%>
							<option value="${num }" <c:if test="${num==f4 }">selected</c:if>>${num }</option>
						</c:forEach>
					</select>
				</div>
				<!-- 検索ボタン -->
				<div style="display:inline;">
					<input type="submit" value="検索" />
				</div>
				<div>${errors.get("a") }</div>
			</div>
		</form>

		<div><br /><br /></div>

		<form action="TestRegistExecute.action" method="get">
			<c:choose>
				<c:when test="${testlist.size()>0 }">
					<div>科目：${subject_name }（${f4 }回）</div>
					<!-- 表示するテーブルの作成 -->
					<table>
						<tr>
							<th>入学年度</th>
							<th>クラス</th>
							<th>学生番号</th>
							<th>氏名</th>
							<th>点数</th>
						</tr>
						<c:forEach var="test" items="${testlist }" varStatus="st">
							<tr>
								<td>${test.student.entYear }</td> <!-- 入学年度 -->
								<td>${test.classNum }</td> <!-- クラス -->
								<td>${test.student.no }</td> <!-- 学生番号 -->
								<td>${test.student.name }</td> <!-- 氏名 -->
								<td><input type="text" name="point_${test.student.no }"<c:if test="${test.no != 0}">value="${test.point }"</c:if> value=""><div class="mt-2 text-warning">${errors.get(st.count) }</div></td> <!-- 得点 -->
							</tr>
							<input type="hidden" name="regist" value="${test.student.no }">
						</c:forEach>
					</table>
					<input type="hidden" name="count" value="${f4 }">
					<input type="hidden" name="subject" value="${f3 }">
					<div>
						<input type="submit" value="登録して終了" />
					</div>
				</c:when>
			</c:choose>
		</form>
	</c:param>
</c:import>