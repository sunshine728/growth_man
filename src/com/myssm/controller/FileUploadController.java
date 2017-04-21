package com.myssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myssm.bean.FileUpload;
import com.myssm.bean.TbBaby;
import com.myssm.bean.TbUser;
import com.myssm.service.FileUploadService;
import com.myssm.service.TbBabyService;
import com.myssm.service.TbUserService;
@Controller
@RequestMapping("/file")
public class FileUploadController {
	@Autowired
	private TbUserService tbUserService;
	@Autowired
	private FileUploadService fileUploadService;
	@Autowired
	private TbBabyService tbBabyService;
    @RequestMapping(value = "/fileUpload")
    @ResponseBody
    public FileUpload fileUpload(HttpServletRequest request,@RequestParam("file") MultipartFile file,HttpSession session){

        FileUpload fileUpload = new FileUpload();
        // 文件类型
        String fileType = request.getParameter("fileType");

        String levelPath = "";
        TbUser user;
		try {
			user = (TbUser)session.getAttribute("USERONLINE");
			 List<TbBaby> baby=tbBabyService.selectByUserId(user.getUserId());
		        if(baby.size()!=0){
		        	 levelPath = "user/";
		             // 文件路径
		             String filePath = request.getSession().getServletContext().getRealPath("/")  +  levelPath;
		             System.out.println("文件路径"+filePath);
		             try {
		                 fileUpload = fileUploadService.uploadFileTest(file,fileType,filePath);
		                 fileUpload.setErrorCode("1");
		                 fileUpload.setErrorMsg("上传成功");
		                String fileNameTmp = file.getOriginalFilename();
		                 String filePathTmp = request.getContextPath() + "/" +levelPath+fileNameTmp;
		     /*            fileUpload.setFilePath(filePathTmp);
		      * 
		     */            
		                 fileUpload.setFilePath(request.getContextPath() + "/" +levelPath+fileUpload.getFilePath());

		                 // 上传头像
		                 if ("image".equals(fileType)) {
		                  baby.get(0).setBabyNewPath(fileUpload.getFilePath());
		                  baby.get(0).setBabyOldPath(filePathTmp);
		                     tbBabyService.updateBabyInfo(baby.get(0), user.getUserId());
		                 }
		                
		             }catch (Exception e){
		                 e.printStackTrace();
		                 fileUpload.setErrorCode("0");
		                 fileUpload.setErrorMsg("上传失败");
		             }

		        }else{
		        	 fileUpload.setErrorCode("0");
		             fileUpload.setErrorMsg("还未存在对应的宝宝信息");	
		        }
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			fileUpload.setErrorCode("0");
            fileUpload.setErrorMsg("当前用户尚未登录");
		}
       
           
        return fileUpload;
    }
}
