package com.dozip.controller.partners;

import com.dozip.service.partners.myInterior.MyInteriorService;
import com.dozip.vo.ContractVO;
import com.dozip.vo.PayVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("partners/*")
public class MyInteriorController {
    @Autowired
    MyInteriorService myInteriorService;

    @ResponseBody
    @RequestMapping(value = "/interior_list") //내공사내역
    public ModelAndView interior_list(String est_check, String pay_state, HttpSession session) {
        ContractVO vo = new ContractVO();
        vo.setBusinessNum((String) session.getAttribute("businessNum"));
        List<ContractVO> clist;

        if (est_check != null) {
            if (est_check.equals("예정")) {
                vo.setInteriorState("예정");
            } else if (est_check.equals("진행중")) {
                vo.setInteriorState("진행중");
            } else if (est_check.equals("완료")) {
                vo.setInteriorState("완료");
            }
        }

        if (pay_state != null) {
            System.out.println(pay_state);
            if(pay_state.equals("계약금완납")){
                vo.setPay_state("계약금완납");
            }
            else if(pay_state.equals("중도금완납")){
                vo.setPay_state("중도금완납");
            }
            else if(pay_state.equals("잔금완납")){
                vo.setPay_state("잔금완납");
            }
        }

        clist = myInteriorService.getContract_interior(vo);

        System.out.println(clist);
        System.out.println(clist.size());
        ModelAndView mv = new ModelAndView("/partners/myinterior/interior_List");
        mv.addObject("est_check", est_check);
        mv.addObject("pay_state", pay_state);
        mv.addObject("clist", clist);
        return mv;
    }

    @RequestMapping(value = "/show_contract") //견적서 보기
    public ModelAndView show_contract(String cont_no) {
        ModelAndView mv = new ModelAndView("/partners/myinterior/contract_res");
        mv.addObject("cv", myInteriorService.show_contract(cont_no));
        return mv;
    }
    @RequestMapping("/load_info")
    public String load_info(Model model, HttpSession session) {

        //파트너스 번호로 계약서 불러오기
        String businessNum = (String) session.getAttribute("businessNum");

        List<ContractVO> clist = myInteriorService.getContractList_port(businessNum);

        System.out.println(clist);
        model.addAttribute("clist", clist);
        return "/partners/portfolio/load_info";
    }
    @RequestMapping(value = "/schedule_list") //내공사 일정
    public ModelAndView schedule_list(HttpSession session) throws JsonProcessingException {

        List<ContractVO> slist = myInteriorService.getschedule((String) session.getAttribute("businessNum"));

        String json = new ObjectMapper().writeValueAsString(slist);
        System.out.println(slist);
        System.out.println(json);
        ModelAndView mv = new ModelAndView("/partners/myinterior/schedule_List");
        mv.addObject("json", json);
        return mv;
    }

    @RequestMapping(value = "/schedule_regit")//ajax로 일정 등록
    @ResponseBody
    public HashMap<String, Object> schedule_regit(String cont_no) {
        HashMap<String, Object> resultMap = new HashMap<>();
        int result = myInteriorService.regit_schedule(cont_no);
        resultMap.put("status", result);
        return resultMap;
    }

    @RequestMapping(value = "/balance_details") //정산 내역
    public ModelAndView balance_details(HttpSession session) {

        PayVO vo = new PayVO();
        vo.setBusinessNum((String)session.getAttribute("businessNum"));

        List<PayVO> plist = myInteriorService.getBalance(vo);  //시공완료 정산내역
        PayVO pv = myInteriorService.totalBalance(vo);         //시공완료 합계

        List<PayVO> plist_ing = myInteriorService.getBalance_ing(vo); //시공중 정산내역
        PayVO pv_ing = myInteriorService.totalBalance_ing(vo);  //시공중 합계

        ModelAndView mv = new ModelAndView("/partners/myinterior/balance_details");
        mv.addObject("plist_ing",plist_ing);
        mv.addObject("pv_ing",pv_ing);
        mv.addObject("plist",plist);
        mv.addObject("pv",pv);
        return mv;
    }


    @RequestMapping("/monthly_detail") //월별 정산 상세내역
    public ModelAndView monthly_detail(String pay_date, String pay_date_ing, HttpSession session) {
        PayVO vo= new PayVO();
        vo.setBusinessNum((String) session.getAttribute("businessNum"));
        List<PayVO> plist = null;
        int totalMontlyBal=0;
        ModelAndView mv = new ModelAndView("/partners/myinterior/monthly_details");

        if(pay_date!= null){ //시공완료
            vo.setPay_date1(pay_date);
            mv.addObject("month",pay_date);
            plist=myInteriorService.monthly_balance(vo);
            for(PayVO p: plist){
                totalMontlyBal+=Integer.parseInt(p.getPay_cost1())+Integer.parseInt(p.getPay_cost2())+Integer.parseInt(p.getPay_cost3());
            }

        }
        if(pay_date_ing!= null){//시공중
            vo.setPay_date1(pay_date_ing);
            mv.addObject("month",pay_date_ing);
            plist=myInteriorService.monthly_balance_ing(vo);
            for(PayVO p: plist){
                if(p.getPay_cost1()!= null){
                    totalMontlyBal+=Integer.parseInt(p.getPay_cost1());
                }
                if(p.getPay_cost2()!= null){
                    totalMontlyBal+=Integer.parseInt(p.getPay_cost2());
                }
                if(p.getPay_cost3()!= null){
                    totalMontlyBal+=Integer.parseInt(p.getPay_cost3());
                }
            }
        }
        System.out.println(plist);

        mv.addObject("plist", plist);
        mv.addObject("totalMontlyBal",totalMontlyBal);
        return mv;
    }
}
