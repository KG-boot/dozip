<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="./mypage_header.jsp" />
<%-- 상단 공통부분 끝 --%>
<style>
    /*정보수정*/
    #my_info_modify {
        width: 99%;
        margin: 20px auto;
    }
    #mim_wrap {
        width:100%;
        display: flex;
        justify-content:space-between;
        flex-direction: column;
        align-items: center;
    }
    .mim_table_box {
        width: 80%;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 100px;
    }
    .mim_table {
        width: 100%;
        /*border-collapse: collapse;*/
        border-top: 2px solid #1d1d1d;
    }
    .mim_table th {
        font-size: 0.9rem;
        width: 20%;
        height: 70px;
        border-bottom: 1px solid #B3B9BE;
        background-color: #f8f8f8;
    }
    .mim_table td {
        border: none;
        text-decoration: none;
        border-bottom: 1px solid #B3B9BE;
        background-color: white;
    }
    .mim_table td>input{
        width: 60%;
        height: 25px;
        margin: 5px 0;
        margin-left: 20px;
    }
    #emailbox>input{
        width: 25%;
        height: 25px;
    }
    #emailbox>select{
        width: 20%;
        height: 25px;
    }
    #mem_domain { margin-left: 0;}
    #mem_zip {
        width: 20%;
        height: 25px;
        margin: 5px 0;
        margin-left: 20px;
    }
    #mem_addr1 {
        width: 60%;
        height: 25px;
        margin: 5px 0;
        margin-left: 20px;
    }

    #search_btn {
        height : 20px;
        padding: 6px 20px;
        color: white;
        font-size: 0.9rem;
        font-weight:bold;
        letter-spacing: 1px;
        border: none;
        background-color: #347844;
    }
    #mim_btn {
        width: 40%;
        color: white;
        font-size: 1.2rem;
        padding: 10px 0px;
        font-weight: bold;
        border: none;
        background-color: #347844;
        margin: 30px auto;
        letter-spacing: 2px;
    }
    .edit_info {
        width: 100%;
        text-align: left;
        margin-left: 30px;
    }
    .edit_info>ul>li {
        list-style: none;
        padding-left: 10px;
    }
    .pf_box > input[type='radio'] {
        width: 15px; height: 15px;
        font-size: 15px;
        accent-color: #347844;
    }
</style>

<%-- 정보수정 --%>
<div class="mypage_body" id="my_info_modify">
    <div id="mim_wrap">
        <div class="edit_info">
            <p style="font-size: 1.7rem; font-weight: bold; margin: 0;">회원정보 수정</p>
            <ul style="padding:0px;">
                <li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;고객님의 주소와 연락처 등 개인정보를 수정하실 수 있습니다.</li>
                <li style="font-size: 0.8rem;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;휴대전화번호와 이메일은 한번 더 확인하시어 정확한 안내를 받으시기 바랍니다.</li>
            </ul>
        </div>
        <hr style="width: 100%; border:0px; border-top: #7f8c8d double;"/>
        <p style="width: 80%; font-weight: bold;">나의 정보관리</p>
        <form class="mim_table_box">
            <table class="mim_table">
                <tr>
                    <th>아이디</th><td><input type="text" name="mem_id" id="mem_id" readonly value="${id}"></td>
                </tr>
                <tr>
                    <th>이름</th><td><input type="text" name="mem_name" id="mem_name" value="${m.mem_name}"></td>
                </tr>
                <tr>
                    <th>연락처</th><td><input type="text" name="mem_tel" id="mem_tel" value="${m.mem_tel}"></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td id="emailbox">
                        <input type="text"  name="mem_email"  id="mem_email" value="${m.mem_email}" />
                        <span>@</span>
                        <input type="text"  name="mem_domain"  id="mem_domain" value="${m.mem_domain}"/>
                        <select name="domain_list" id="domain_list" onchange="changeSelect(this.value);">
                            <option selected>직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="gmail.com">gamil.com</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <input type="text" name="mem_zip" id="mem_zip" readonly placeholder="우편번호" value="${m.mem_zip}"/>
                        <a id="search_btn" onclick="openAddr()">주소검색</a>
                        <br/>
                        <input type="text" name="mem_addr1" id="mem_addr1" readonly placeholder="주소" value="${m.mem_addr1}"/>
                        <br/>
                        <input type="text" name="mem_addr2" id="mem_addr2" placeholder="상세주소를 입력해주세요." value="${m.mem_addr2}"/>
                    </td>
                </tr>
                <tr>
                    <th>프로필</th>
                    <td class="pf_box" style="display: flex; padding: 5px;">
                        <input type='radio' name='mem_pf' value='pf01' /><img src="/images/dozip/profile/pf01.png" style="width:70px; height:70px;"/>
                        <input type='radio' name='mem_pf' value='pf02' /><img src="/images/dozip/profile/pf02.png" style="width:70px; height:70px;"/>
                        <input type='radio' name='mem_pf' value='pf03' /><img src="/images/dozip/profile/pf03.png" style="width:70px; height:70px;"/>
                        <input type='radio' name='mem_pf' value='pf04' /><img src="/images/dozip/profile/pf04.png" style="width:70px; height:70px;"/>
                        <input type='radio' name='mem_pf' value='pf05' /><img src="/images/dozip/profile/pf05.png" style="width:70px; height:70px;"/>
                        <input type='radio' name='mem_pf' value='pf06' /><img src="/images/dozip/profile/pf06.png" style="width:70px; height:70px;"/>
                    </td>
                </tr>
            </table>
            <button type="button" id="mim_btn">수정하기</button>
        </form>
    </div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function openAddr(){
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("mem_zip").value = data.zonecode;
                document.getElementById("mem_addr1").value = data.address; // 주소 넣기
                document.getElementById("mem_addr2").focus(); //상세입력 포커싱
            }
        }).open();
    }

    $(document).ready(function (){
        $("input:radio[name='mem_pf']:radio[value='${m.mem_pf}']").prop('checked', true);
    })

    document.getElementById('mim_btn').onclick = function (){

        function params_list() {
            var params = {};  //배열 선언
            var data = $(".mim_table_box").serializeArray(); //폼태그에 있는 데이터 담기

            $.each(data, function () { //반복문
                var name = $.trim(this.name);  //name 변수에 this.data 의 name 파라미터 값
                var value = $.trim(this.value);  //value 변수에 this.data 의 value 값
                params[name] = value; //params 배열에 키, 값 쌍으로 저장
            });
            return params;
            alert(params);
        }

        $.ajax({
            url : '/dozip/my_edit_ok',
            type : 'post',
            dataType : 'json',
            data : {
                member : JSON.stringify(params_list())
            },
            success : function(data) {
                if(parseInt(data)==1){
                    alert("회원정보 수정이 완료되었습니다.");
                    location.href = "/dozip/mypage_main";
                }else{
                    alert("회원정보 수정에 실패했습니다.");
                    location.reload();
                }
            },
            error:function(){
                alert("실패");
            }
        })
    }
</script>

<%-- 하단 공통부분 --%>
<jsp:include page="./mypage_footer.jsp" />