<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" />

<style>
    #scheduleList_title a {font-size: 16px;margin-left: 40px;color: saddlebrown;}
    #scheduleList_title{font-size: 26px;font-weight: 530;border-bottom: 4px solid #000;line-height: 2em;}
</style>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<p> | 내공사 > 내공사내역</p>
<div id="scheduleList_title">
    일정관리<a href="interior_list">내공사내역</a></div>
<div id='calendar' style="width: 100%; margin: 20px 0px;"></div>

<script>
    let allData = JSON.parse('${json}'); //달력에 담을 json 데이터
    let allDataArray=[];
    let oneDayData={};
    let scheduleData;

    for(let i=0; i< allData.length;i++) {
        oneDayData ={
            'title': allData[i].cont_no+"번 "+allData[i].cont_title,
            'start': allData[i].cont_start,
            'end': allData[i].cont_end,
        }
        allDataArray.push(oneDayData);
    }
    document.addEventListener('DOMContentLoaded', function() {
        let calendarEl = document.getElementById('calendar');
        let calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar : {
                left : 'prev,next,today',
                center : 'title',
                right : 'dayGridMonth,dayGridWeek'
            },
            initialDate : '${today}',
            navLinks : true, // can click day/week names to navigate views
            //editable : true,
            dayMaxEvents : true, // allow "more" link when too many events
            events :allDataArray
        });
        calendar.render();
    });
</script>
<jsp:include page="../include/footer.jsp" />