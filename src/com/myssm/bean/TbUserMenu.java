package com.myssm.bean;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Table(name = "tb_user_menu")
public class TbUserMenu {
    @Id
    @Column(name = "res_id")
    private String resId;

    @Id
    @Column(name = "menu_id")
    private String menuId;

    private String creater;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Column(name = "create_date")
    private String createDate;

    @Column(name = "mod_user")
    private String modUser;

    @Column(name = "mod_date")
    private String modDate;

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
}