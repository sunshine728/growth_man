package com.myssm.bean;

import javax.persistence.*;

@Table(name = "tb_file_type")
public class TbFileType {
    @Id
    @Column(name = "file_id")
    private Integer fileId;

    @Column(name = "file_name")
    private String fileName;

    @Column(name = "file_desc")
    private String fileDesc;

    /**
     * @return file_id
     */
    public Integer getFileId() {
        return fileId;
    }

    /**
     * @param fileId
     */
    public void setFileId(Integer fileId) {
        this.fileId = fileId;
    }

    /**
     * @return file_name
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * @param fileName
     */
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    /**
     * @return file_desc
     */
    public String getFileDesc() {
        return fileDesc;
    }

    /**
     * @param fileDesc
     */
    public void setFileDesc(String fileDesc) {
        this.fileDesc = fileDesc;
    }
}