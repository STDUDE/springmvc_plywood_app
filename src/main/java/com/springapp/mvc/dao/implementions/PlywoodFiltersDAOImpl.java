package com.springapp.mvc.dao.implementions;


import com.springapp.mvc.dao.interfaces.PlywoodFiltersDAO;
import com.springapp.mvc.domain.plywood.BrandFilter;
import com.springapp.mvc.domain.plywood.SlidersFilter;
import com.springapp.mvc.domain.plywood.ThicknessFilter;
import com.springapp.mvc.domain.plywood.TypeFilter;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.lang.reflect.InvocationTargetException;
import java.util.*;

@Repository
public class PlywoodFiltersDAOImpl implements PlywoodFiltersDAO{

    @Autowired
    private SessionFactory sessionFactory;

    public List<?> listFilter(Class<?> clazz) {
        return (List<?>)sessionFactory.getCurrentSession().createQuery("from " + clazz.getSimpleName()).list();
    }

    @SuppressWarnings("unchecked")
    public void renewCheckboxFilter(Class clazz, String fieldName, String parentClassName) throws InvocationTargetException, NoSuchMethodException, InstantiationException, IllegalAccessException {
        deleteFrom(clazz.getSimpleName());
        List list = listCheckboxFilter(fieldName, parentClassName);
        Set<String> set = getSet(list);
        for (Object field : set) {
            Object object = getCheckboxObject(clazz, String.valueOf(field), Collections.frequency(list, field));
            saveObject(object);
        }
    }


    @SuppressWarnings("unchecked")
    private void deleteFrom(String className) {
        sessionFactory.getCurrentSession().createQuery("delete from " + className).executeUpdate();
    }

    @SuppressWarnings("unchecked")
    private List<String> listCheckboxFilter(String fieldName, String parentClassName) {
        List<String> list = new ArrayList();
        for(Object item : sessionFactory.getCurrentSession().createQuery("select A." + fieldName + " from " + parentClassName + " A").list())
        {
            list.add(String.valueOf(item));
        }
        return list;
    }

    private Set<String> getSet(List<String> list) {
        Set<String> set = new HashSet<String>();
        for(String val : list) {
            set.add(val);
        }
        return set;
    }

    @SuppressWarnings("unchecked")
    private Object getCheckboxObject(Class clazz, String fieldParam, Integer numParam) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        return clazz.getConstructor(String.class, Integer.class).newInstance(fieldParam, numParam);
    }

    @SuppressWarnings("unchecked")
    private void saveObject(Object object) {
        sessionFactory.getCurrentSession().save(object);
    }

    @SuppressWarnings("unchecked")
    public void renewSlidersFilter(Class clazz, LinkedHashMap<String,Integer> fieldInfo, String parentClassName) throws Exception {
        deleteFrom(clazz.getSimpleName());
        SlidersFilter sliders = new SlidersFilter();
        for(Map.Entry<String,Integer> entry : fieldInfo.entrySet()) {
            List values = listFilterValues(entry.getKey(), parentClassName);
            int[] minMax = roundToNum(getMinMax(values), entry.getValue());
            setSlidersField(sliders, entry.getKey(), minMax);
        }
        saveObject(sliders);
    }


    @SuppressWarnings("unchecked")
    private List listFilterValues(String fieldName, String parentClassName) {
        return sessionFactory.getCurrentSession().createQuery("select A." + fieldName + " from " + parentClassName + " A").list();
    }

    private void setSlidersField(SlidersFilter sliders, String key, int[] minMax) {
        if ("priceListPK.length".equals(key)) {
            sliders.setLengthMin(minMax[0]);
            sliders.setLengthMax(minMax[1]);
        } else if ("priceListPK.width".equals(key)) {
            sliders.setWidthMin(minMax[0]);
            sliders.setWidthMax(minMax[1]);
        } else if ("weight".equals(key)) {
            sliders.setWeightMin(minMax[0]);
            sliders.setWeightMax(minMax[1]);
        } else if ("price".equals(key)) {
            sliders.setPriceMin(minMax[0]);
            sliders.setPriceMax(minMax[1]);
        }
    }

    private int[] getMinMax(List<Integer> listParam) {
        int min = Integer.MAX_VALUE;
        int max = Integer.MIN_VALUE;
        for(Integer param : listParam) {
            min = Math.min(min, param);
            max = Math.max(max, param);
        }
        return new int[]{min,max};
    }

    private int[] roundToNum(int[] minMax, int num) {
        if(minMax[0] % num != 0) {
            minMax[0] -= minMax[0] % num;
        }
        if(minMax[1] % num != 0) {
            minMax[1] += (num - minMax[1] % num);
        }
        if(minMax[0] == minMax[1]) {
            minMax[0] -= num;
        }
        return minMax;
    }
}
