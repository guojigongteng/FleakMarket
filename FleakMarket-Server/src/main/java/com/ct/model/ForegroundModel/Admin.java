package com.ct.model.ForegroundModel;

public class Admin {
    //管理员id
    private int id;
    //管理员用户名
    private String username;
    //管理员密码
    private String password;
    //管理员联系方式
    private String phone;
    //管理员真实姓名
    private String tname;
    //管理员最后登录时间
    private String logintime;
    //管理员账户级别
    private String lv;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getLogintime() {
        return logintime;
    }

    public void setLogintime(String logintime) {
        this.logintime = logintime;
    }

    public String getLv() {
        return lv;
    }

    public void setLv(String lv) {
        this.lv = lv;
    }
}

