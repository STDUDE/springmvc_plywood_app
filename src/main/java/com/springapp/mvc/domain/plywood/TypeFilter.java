package com.springapp.mvc.domain.plywood;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="type_filter", schema = "", catalog = "plywood")
public class TypeFilter implements Serializable{

    @Id
    @Column(name = "type", nullable = false, insertable = true, updatable = true, length = 255)
    private String type;

    @Column(name = "num", nullable = false, insertable = true, updatable = true)
    private Integer num;

    public TypeFilter() {}

    public TypeFilter(String type, Integer num) {
        this.type = type;
        this.num = num;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TypeFilter that = (TypeFilter) o;

        if (type != null ? !type.equals(that.type) : that.type != null) return false;
        if (num != null ? !num.equals(that.num) : that.num != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = type != null ? type.hashCode() : 0;
        result = 31 * result + (num != null ? num.hashCode() : 0);
        return result;
    }
}