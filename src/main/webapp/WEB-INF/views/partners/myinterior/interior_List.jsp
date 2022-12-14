<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../include/header.jsp"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<script src="/js/utilities.js"></script>
<script src="/js/myInterior.js"></script>
<link rel="stylesheet" href="/css/partners/myinterior.css">
<p> | 내공사 > 내공사내역</p>
<div id='interiorList_top_cont'>
    <div id='interiorList_title'>내 공사내역<a id="go_scheduleList" href="schedule_list">일정관리</a>
    </div>
    <div id='interiorList_msg'>
        현재 시공중인 공사, 완료된 공사등 모든 공사내역을 확인할 수 있는 페이지
    </div>
    <div id='interiorList_explain'>
		<img src="/images/dozip/blt_check_red.jpg">&nbsp;공사 진행상황에 따라 고객에게 중도금, 잔금을 청구할 수 있습니다
    </div>
</div>
<div id='interior_list_searchBar'>
    <label for="interior_status">시공상태</label> <select id="interior_status">
    <option value="전체"selected>전체</option>
    <option value="예정"<c:if test="${est_check=='예정'}"> selected</c:if>>예정</option>
    <option value="진행중"<c:if test="${est_check=='진행중'}"> selected</c:if>>진행중</option>
    <option value="완료"<c:if test="${est_check=='완료'}"> selected</c:if>>완료</option>
</select> <label for="balance_status">정산상태</label> <select id="balance_status">
    <option value="전체"selected>전체</option>
    <option value="계약금완납"<c:if test="${pay_state=='계약금완납'}"> selected</c:if>>계약금완납</option>
    <option value="중도금완납"<c:if test="${pay_state=='중도금완납'}"> selected</c:if>>중도금완납</option>
    <option value="잔금완납"<c:if test="${pay_state=='잔금완납'}"> selected</c:if>>잔금완납</option>
</select>
</div>

<table id="interiorList_table">
    <thead id="interiorList_table_thead">
    <tr>
        <th>일정등록</th>
        <th>계약번호</th>
        <th>시공상태</th>
        <th>공사시작(예정)일</th>
        <th>공사마감(예정)일</th>
        <th>정산하기
        </th>
        <th>계약서</th>
        <th>시공 상세정보</th>
    </tr>
    </thead>
    <tbody>
        <c:if test="${empty clist}">
            <th colspan="8"> 조회된 내역이 없습니다</th>
        </tr>
        </c:if>
        <c:if test="${!empty clist}">
            <c:forEach var="c" items="${clist}">
            <tr>
                <c:if test="${c.regit_state==1}">
                    <td class='schedule_regit_after'><button onclick="schedule_regit('${c.cont_no}')" disabled>등록완료</button></td>
                </c:if>
                <c:if test="${c.regit_state==0}">
                    <td class='schedule_regit'><button onclick="schedule_regit('${c.cont_no}')">일정등록</button></td>
                </c:if>
                <td>${c.cont_no}</td>
                <td>
                <c:if test="${today<fn:substring(c.cont_start,0,10)}">예정</c:if>
               <c:if test="${today>=fn:substring(c.cont_start,0,10) && today<=fn:substring(c.cont_end,0,10)}">진행중</c:if>
                <c:if test="${today>fn:substring(c.cont_end,0,10)}">완료</c:if>
                </td>
                <td>${fn:substring(c.cont_start,0,10)}</td>
                <td>${fn:substring(c.cont_end,0,10)}</td>
                <c:if test="${c.pay_state=='잔금결제완료'}">
                    <td style="color:red;font-weight: bold">${c.pay_state}(공사완료)</td>
                </c:if>
                <c:if test="${c.pay_state!='잔금결제완료'}">
                    <td>${c.pay_state}</td>
                </c:if>
                <%--
                계약금요청, 계약금 결제완료, 중도금결제완료, 잔금 결제완료=공사완료
                --%>
                <td><button onclick="show_contract('${c.cont_no}')" class='schedule_btn'>보기</button></td>
                <td><button onclick="est_detail('${c.est_num}')" class='schedule_btn'>보기</button></td>
            </tr>
            </c:forEach>
        </c:if>
    </tbody>
</table>
<jsp:include page="../include/footer.jsp"/>

