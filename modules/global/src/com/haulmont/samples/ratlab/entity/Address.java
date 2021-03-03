package com.haulmont.samples.ratlab.entity;

import com.haulmont.chile.core.annotations.MetaClass;
import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.chile.core.annotations.NumberFormat;
import com.haulmont.cuba.core.entity.EmbeddableEntity;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
@MetaClass(name = "ratlab_Address")
@NamePattern("A:%s, %s, %s, %s|field1,field2,town,country")
public class Address extends EmbeddableEntity {
    private static final long serialVersionUID = -433127418874885914L;

    @Column(name = "COUNTRY")
    private String country;

    @Column(name = "TOWN")
    private String town;

    @Column(name = "FIELD1")
    private String field1;

    @NumberFormat(pattern = "###.#####", decimalSeparator = ".")
    @Column(name = "LATITUDE")
    private Double latitude;

    @NumberFormat(pattern = "###.#####")
    @Column(name = "LONGITUDE")
    private Double longitude;

    @Column(name = "FIELD2")
    private String field2;

    @Column(name = "FIELD3")
    private String field3;

    @Column(name = "FIELD4")
    private String field4;

    @Column(name = "FIELD5")
    private String field5;

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public String getField1() {
        return field1;
    }

    public void setField1(String field1) {
        this.field1 = field1;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getField2() {
        return field2;
    }

    public void setField2(String field2) {
        this.field2 = field2;
    }

    public String getField3() {
        return field3;
    }

    public void setField3(String field3) {
        this.field3 = field3;
    }

    public String getField4() {
        return field4;
    }

    public void setField4(String field4) {
        this.field4 = field4;
    }

    public String getField5() {
        return field5;
    }

    public void setField5(String field5) {
        this.field5 = field5;
    }
}