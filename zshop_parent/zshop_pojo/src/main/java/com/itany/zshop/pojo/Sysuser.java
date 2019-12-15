package com.itany.zshop.pojo;

import java.io.Serializable;
import java.util.Date;

public class Sysuser implements Serializable {
    private  Integer id;
    private String name;
    private String loginName;
    private String password;
    private String phone;
    private String email;
    private Integer isValid;
    private Date createDate;

}
