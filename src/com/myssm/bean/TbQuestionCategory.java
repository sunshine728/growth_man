package com.myssm.bean;

import javax.persistence.*;

@Table(name = "tb_question_category")
public class TbQuestionCategory {
    @Column(name = "category_id")
    private Integer categoryId;

    @Column(name = "category_name")
    private String categoryName;

    private String desction;

    /**
     * @return category_id
     */
    public Integer getCategoryId() {
        return categoryId;
    }

    /**
     * @param categoryId
     */
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * @return category_name
     */
    public String getCategoryName() {
        return categoryName;
    }

    /**
     * @param categoryName
     */
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    /**
     * @return desction
     */
    public String getDesction() {
        return desction;
    }

    /**
     * @param desction
     */
    public void setDesction(String desction) {
        this.desction = desction;
    }
}