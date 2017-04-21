package com.myssm.bean;

import javax.persistence.*;

@Table(name = "tb_resource")
public class TbResource {
    @Id
    @Column(name = "p_res_id")
    private String pResId;

    @Id
    private String descn;

    @Id
    @Column(name = "menu_id")
    private String menuId;

    @Id
    @Column(name = "res_id")
    private String resId;

    /**
     * @return p_res_id
     */
    public String getpResId() {
        return pResId;
    }

    /**
     * @param pResId
     */
    public void setpResId(String pResId) {
        this.pResId = pResId;
    }

    /**
     * @return descn
     */
    public String getDescn() {
        return descn;
    }

    /**
     * @param descn
     */
    public void setDescn(String descn) {
        this.descn = descn;
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