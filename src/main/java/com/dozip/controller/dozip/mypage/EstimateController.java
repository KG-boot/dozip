package com.dozip.controller.dozip.mypage;

import com.dozip.service.dozip.estimate.EstimateService;
import com.dozip.utils.Paging;
import com.dozip.vo.BidVO;
import com.dozip.vo.EstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/dozip/*")
public class EstimateController {
    @Autowired
    private EstimateService estimateService;

    @GetMapping("my_est") //마이페이지-견적서 리스트 (지정)
    public ModelAndView myEst(ModelAndView mv, EstimateVO e, HttpServletRequest request, HttpSession session) {
        e.setMem_id((String)session.getAttribute("id"));
        int count=this.estimateService.getPListCount(e.getMem_id());

        Paging paging;
        if(request.getParameter("page") == null) {
            paging = new Paging(1, 5, count);
        }else{
            int page = Integer.parseInt(request.getParameter("page"));
            paging = new Paging(page, 5, count);
        }
        mv.addObject("p",paging);

        //리스트 출력
        List<EstimateVO> elist = new ArrayList<EstimateVO>();
        e.setStartrow(paging.getStartrow());
        e.setEndrow(paging.getEndrow());
        elist = this.estimateService.getPElist(e); //견적서(지정) 리스트
        mv.addObject("elist", elist);

        mv.setViewName("/dozip/mypage/mypage_est");
        return mv;
    }

    //입찰업체 중 하나를 선택하면 선택한 업체는 상태가 계약요청으로,
    //나머지는 거절 상태로 변경되도록 함 + 견적서테이블의 상태도 계약요청으로 변경 + EstimateT 내용도 update
    @RequestMapping(value = "my_est2_select",  method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public void bidSelect(BidVO b) {
        System.out.println("출력 : "+b.getBid_num());
        this.estimateService.updateState(b);
    }

    //견적신청(지정)에서 업체가 수락했을 때 계약요청을 보내거나 거절하기
    @RequestMapping(value = "my_est_select")
    @ResponseBody
    public void estSelect(String est_num, String est_check) {
        EstimateVO e = new EstimateVO();
        e.setEst_num(est_num);
        e.setEst_check(est_check);
        this.estimateService.updateEstate(e); //견적신청(지정) 상태변경
    }
}
