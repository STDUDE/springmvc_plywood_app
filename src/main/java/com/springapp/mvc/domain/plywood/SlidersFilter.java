package com.springapp.mvc.domain.plywood;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="sliders_filter", schema = "", catalog = "plywood")
public class SlidersFilter implements Serializable{
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "length_min")
    private int lengthMin;

    @Column(name = "length_max")
    private int lengthMax;

    @Column(name = "width_min")
    private int widthMin;

    @Column(name = "width_max")
    private int widthMax;

    @Column(name = "weight_min")
    private int weightMin;

    @Column(name = "weight_max")
    private int weightMax;

    @Column(name = "price_min")
    private int priceMin;

    @Column(name = "price_max")
    private int priceMax;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLengthMin() {
        return lengthMin;
    }

    public void setLengthMin(int lengthMin) {
        this.lengthMin = lengthMin;
    }

    public int getLengthMax() {
        return lengthMax;
    }

    public void setLengthMax(int lengthMax) {
        this.lengthMax = lengthMax;
    }

    public int getWidthMin() {
        return widthMin;
    }

    public void setWidthMin(int widthMin) {
        this.widthMin = widthMin;
    }

    public int getWidthMax() {
        return widthMax;
    }

    public void setWidthMax(int widthMax) {
        this.widthMax = widthMax;
    }

    public int getWeightMin() {
        return weightMin;
    }

    public void setWeightMin(int weightMin) {
        this.weightMin = weightMin;
    }

    public int getWeightMax() {
        return weightMax;
    }

    public void setWeightMax(int weightMax) {
        this.weightMax = weightMax;
    }

    public int getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(int priceMin) {
        this.priceMin = priceMin;
    }

    public int getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(int priceMax) {
        this.priceMax = priceMax;
    }
}


