package com.springapp.mvc.domain.plywood;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="brand_filter", schema = "", catalog = "plywood")
public class BrandFilter implements Serializable{

    @Id
    @Column(name = "brand", nullable = false, insertable = true, updatable = true, length = 255)
    private String brand;

    @Basic
    @Column(name = "num", nullable = false, insertable = true, updatable = true)
    private Integer num;

    public BrandFilter() {}

    public BrandFilter(String brand, Integer num) {
        this.brand = brand;
        this.num = num;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BrandFilter that = (BrandFilter) o;

        if (brand != null ? !brand.equals(that.brand) : that.brand != null) return false;
        if (num != null ? !num.equals(that.num) : that.num != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = brand != null ? brand.hashCode() : 0;
        result = 31 * result + (num != null ? num.hashCode() : 0);
        return result;
    }
}