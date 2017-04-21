package com.myssm.bean;

import javax.persistence.*;

@Table(name = "tb_user_baby")
public class TbUserBaby {
    @Id
    @Column(name = "user_id")
    private Integer userId;

    @Id
    @Column(name = "baby_id")
    private Integer babyId;

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
}