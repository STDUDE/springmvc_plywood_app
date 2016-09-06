package com.springapp.mvc.service.implementions;

import com.springapp.mvc.dao.interfaces.PlywoodDAO;
import com.springapp.mvc.domain.plywood.PlywoodEntity;
import com.springapp.mvc.domain.plywood.PriceListEntity;
import com.springapp.mvc.service.interfaces.PlywoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PlywoodServiceImpl implements PlywoodService {

    @Autowired
    private PlywoodDAO plywoodDAO;

    @Transactional
    public List<PlywoodEntity> listPlywood() {
        return plywoodDAO.listPlywood();
    }

    @Transactional
    public List<PriceListEntity> listPrices() {
        return plywoodDAO.listPrices();
    }

    @Transactional
    public List<PriceListEntity> listFiltered(String brands, String types,
                                              String priceRange, String lengthRange,
                                              String widthRange, String thickness,
                                              String weightRange) {
        String[] brandArr = (brands != null) ? brands.split(",") : null;
        String[] typeArr = (types != null) ? types.split(",") : null;
        int[] priceArr = (priceRange != null) ? getRangeArr(priceRange) : null;
        int[] lengthArr = (lengthRange != null) ? getRangeArr(lengthRange) : null;
        int[] widthArr = (widthRange != null) ? getRangeArr(widthRange) : null;
        Integer[] thicknessArr = (thickness != null) ? getIntegerRangeArr(thickness) : null;
        int[] weightArr = (weightRange != null) ? getRangeArr(weightRange) : null;
        return plywoodDAO.listFiltered(brandArr, typeArr, priceArr, lengthArr, widthArr, thicknessArr, weightArr);
    }

    @Transactional
    public List<String[]> listPlywoodForSiteMap(){
        return plywoodDAO.listPlywoodForSiteMap();
    }

    @Transactional
    public PriceListEntity getPriceListItem(String productId, Integer length, Integer width, Integer thickness) {
        return plywoodDAO.getPriceListItem(productId, length, width, thickness);
    }

    private int[] getRangeArr(String range) {
        return new int[]{Integer.valueOf(range.split(",")[0]), Integer.valueOf(range.split(",")[1])};
    }

    private Integer[] getIntegerRangeArr(String range) {
        String[] s_arr = range.split(",");
        int length = s_arr.length;
        Integer[] i_arr = new Integer[length];
        for(int i = 0; i < length; i++){
            i_arr[i] = Integer.valueOf(s_arr[i]);
        }
        return i_arr;
    }

    @Transactional
    public void editPlywood(PlywoodEntity plywood) {
        plywoodDAO.editPlywood(plywood);
    }

    @Transactional
    public void editPriceList(PriceListEntity priceListItem) {
        plywoodDAO.editPriceList(priceListItem);
    }

    @Transactional
    public List<PriceListEntity> randomPriceList() {
        return plywoodDAO.randomPriceList();
    }

    @Transactional
    public List<PriceListEntity> newArrivalsList() {
        return plywoodDAO.newArrivalsList();
    }
}
