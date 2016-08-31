package com.springapp.mvc.dao.interfaces;

import com.springapp.mvc.domain.plywood.BrandFilter;
import com.springapp.mvc.domain.plywood.SlidersFilter;
import com.springapp.mvc.domain.plywood.ThicknessFilter;
import com.springapp.mvc.domain.plywood.TypeFilter;

import java.lang.reflect.InvocationTargetException;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Antony on 23.08.2016.
 */
public interface PlywoodFiltersDAO {
    public List<?> listFilter(Class<?> tClass);
    public void renewCheckboxFilter(Class clazz, String fieldName, String parentClassName) throws InvocationTargetException, NoSuchMethodException, InstantiationException, IllegalAccessException;
    public void renewSlidersFilter(Class clazz, LinkedHashMap<String,Integer> fieldInfo, String parentClassName) throws Exception;
}
