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
public class ProductDTO {
    public String productID;
    public String name;
    public String categoryID;
    public String descr;
    public String img;
    public int quantity;
    public int price;
    public String statusID;
    public String expiration;

    public ProductDTO() {
    }

    public ProductDTO(String productID, String name, String categoryID, String descr, String img, int quantity, int price, String statusID, String expiration) {
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) {
        this.statusID = statusID;
    }

    public String getExpiration() {
        return expiration;
    }

    public void setExpiration(String expiration) {
        this.expiration = expiration;
    }

    
    
    
}
