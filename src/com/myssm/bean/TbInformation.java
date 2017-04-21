package com.myssm.bean;

import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Table(name = "tb_information")
public class TbInformation {
    @Id
    @Column(name = "info_id")
    private Integer infoId;

    @Column(name = "info_date")
    private Date infoDate;

    @Column(name = "info_title")
    private String infoTitle;

    @Column(name = "create_user_id")
    private Integer createUserId;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Column(name = "create_date")
    private Date createDate;

    private Integer ispush;

    @Column(name = "info_category_id")
    private Integer infoCategoryId;

    @Column(name = "img_old_path")
    private String imgOldPath;

    @Column(name = "img_new_path")
    private String imgNewPath;

    @Column(name = "info_resource")
    private String infoResource;

    @Column(name = "info_content")
    private String infoContent;

    /**
     * @return info_id
     */
    public Integer getInfoId() {
        return infoId;
    }

    /**
     * @param infoId
     */
    public void setInfoId(Integer infoId) {
        this.infoId = infoId;
    }

    /**
     * @return info_date
     */
    public Date getInfoDate() {
        return infoDate;
    }

    /**
     * @param infoDate
     */
    public void setInfoDate(Date infoDate) {
        this.infoDate = infoDate;
    }

    /**
     * @return info_title
     */
    public String getInfoTitle() {
        return infoTitle;
    }

    /**
     * @param infoTitle
     */
    public void setInfoTitle(String infoTitle) {
        this.infoTitle = infoTitle;
    }

    /**
     * @return create_user_id
     */
    public Integer getCreateUserId() {
        return createUserId;
    }

    /**
     * @param createUserId
     */
    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    /**
     * @return create_date
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return ispush
     */
    public Integer getIspush() {
        return ispush;
    }

    /**
     * @param ispush
     */
    public void setIspush(Integer ispush) {
        this.ispush = ispush;
    }

    /**
     * @return info_category_id
     */
    public Integer getInfoCategoryId() {
        return infoCategoryId;
    }

    /**
     * @param infoCategoryId
     */
    public void setInfoCategoryId(Integer infoCategoryId) {
        this.infoCategoryId = infoCategoryId;
    }

    /**
     * @return img_old_path
     */
    public String getImgOldPath() {
        return imgOldPath;
    }

    /**
     * @param imgOldPath
     */
    public void setImgOldPath(String imgOldPath) {
        this.imgOldPath = imgOldPath;
    }

    /**
     * @return img_new_path
     */
    public String getImgNewPath() {
        return imgNewPath;
    }

    /**
     * @param imgNewPath
     */
    public void setImgNewPath(String imgNewPath) {
        this.imgNewPath = imgNewPath;
    }

    /**
     * @return info_resource
     */
    public String getInfoResource() {
        return infoResource;
    }

    /**
     * @param infoResource
     */
    public void setInfoResource(String infoResource) {
        this.infoResource = infoResource;
    }

    /**
     * @return info_content
     */
    public String getInfoContent() {
        return infoContent;
    }

    /**
     * @param infoContent
     */
    public void setInfoContent(String infoContent) {
        this.infoContent = infoContent;
    }
}