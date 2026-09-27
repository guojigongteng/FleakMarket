package com.ct.model.ForegroundModel;

import java.util.List;

public class Order {

    //订单id
    private int id;
    //订单编号
    private String oid;
    //创建人编号
    private int cid;
    //创建人
    private String createperson;
    //创建时间
    private String createtime;
    //是否支付
    private String pay;
    //支付时间
    private String paytime;
    //商品数量
    private String productnumber;
    //商品总价
    private String producttotal;
    //收货人
    private String consignee;
    //收货人联系方式
    private String phone;
    //收货人邮箱
    private String mail;
    //收货地址
    private String address;
    //订单备注
    private String remark;

    //商品id
    private List<Integer> pid;
    //商品列表
    private List<Product> products;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCreateperson() {
        return createperson;
    }

    public void setCreateperson(String createperson) {
        this.createperson = createperson;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getPay() {
        return pay;
    }

    public void setPay(String pay) {
        this.pay = pay;
    }

    public String getPaytime() {
        return paytime;
    }

    public void setPaytime(String paytime) {
        this.paytime = paytime;
    }

    public String getProductnumber() {
        return productnumber;
    }

    public void setProductnumber(String productnumber) {
        this.productnumber = productnumber;
    }

    public String getProducttotal() {
        return producttotal;
    }

    public void setProducttotal(String producttotal) {
        this.producttotal = producttotal;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<Integer> getPid() {
        return pid;
    }

    public void setPid(List<Integer> pid) {
        this.pid = pid;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}

