package com.myssm.bean;

import javax.persistence.*;

@Table(name = "tb_file")
public class TbFile {
    @Id
    @Column(name = "file_id")
    private Integer fileId;

    @Column(name = "file_name")
    private String fileName;

    @Column(name = "file_type")
    private Integer fileType;

    @Column(name = "file_new_path")
    private String fileNewPath;

    @Column(name = "file_old_path")
    private String fileOldPath;

    @Column(name = "user_id")
    private Integer userId;

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
     * @return file_type
     */
    public Integer getFileType() {
        return fileType;
    }

    /**
     * @param fileType
     */
    public void setFileType(Integer fileType) {
        this.fileType = fileType;
    }

    /**
     * @return file_new_path
     */
    public String getFileNewPath() {
        return fileNewPath;
    }

    /**
     * @param fileNewPath
     */
    public void setFileNewPath(String fileNewPath) {
        this.fileNewPath = fileNewPath;
    }

    /**
     * @return file_old_path
     */
    public String getFileOldPath() {
        return fileOldPath;
    }

    /**
     * @param fileOldPath
     */
    public void setFileOldPath(String fileOldPath) {
        this.fileOldPath = fileOldPath;
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