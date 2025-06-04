<!-- 科目別成績一覧JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/common/base.jsp" >
	<c:param name="title">
		得点管理システム
	</c:param>

	<c:param name="content">
		<h2>成績参照</h2>

		<div>
			<form action="TestListSubjectExecute.action" method="get">
				<div>
					<div>
						<p>科目情報</p>
					</div>

					<div style="display:inline;">
						<label>入学年度</label>
						<select name="f1">
							<option value="0">--------</option>
							<c:forEach var="year" items="${entYearSet }">
								<%-- 現在のyearと選択されていたf1が一致していた場合selectedを追記 --%>
								<option value="${year }" <c:if test="${year==f1 }">selected</c:if>>${year }</option>
							</c:forEach>
						</select>
					</div>

					<div style="display:inline;">
						<label>クラス</label>
						<select name="f2">
							<option value="0">--------</option>
							<c:forEach var="num" items="${cNumlist }">
								<%-- 現在のnumと選択されていたf2が一致していた場合selectedを追記 --%>
								<option value="${num }" <c:if test="${num==f2 }">selected</c:if>>${num }</option>
							</c:forEach>
						</select>
					</div>

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

					<div style="display:inline;">
						<input type="hidden" name="f" value="sj" />
						<input type="submit" value="検索" />
					</div>
					<div class="mt-2 text-warning">${errors.get("1") }</div>
				</div>
			</form>

			<form action="TestListStudentExecute.action" method="get">
				<div>
					<div>
						<p>学生情報</p>
					</div>

					<div style="display:inline;">
						<label>学生番号</label>
						<input type="text" name="f4" value="${f4 }" required maxlength="10" placeholder="学生番号を入力してください"/>
					</div>

					<div style="display:inline;">
						<input type="hidden" name="f" value="st" />
						<input type="submit" value="検索" />
					</div>
				</div>
			</form>
		</div>

		<div><br /><br /></div>

		<!-- 科目別一覧表示 -->
		<c:choose>
			<c:when test="${tlslist.size()>0 }">
				<div>科目：${subject_name }</div>
				<table>
					<tr>
						<th>入学年度</th>
						<th>クラス</th>
						<th>学生番号</th>
						<th>氏名</th>
						<th>１回</th>
						<th>２回</th>
					</tr>
					<c:forEach var="test" items="${tlslist }">
						<tr>
							<td>${test.entYear }</td>
							<td>${test.classNum }</td>
							<td>${test.studentNo }</td>
							<td>${test.studentName }</td>
							<td>${test.getPoint(1) }</td>
							<td>
								<c:choose>
									<c:when test="${test.getPoint(2) != -1}">
										${test.getPoint(2) }
									</c:when>
									<c:otherwise>
										-
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<div>学生情報が存在しませんでした</div>
			</c:otherwise>
		</c:choose>
	</c:param>
</c:import>