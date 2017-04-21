package com.myssm.bean;

import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Table(name = "tb_baby")
public class TbBaby {
    @Id
    @Column(name = "baby_id")
    private Integer babyId;

    @Column(name = "baby_name")
    private String babyName;

    @Column(name = "baby_gender")
    private Integer babyGender;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Column(name = "baby_birth")
    private Date babyBirth;

    @Column(name = "baby_weight")
    private Float babyWeight;

    @Column(name = "baby_height")
    private Float babyHeight;

    @Column(name = "baby_old_path")
    private String babyOldPath;

    @Column(name = "baby_new_path")
    private String babyNewPath;

    @Column(name = "baby_health")
    private Integer babyHealth;

    @Column(name = "user_id")
    private Integer userId;

    /**
     * @return baby_id
     */
    public Integer getBabyId() {
        return babyId;
    }

    /**
     * @param babyId
     */
    public void setBabyId(Integer babyId) {
        this.babyId = babyId;
    }

    /**
     * @return baby_name
     */
    public String getBabyName() {
        return babyName;
    }

    /**
     * @param babyName
     */
    public void setBabyName(String babyName) {
        this.babyName = babyName;
    }

    /**
     * @return baby_gender
     */
    public Integer getBabyGender() {
        return babyGender;
    }

    /**
     * @param babyGender
     */
    public void setBabyGender(Integer babyGender) {
        this.babyGender = babyGender;
    }

    /**
     * @return baby_birth
     */
    public Date getBabyBirth() {
        return babyBirth;
    }

    /**
     * @param babyBirth
     */
    public void setBabyBirth(Date babyBirth) {
        this.babyBirth = babyBirth;
    }

    /**
     * @return baby_weight
     */
    public Float getBabyWeight() {
        return babyWeight;
    }

    /**
     * @param babyWeight
     */
    public void setBabyWeight(Float babyWeight) {
        this.babyWeight = babyWeight;
    }

    /**
     * @return baby_height
     */
    public Float getBabyHeight() {
        return babyHeight;
    }

    /**
     * @param babyHeight
     */
    public void setBabyHeight(Float babyHeight) {
        this.babyHeight = babyHeight;
    }

    /**
     * @return baby_old_path
     */
    public String getBabyOldPath() {
        return babyOldPath;
    }

    /**
     * @param babyOldPath
     */
    public void setBabyOldPath(String babyOldPath) {
        this.babyOldPath = babyOldPath;
    }

    /**
     * @return baby_new_path
     */
    public String getBabyNewPath() {
        return babyNewPath;
    }

    /**
     * @param babyNewPath
     */
    public void setBabyNewPath(String babyNewPath) {
        this.babyNewPath = babyNewPath;
    }

    /**
     * @return baby_health
     */
    public Integer getBabyHealth() {
        return babyHealth;
    }

    /**
     * @param babyHealth
     */
    public void setBabyHealth(Integer babyHealth) {
        this.babyHealth = babyHealth;
    }

    /**
     * @return user_id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * @param userId
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}