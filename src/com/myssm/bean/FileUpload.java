package com.myssm.bean;

import javax.persistence.*;

@Table(name = "file_upload")
public class FileUpload {
    @Column(name = "file_path")
    private String filePath;

    @Column(name = "error_msg")
    private String errorMsg;

    @Column(name = "error_code")
    private String errorCode;

    /**
     * @return file_path
     */
    public String getFilePath() {
        return filePath;
    }

    /**
     * @param filePath
     */
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    /**
     * @return error_msg
     */
    public String getErrorMsg() {
        return errorMsg;
    }

    /**
     * @param errorMsg
     */
    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }

    /**
     * @return error_code
     */
    public String getErrorCode() {
        return errorCode;
    }

    /**
     * @param errorCode
     */
    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }
}