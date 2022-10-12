package com.dozip.dao;

import com.dozip.vo.PartnersVO;
import com.dozip.vo.PortfolioVO;

public interface PartnersDAO {
    PartnersVO getPartnersInfo(String pId);

    void addPortfolio(PortfolioVO pv);

    int getPort_num(PortfolioVO pv);

    void insertPartners(PartnersVO pv);

    PartnersVO getPartnersInfo2(String findid_business_num);

    void insertPort_Photos(PortfolioVO pv);
}

