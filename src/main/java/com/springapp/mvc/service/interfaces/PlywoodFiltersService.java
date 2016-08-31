package com.springapp.mvc.service.interfaces;

import com.springapp.mvc.domain.plywood.BrandFilter;
import com.springapp.mvc.domain.plywood.TypeFilter;
import com.springapp.mvc.domain.plywood.ThicknessFilter;
import com.springapp.mvc.domain.plywood.SlidersFilter;

import java.util.List;

public interface PlywoodFiltersService {
    public List<BrandFilter> listBrandFilter();
    public List<TypeFilter> listTypeFilter();
    public List<ThicknessFilter> listThicknessFilter();
    public List<SlidersFilter> listSlidersFilter();
    public void renewFilters();
}