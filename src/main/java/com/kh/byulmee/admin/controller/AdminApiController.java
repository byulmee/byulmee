package com.kh.byulmee.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.byulmee.admin.service.AdminService;
import com.kh.byulmee.order.model.vo.Order;

@RestController
public class AdminApiController {

    private final AdminService abService;

    public AdminApiController(AdminService abService) {
        this.abService = abService;
    }

    @PostMapping("/api/admin/level/update")
    public void setAdminMemberLevel(@RequestParam("memberId") String memberId,
                                    @RequestParam("level") int level) {
        Map<String, Object> param = new HashMap<>();
        param.put("memberId", memberId);
        param.put("level", level);

        this.abService.updateMemberLevelById(param);
    }
    
    @PostMapping("/api/admin/status/update")
    public void setAdminMemberStatus(@RequestParam("memberId") String memberId,
                                    @RequestParam("status") String status) {
        Map<String, String> param = new HashMap<>();
        param.put("memberId", memberId);
        param.put("status", status);

        this.abService.updateMemberStatusById(param);
    }
    
    @PostMapping("/api/admin/open/update")
    public void setAdminBannerOpen(@RequestParam("bannerNo") String bannerNo,
                                    @RequestParam("open") String open) {
        Map<String, String> param = new HashMap<>();
        param.put("bannerNo", bannerNo);
        param.put("open", open);

        this.abService.updateAdminBannerOpenById(param);
    }
    
    @GetMapping("/api/admin/orders/monthly/sales")
    @ResponseBody
    public List<Map<String,String>> getMonthlySales(@RequestParam("year") String year) {
    	return this.abService.getMonthlySales(year);
    }
}