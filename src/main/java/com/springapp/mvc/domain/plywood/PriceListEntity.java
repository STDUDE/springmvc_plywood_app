package com.springapp.mvc.domain.plywood;

import javax.persistence.*;

/**
 * Created by Antony on 17.08.2016.
 */
@Entity
@Table(name="price_list", schema = "", catalog = "plywood")
public class PriceListEntity {

    @EmbeddedId
    private PriceListPK priceListPK;

    @Basic
    @Column(name = "weight", nullable = false, insertable = true, updatable = true)
    private int weight;

    @Basic
    @Column(name = "price", nullable = false, insertable = true, updatable = true)
    private int price;

    public PriceListEntity() {
        priceListPK = new PriceListPK();
    }

    public PriceListPK getPriceListPK() {
        return priceListPK;
    }

    public void setPriceListPK(PriceListPK priceListPK) {
        this.priceListPK = priceListPK;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PriceListEntity that = (PriceListEntity) o;
        if (!priceListPK.equals(that.getPriceListPK())) return false;
        if (weight != 0 ? weight != that.weight : that.weight != 0) return false;
        if (price != 0 ? price != that.price : that.price != 0) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = priceListPK != null ? priceListPK.hashCode() : 0;
        result = 31 * result + weight;
        result = 31 * result + price;

        return result;
    }
}
