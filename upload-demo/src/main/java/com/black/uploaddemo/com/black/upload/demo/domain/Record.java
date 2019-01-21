package com.black.uploaddemo.com.black.upload.demo.domain;

import java.util.Date;

public class Record {

    private Long id;

    private Date consumerTime;
    private Long productId;
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

    public Date getConsumerTime() {
        return consumerTime;
    }

    public void setConsumerTime(Date consumerTime) {
        this.consumerTime = consumerTime;
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
