package com.springapp.mvc.web;

import com.springapp.mvc.service.interfaces.HmcService;
import com.springapp.mvc.service.interfaces.PlywoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
public class CommonController {

    @Autowired
    private PlywoodService plywoodService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home(Map<String,Object> map) {
        putMachinesForBlocks(map);
        return new ModelAndView("index", map);
    }

    private void putMachinesForBlocks(Map<String, Object> map) {
        map.put("priceList", plywoodService.randomPriceList());
        map.put("arrivalsList", plywoodService.newArrivalsList());
    }

    @RequestMapping(value = "/error403", method = RequestMethod.GET)
    public void error403() { }

    @RequestMapping(value = "/error404", method = RequestMethod.GET)
    public void error404() { }

    @RequestMapping(value = "/error500", method = RequestMethod.GET)
    public void error500() { }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin() {
        return "redirect:/admin/";
    }

    @RequestMapping(value = "/hmc/", method = RequestMethod.GET)
    public String hmc() {
        return "redirect:/hmc";
    }

    @RequestMapping(value = "/plywood/", method = RequestMethod.GET)
    public String plywood() {
        return "redirect:/plywood";
    }

    @RequestMapping(value = "/siteMap", method = RequestMethod.GET)
    public void siteMap(Map<String, Object> map) {
        map.put("shortPlywoodList", plywoodService.listPlywoodForSiteMap());
    }


}