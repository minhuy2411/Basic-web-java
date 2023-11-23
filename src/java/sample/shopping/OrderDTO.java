/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Date;

/**
 *
 * @author ☢ minhuy ☣
 */
public class OrderDTO {
    private String name;
    private String address;
    private Date date;
    private String phone;
    private Double total;

    public OrderDTO() {
    }

    public OrderDTO(String name, String address, Date date, String phone, Double total) {
        this.name = name;
        this.address = address;
        this.date = date;
        this.phone = phone;
        this.total = total;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
     
    
}
