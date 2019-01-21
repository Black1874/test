package com.black.uploaddemo.com.black.upload.demo.domain;

import java.util.Date;

public class Record {

    private Long id;

    private String consumerTime;
    private Long productId;
    private String product;
    private String programCode;
    private Double price;
    private String status;
    private String creator;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getConsumerTime() {
        return consumerTime;
    }

    public void setConsumerTime(String consumerTime) {
        this.consumerTime = consumerTime;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProgramCode() {
        return programCode;
    }

    public void setProgramCode(String programCode) {
        this.programCode = programCode;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }
}
