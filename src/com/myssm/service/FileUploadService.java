package com.myssm.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.myssm.bean.FileUpload;
import com.myssm.mapper.FileUploadMapper;

@Transactional
@Service
public class FileUploadService {

	@Autowired
	private FileUploadMapper fileUploadMapper;
   public FileUpload uploadFileTest(MultipartFile file, String fileType, String filePath){
       FileUpload fileUpload = new FileUpload();

	   if (file != null) {

           String fileName = file.getOriginalFilename();
           //获取上传文件的后缀
           String suffix = file.getOriginalFilename().substring(fileName.lastIndexOf(".") + 1);
           // 文件保存路径
           // 路径不存在  则建立目录
           File fileTmp = new File(filePath);
           if (!fileTmp.exists()) {
               fileTmp.mkdirs();
           }
           if (file.isEmpty()) {
               // 未选择文件
               // 未选择文件
               fileUpload.setErrorCode("0");
               fileUpload.setErrorMsg("未选择文件");
               return fileUpload;
           } else {
               if ("image".equals(fileType)) {
                   // 格式
                   if (!"JPG".equalsIgnoreCase(suffix) && !"PNG".equalsIgnoreCase(suffix) && !"JPEG".equalsIgnoreCase(suffix) && !"BMP".equalsIgnoreCase(suffix)
                           && !"GIF".equalsIgnoreCase(suffix) && !"PCX".equalsIgnoreCase(suffix) && !"TIFF".equalsIgnoreCase(suffix)) {
                       fileUpload.setErrorCode("3");
                       fileUpload.setErrorMsg("文件格式不正确");
                       return fileUpload;
                   }
               }

               // 文件原名称
               String originFileName = file.getOriginalFilename();
               List<String> filePathList = new ArrayList<String>();
               String base = String.valueOf(new SimpleDateFormat("yyyyMMdd").format(new Date()));     
               Random random = new Random();     
               StringBuffer sb = new StringBuffer(); 
               sb.append(base);
               for (int i = 0; i < 10; i++) {     
                   int number = random.nextInt(base.length());     
                   sb.append(base.charAt(number));     
               }   
               sb.append(".");
               sb.append(suffix);
//               String filePathTmp = filePath + File.separator + file.getOriginalFilename();
               filePathList.add(String.valueOf(sb));
               System.out.println("输出：---------------"+filePathList);
              fileUpload.setFilePath(filePathList.get(0));
               try {
                   //这里使用Apache的FileUtils方法来进行保存
                   FileUtils.copyInputStreamToFile(file.getInputStream(),
                           new File(filePath, filePathList.get(0)));
                   fileUpload.setErrorCode("1");
                   fileUpload.setErrorMsg("上传成功");
                  
                  fileUploadMapper.insertSelective(fileUpload);
               } catch (IOException e) {
                   fileUpload.setErrorCode("2");
                   fileUpload.setErrorMsg("上传失败");
                   fileUploadMapper.insertSelective(fileUpload);

                   e.printStackTrace();
               }
           }
       }
	return fileUpload;
	   
   };

}
