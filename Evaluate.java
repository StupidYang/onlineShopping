package com.itany.zshop.pojo;

public class Evaluate {
    private Integer id;
    private Integer product_id;
    private String evaluate;
    private String images;

    public Evaluate() {
    }

    public Evaluate(Integer id, Integer product_id, String evaluate, String images) {
        this.id = id;
        this.product_id = product_id;
        this.evaluate = evaluate;
        this.images = images;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
    }

    public String getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "Evaluate{" +
                "id=" + id +
                ", product_id=" + product_id +
                ", evaluate='" + evaluate + '\'' +
                ", images='" + images + '\'' +
                '}';
    }
}
