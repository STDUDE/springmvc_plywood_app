package com.springapp.mvc.dao.interfaces;

import com.springapp.mvc.domain.plywood.PlywoodEntity;
import com.springapp.mvc.domain.plywood.PriceListEntity;

import java.util.List;

/**
 * Created by Antony on 17.08.2016.
 */
public interface PlywoodDAO {
    public List<PlywoodEntity> listPlywood();
    public List<PriceListEntity> listPrices();
    public List<PriceListEntity> listFiltered(String[] brandArr, String[] typeArr, int[] priceArr, int[] lengthArr, int[] widthArr, Integer[] thicknessArr, int[] weightArr);
    public List<String[]> listPlywoodForSiteMap();
    public PriceListEntity getPriceListItem(String productId, Integer length, Integer width, Integer thickness);

    public PlywoodEntity getPlywood(String productId);
    public PriceListEntity getPriceList(String productId);

    public void addPlywood(PlywoodEntity plywood);
    public void addPriceList(PriceListEntity priceList);

    public void editPlywood(PlywoodEntity plywood);
    public void editPriceList(PriceListEntity priceList);

    public List<PlywoodEntity> randomListPlywood();
    public List<PlywoodEntity> newArrivalsList();

}
