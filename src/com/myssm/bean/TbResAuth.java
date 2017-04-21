package com.myssm.bean;

import javax.persistence.*;

@Table(name = "tb_res_auth")
public class TbResAuth {
    @Id
    @Column(name = "create_date")
    private String createDate;

    @Id
    private String creater;

    @Id
    @Column(name = "menu_id")
    private String menuId;

    @Id
    @Column(name = "mod_date")
    private String modDate;

    @Id
    @Column(name = "mod_user")
    private String modUser;

    @Id
    @Column(name = "res_id")
    private String resId;

    /**
     * @return create_date
     */
    public String getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate
     */
    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    /**
     * @return creater
     */
    public String getCreater() {
        return creater;
    }

    /**
     * @param creater
     */
    public void setCreater(String creater) {
        this.creater = creater;
    }

    /**
     * @return menu_id
     */
    public String getMenuId() {
        return menuId;
    }

    /**
     * @param menuId
     */
    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    /**
     * @return mod_date
     */
    public String getModDate() {
        return modDate;
    }

    /**
     * @param modDate
     */
    public void setModDate(String modDate) {
        this.modDate = modDate;
    }

    /**
     * @return mod_user
     */
    public String getModUser() {
        return modUser;
    }

    /**
     * @param modUser
     */
    public void setModUser(String modUser) {
        this.modUser = modUser;
    }

    /**
     * @return res_id
     */
    public String getResId() {
        return resId;
    }

    /**
     * @param resId
     */
    public void setResId(String resId) {
        this.resId = resId;
    }
}