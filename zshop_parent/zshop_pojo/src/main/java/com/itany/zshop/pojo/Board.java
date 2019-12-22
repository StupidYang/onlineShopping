package com.itany.zshop.pojo;

public class Board {
    private Integer id;
    private Integer customer_id;
    private String content;
    private String replay;

    public Board() {
    }

    public Board(Integer id, Integer customer_id, String content, String replay) {
        this.id = id;
        this.customer_id = customer_id;
        this.content = content;
        this.replay = replay;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(Integer customer_id) {
        this.customer_id = customer_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReplay() {
        return replay;
    }

    public void setReplay(String replay) {
        this.replay = replay;
    }


}
