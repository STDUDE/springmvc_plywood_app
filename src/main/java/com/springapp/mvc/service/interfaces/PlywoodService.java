package com.springapp.mvc.service.interfaces;

import com.springapp.mvc.domain.plywood.PlywoodEntity;
import com.springapp.mvc.domain.plywood.PriceListEntity;

import java.util.List;

/**
 * Created by Antony on 18.08.2016.
 */
public interface PlywoodService {
    public List<PlywoodEntity> listPlywood();
    public List<PriceListEntity> listPrices();
    public List<PriceListEntity> listFiltered(String brands, String types,
                                              String priceRange, String lengthRange,
                                              String widthRange, String thickness,
                                              String weightRange);
    public PriceListEntity getPriceListItem(String productId, Integer length, Integer width, Integer thickness);
    public void editPlywood(PlywoodEntity plywood);
    public void editPriceList(PriceListEntity priceList);
}
