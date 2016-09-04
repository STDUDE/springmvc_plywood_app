package com.springapp.mvc.dao.interfaces;

import com.springapp.mvc.domain.plywood.PriceListEntity;

import java.util.List;

public interface PriceListDAO {
    public List<PriceListEntity> listPrices();
    public List<PriceListEntity> listFiltered(String[] brandArr, String[] typeArr, int[] priceArr, int[] lengthArr, int[] widthArr, Integer[] thicknessArr, int[] weightArr);
    public PriceListEntity getPriceListItem(String productId, Integer length, Integer width, Integer thickness);

    public PriceListEntity getPriceList(String productId);

    public void addPriceList(PriceListEntity priceList);

    public void editPriceList(PriceListEntity priceList);
}
