package com.springapp.mvc.domain.plywood;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="thickness_filter", schema = "", catalog = "plywood")
public class ThicknessFilter implements Serializable{

    @Id
    @Column(name = "thickness", nullable = false, insertable = true, updatable = true, length = 255)
    private String thickness;

    @Column(name = "num", nullable = false, insertable = true, updatable = true)
    private Integer num;

    public ThicknessFilter() {}

    public ThicknessFilter(String thickness, Integer num) {
        this.thickness = thickness;
        this.num = num;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getThickness() {
        return thickness;
    }

    public void setThickness(String thickness) {
        this.thickness = thickness;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ThicknessFilter that = (ThicknessFilter) o;

        if (thickness != null ? !thickness.equals(that.thickness) : that.thickness != null) return false;
        if (num != null ? !num.equals(that.num) : that.num != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = thickness != null ? thickness.hashCode() : 0;
        result = 31 * result + (num != null ? num.hashCode() : 0);
        return result;
    }
}