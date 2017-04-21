package com.myssm.bean;

import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Table(name = "tb_actity")
public class TbActity {
    @Id
    @Column(name = "actity_id")
    private Integer actityId;

    @Column(name = "actity_title")
    private String actityTitle;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Column(name = "actity_startdate")
    private Date actityStartdate;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Column(name = "actity_enddate")
    private Date actityEnddate;

    @Column(name = "create_user_id")
    private Integer createUserId;

    @Column(name = "actity_content")
    private String actityContent;

    /**
     * @return actity_id
     */
    public Integer getActityId() {
        return actityId;
    }

    /**
     * @param actityId
     */
    public void setActityId(Integer actityId) {
        this.actityId = actityId;
    }

    /**
     * @return actity_title
     */
    public String getActityTitle() {
        return actityTitle;
    }

    /**
     * @param actityTitle
     */
    public void setActityTitle(String actityTitle) {
        this.actityTitle = actityTitle;
    }

    /**
     * @return actity_startdate
     */
    public Date getActityStartdate() {
        return actityStartdate;
    }

    /**
     * @param actityStartdate
     */
    public void setActityStartdate(Date actityStartdate) {
        this.actityStartdate = actityStartdate;
    }

    /**
     * @return actity_enddate
     */
    public Date getActityEnddate() {
        return actityEnddate;
    }

    /**
     * @param actityEnddate
     */
    public void setActityEnddate(Date actityEnddate) {
        this.actityEnddate = actityEnddate;
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
     * @return actity_content
     */
    public String getActityContent() {
        return actityContent;
    }

    /**
     * @param actityContent
     */
    public void setActityContent(String actityContent) {
        this.actityContent = actityContent;
    }
}