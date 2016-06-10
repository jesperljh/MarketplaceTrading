/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.InputStream;
import java.util.Date;

/**
 *
 * @author jesperlim
 */
public class Product {
    private int productID;
    private String seller;
    private String buyer;
    private boolean productStatus; 
    private InputStream file;
    private String productName;
    private String description;
    private double price;
    private String size;
    private String category;
    private Date posted_date;
    private boolean report;

    public Product(String seller, String buyer, boolean productStatus, InputStream file, String productName, String description, double price, String size, String category, boolean report) {
        this.seller = seller;
        this.buyer = buyer;
        this.productStatus = productStatus;
        this.file = file;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.size = size;
        this.category = category;
        this.report = report;
    }

    public Product(int productID, String seller, String buyer, boolean productStatus, String productName, String description, double price, String size, String category, Date posted_date, boolean report) {
        this.productID = productID;
        this.seller = seller;
        this.buyer = buyer;
        this.productStatus = productStatus;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.size = size;
        this.category = category;
        this.posted_date = posted_date;
        this.report = report;
    }

    public boolean isReport() {
        return report;
    }

    public void setReport(boolean report) {
        this.report = report;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public Date getPosted_date() {
        return posted_date;
    }

    public void setPosted_date(Date posted_date) {
        this.posted_date = posted_date;
    }

    public String getSeller() {
        return seller;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }

    public String getBuyer() {
        return buyer;
    }

    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }

    public boolean isProductStatus() {
        return productStatus;
    }

    public void setProductStatus(boolean productStatus) {
        this.productStatus = productStatus;
    }

    public InputStream getFile() {
        return file;
    }

    public void setFile(InputStream file) {
        this.file = file;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    
    
}