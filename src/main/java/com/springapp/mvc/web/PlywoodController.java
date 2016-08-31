package com.springapp.mvc.web;

import com.springapp.mvc.domain.plywood.PriceListEntity;
import com.springapp.mvc.service.interfaces.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by Antony on 18.08.2016.
 */

@Controller
@RequestMapping()
public class PlywoodController {
    @Autowired
    private PlywoodService plywoodService;

    @Autowired
    private PlywoodFiltersService filtersService;

    @Autowired
    private WorkWithFilesService workWithFilesService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/plywood/authentication", method = RequestMethod.GET)
    public ModelAndView authentication(@RequestParam(value = "error", required = false) String error,
                               @RequestParam(value = "logout", required = false) String logout,
                               Map<String, Object> map) {
        if (error != null) {
            map.put("error", "Invalid username or password!");
        }
        if (logout != null) {
            map.put("msg", "You've been logged out successfully.");
        }
        return new ModelAndView("common/authentication", map);
    }

    @RequestMapping(value = "/plywood/authentication", method = RequestMethod.POST)
    public ModelAndView createNewAccount(@RequestParam(value = "username") String username,
                                 @RequestParam(value = "password") String password,
                                 @RequestParam(value = "email") String email,
                                 Map<String, Object> map) {
        userService.createNewAccount(username, password, email, "ROLE_USER");
        map.put("msg", "You've been registered successfully.");
        return new ModelAndView("common/authentication", map);
    }

    private void putPagesInfo(Map<String, Object> map, String perPage, int itemsNum) {
        int itemsPerPage = (perPage == null) ? 9 : Integer.parseInt(perPage);
        int pagesNum = itemsNum / itemsPerPage;
        if (itemsNum % itemsPerPage != 0) {
            pagesNum++;
        }
        map.put("itemsPerPage", itemsPerPage);
        map.put("itemsNum", itemsNum);
        map.put("pagesNum", pagesNum);
    }

    private void putFilters(Map<String, Object> map) {
        map.put("brandList", filtersService.listBrandFilter());
        map.put("typeList", filtersService.listTypeFilter());
        map.put("thicknessList", filtersService.listThicknessFilter());
        map.put("sliders", filtersService.listSlidersFilter());
    }

    private void putPlywoodForBlocks(Map<String, Object> map) {
        //map.put("randomPlywoodList", plywoodService.randomPlywoodList());
        //map.put("newArrivalsListnewArrivalsList", plywoodService.newArrivalsList());
    }

    @RequestMapping(value = "/plywood", method = RequestMethod.GET)
    public void plywood(Map<String, Object> map) {
        List<PriceListEntity> priceList = plywoodService.listPrices();
        map.put("priceList", priceList);
        putPagesInfo(map, null, priceList.size());
        putFilters(map);
    }

    @RequestMapping(value = "/plywood", method = RequestMethod.GET, params = {"perPage"})
    public void plywoodFiltered(@RequestParam(value = "perPage") String perPage,
                            @RequestParam(value = "price", required = false) String priceRange,
                            @RequestParam(value = "brand", required = false) String brands,
                            @RequestParam(value = "type", required = false) String types,
                            @RequestParam(value = "length", required = false) String lengthRange,
                            @RequestParam(value = "width", required = false) String widthRange,
                            @RequestParam(value = "thickness", required = false) String thickness,
                            @RequestParam(value = "weight", required = false) String weightRange,
                            Map<String, Object> map) {
        List<PriceListEntity> priceList;
        if (priceRange == null
                && brands == null && types == null
                && lengthRange == null && widthRange == null
                && thickness == null && weightRange == null) {
            priceList = plywoodService.listPrices();
        } else {
            priceList = plywoodService.listFiltered(brands, types, priceRange, lengthRange,
                    widthRange, thickness, weightRange);
        }
        map.put("priceList", priceList);
        putPagesInfo(map, perPage, priceList.size());
        putFilters(map);
    }

    @RequestMapping(value = "/plywood/{productId}/{length}/{width}/{thickness}", method = RequestMethod.GET)
    public ModelAndView plywoodItem(@PathVariable("productId") String productId,
                                    @PathVariable("length") Integer length,
                                    @PathVariable("width") Integer width,
                                    @PathVariable("thickness") Integer thickness,
                                    Map<String, Object> map) {

        PriceListEntity priceListItem = plywoodService.getPriceListItem(productId, length, width, thickness);
        if (priceListItem == null) {
            return new ModelAndView("error404");
        }
        map.put("priceListItem", priceListItem);
        return new ModelAndView("plywoodItem", map);
    }
}
