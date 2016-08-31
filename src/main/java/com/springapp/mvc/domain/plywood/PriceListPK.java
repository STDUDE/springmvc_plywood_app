package com.springapp.mvc.domain.plywood;


import javax.persistence.CascadeType;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;

@Embeddable
public class PriceListPK implements Serializable {

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "product_id", referencedColumnName = "id", nullable = false)
    private PlywoodEntity plywood;

    private Integer width;

    private Integer length;

    private Integer thickness;

    public PriceListPK() {}

    public PriceListPK(PlywoodEntity plywood, Integer length, Integer width, Integer thickness) {
        this.plywood = plywood;
        this.length = length;
        this.width = width;
        this.thickness = thickness;
    }

    public PlywoodEntity getPlywood() {
        return plywood;
    }

    public void setPlywood(PlywoodEntity plywood) {
        this.plywood = plywood;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    public Integer getThickness() {
        return thickness;
    }

    public void setThickness(Integer thickness) {
        this.thickness = thickness;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof PriceListPK)) return false;

        PriceListPK that = (PriceListPK) o;

        if (!(width == that.width && length == that.length && thickness == that.thickness)) return false;
        if (!plywood.getProductId().equals(that.plywood.getProductId())) return false;

        return true;
    }

    @Override
    public int hashCode() {
        Integer result = width * length * thickness;
        result = 31 * result + plywood.getProductId().hashCode();
        return result;
    }
}
