<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page = "../common/header.jsp"/>
<%-- 상단 공통부분 끝--%>
<link rel="stylesheet" type="text/css" href="/css/dozip/port_detail.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	
	 <div class="clear"></div>
      
   <!-- 본문영역 -->
   <div class = "detail_wrap">
   <hr>
      <div class = "detail_1">
         <div class = "detail_img">
            <img id = "main_img" src = "${pf.pf_photo1}"/>
            <br><br>
            <div class = "d_main">
               <h2 id = "d_title">${pf.pf_title}</h2>
               <br>
               <pre id = "d_location"><img id = "d_loca" src = "/images/dozip/portfolio/location_icon.png"/>${pf.pf_addr1}</pre>
               <br>
               <div class = "d_tags">
                  <button type = "button" id = "type">${pf.pf_concept}</button>
                  <button type = "button" id = "cate" >${pf.pf_subtype}</button>
                  <button type = "button" id = "amount">${pf.pf_area}평</button>
                  <button type = "button" id = "price">${pf.pf_cost}만원</button>
                  <button type = "button" id = "time">${pf.pf_period}주</button>
               </div>
               <div class = "d_check">
                  <%--
                  <div class = "scrap">
                     <h3>스크랩하기</h3>
                     <label class="switch">
                          <input type="checkbox">
                          <span class="slider round"></span>
                     </label>
                     <p id = "scrap_no">Scrap하기</p><p id = "scrap_ok" style="display:none;">Scrap완료</p>
                     <script>
                        var check = $("input[type='checkbox']");
                        check.click(function(){
                              $("p").toggle();
                        });
                     </script>
                  </div>
                  --%>
                  <%--
                  <div class = "direct_contact">
                     <button type = "button" id = "contact" onclick = "openContact()">업체컨택하기</button>
                  </div>

                  <script>
                     function openContact(){
                        window.open("dir_contact.jsp","_blank",
                              "toolbar = no, menubar = no, scrollbars=no, resizable=no, width=500, height=750, left=0, top=0");
                     }
                  </script>
                  --%>
               </div>
            </div>
         </div>
      </div>
      <br><br>
      <div class = "detail_2">
         <div class = "detail_cont1">
            <p id = "start_cont">
            ${pf.pf_introduction}
            </p>
         </div>
         <div class = "detail_imgs">
            <img id = "d_imgs1" src = "${pf.pf_photo1}"/>
            <img id = "d_imgs2" src = "${pf.pf_photo2}"/>
            <img id = "d_imgs3" src = "${pf.pf_photo3}"/>
            <img id = "d_imgs4" src = "${pf.pf_photo4}"/>
            <img id = "d_imgs5" src = "${pf.pf_photo5}"/>
         </div>
         <div class = "detail_cont2">
            <p id = "end_cont">
            ${pf.pf_closing}
            </p>
         </div>
      </div>
   </div>
   <br><br>
   <%-- 업체 명함 부분 --%>
   <div class = "comp_card">
      <c:if test="${pst.p_Comp_logo eq null}">
      <div class=   "comp_img">
         <img id = "comp_logo" src = "/images/dozip/portfolio/detail/frog.png"/>
      </div>
      </c:if>
      <c:if test="${pst.p_Comp_logo ne null}">
         <div class=   "comp_img">
            <img id = "comp_logo2" src = "${pst.p_Comp_logo}"/>
         </div>
      </c:if>
      <div class = "comp_name">
         <div class = "name">${pt.businessName}</div>


        <c:if test="${pt.p_Addr1 !=''||pt.p_Addr1 ne null}">
           <pre id = "comp_loca">${pt.p_Addr1}</pre>
        </c:if>

        <c:if test = "${pt.p_Addr1 eq null}">
           <pre id = "comp_loca_no"> </pre>
        </c:if>

      </div>
      <div class = "comp_detail">
         <button type = "button" id = "comp" onclick = "location = 'comp_detail?businessName=${pt.businessName}&bNum=${pt.businessNum}'">더보러가기</button>
      </div>

   </div>
   <br><br>
   

<%--하단 공통부분 --%>   
<jsp:include page = "../common/footer.jsp"/>   