package com.dozip.service.dozip.pay;

import com.dozip.vo.PayVO;

import java.util.List;

public interface PayService {
    PayVO getPay(String cont_no); //결제정보
    int payState(PayVO p); //결제상태 변경
    void updateState(); //해당일자가 되면 요청상태로 변경
    List<PayVO> requestPay(String mem_id); //결제요청상태 확인
    int check(); //DB null 체크
}
