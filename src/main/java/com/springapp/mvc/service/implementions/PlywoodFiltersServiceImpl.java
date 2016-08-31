package com.springapp.mvc.service.implementions;

import com.springapp.mvc.dao.interfaces.PlywoodFiltersDAO;
import com.springapp.mvc.domain.plywood.*;
import com.springapp.mvc.service.interfaces.PlywoodFiltersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedHashMap;
import java.util.List;

@Service
public class PlywoodFiltersServiceImpl implements PlywoodFiltersService {
    @Autowired
    private PlywoodFiltersDAO filtersDAO;

    @Transactional
    @SuppressWarnings("unchecked")
    public List<BrandFilter> listBrandFilter() {
        return (List<BrandFilter>) filtersDAO.listFilter(BrandFilter.class);
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public List<TypeFilter> listTypeFilter() {
        return (List<TypeFilter>)filtersDAO.listFilter(TypeFilter.class);
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public List<ThicknessFilter> listThicknessFilter() {
        return (List<ThicknessFilter>)filtersDAO.listFilter(ThicknessFilter.class);
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public List<SlidersFilter> listSlidersFilter() {
        return (List<SlidersFilter>)filtersDAO.listFilter(SlidersFilter.class);
    }

    @Transactional
    public void renewFilters() {
        try {
            filtersDAO.renewCheckboxFilter(BrandFilter.class, "brand", PlywoodEntity.class.getSimpleName());
            filtersDAO.renewCheckboxFilter(TypeFilter.class, "type", PlywoodEntity.class.getSimpleName());
            filtersDAO.renewCheckboxFilter(ThicknessFilter.class, "priceListPK.thickness", PriceListEntity.class.getSimpleName());
            LinkedHashMap<String,Integer> fieldInfo = new LinkedHashMap<String, Integer>(){{
                put("priceListPK.length", 10);
                put("priceListPK.width", 10);
                put("weight", 10);
                put("price", 1);
            }};
            filtersDAO.renewSlidersFilter(SlidersFilter.class, fieldInfo, PriceListEntity.class.getSimpleName());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
