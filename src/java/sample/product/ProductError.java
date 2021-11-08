/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author USER
 */
public class ProductError {
    public String productID;
    public String name;
    public String categoryID;
    public String descr;
    public String img;
    public String quantity;
    public String price;
    public String expiration;
    public String statusID;

    public ProductError() {
    }

    public ProductError(String productID, String name, String categoryID, String descr, String img, String quantity, String price, String statusID ,String expiration) {
        this.productID = productID;
        this.name = name;
        this.categoryID = categoryID;
        this.descr = descr;
        this.img = img;
        this.quantity = quantity;
        this.price = price;
        this.statusID = statusID;
        this.expiration = expiration;
    }

    public String getProductID() {
        return productID;
    }

    public String getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) {
        this.statusID = statusID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getExpiration() {
        return expiration;
    }

    public void setExpiration(String expiration) {
        this.expiration = expiration;
    }

    
    
    
}
