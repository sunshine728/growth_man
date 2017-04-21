package com.myssm.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



import com.myssm.bean.TbFile;
import com.myssm.bean.TbUser;
import com.myssm.service.TbFileService;
import com.alibaba.fastjson.*;

@Controller
@RequestMapping("/upload")
public class TbFileController {

	@Autowired
	private TbFileService resourceService;

	@RequestMapping("/re")
	public String resourceOp(HttpSession session, Model model) {
		TbUser user = null;
		try {
			user = (TbUser) session.getAttribute("USERONLINE");
		} catch (Exception e) {

		}
		if (user == null) {
			return "err";
		}

		List<TbFile> res = resourceService.selByUserId(user.getUserId());
		model.addAttribute("resources", JSON.toJSONString(res));
		return "fileLoad";
	}

	@ResponseBody
	@RequestMapping("/del")
	public String delRe(String reIds, String op) {
		String[] ids = reIds.split("_");
		List<Integer> is = new ArrayList<Integer>();
		for (String str : ids) {
			is.add(Integer.parseInt(str));
		}
		if ("del".equals(op)) {
			try {
				resourceService.delByResourceId(is);

			} catch (Exception e) {
				return "delErr";
			}

			return "delSuccess";

		}

		
		return null;
	}
	
	
	@RequestMapping("/download")
	public String downLoad( String reIds, String op,HttpServletRequest request,
			HttpServletResponse response){
		String[] ids = reIds.split("_");
		List<Integer> is = new ArrayList<Integer>();
		for (String str : ids) {
			is.add(Integer.parseInt(str));
		}
		if ("download".equals(op)) {
			System.out.println("download");
			List<TbFile> res = resourceService.selByreIds(is);
			String realPath = request.getServletContext().getRealPath("");
			if (res.size() > 0) {
				for (TbFile re : res) {
					if (re.getFileNewPath() != null) {
						File file = new File(realPath, re.getFileNewPath());
						
						if (file.exists()) {
							//application/vnd.rn-realmedia-vbr   attachment;
							//application/octet-stream   application/force-download x-msdownload
							response.setCharacterEncoding("utf-8");
							response.setContentType("application/x-msdownload");// 设置强制下载不打开
							response.addHeader("Content-Disposition","fileName=" + re.getFileName());// 设置文件名
							byte[] buffer = new byte[1024];
							FileInputStream fis = null;
							BufferedInputStream bis = null;
							//FileOutputStream fpStream=null;
							
							
							System.out.println(file+"-----------");
							try {
								fis = new FileInputStream(file);
								bis = new BufferedInputStream(fis);
								OutputStream os = response.getOutputStream();
//								File file2=new File("D:",re.getResName());
//								fpStream=new FileOutputStream(file2);
								int i = bis.read(buffer);
								while (i != -1) {
									os.write(buffer, 0, i);
									i = bis.read(buffer);
								}
							} catch (Exception e) {
								// TODO: handle exception
								e.printStackTrace();
							} finally {
								if (bis != null) {
									try {
										bis.close();
									} catch (IOException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								}
								if (fis != null) {
									try {
										fis.close();
									} catch (IOException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								}
							}
							
							
							

						}
					}
				}
			}
		}
		return null;
	}

	@RequestMapping("/files_upload")
	public String upload() {
		return "upload";
	}

	@RequestMapping("/files_load")
	@ResponseBody
	public String upfile(MultipartFile file, HttpSession session,
			HttpServletRequest request, ModelMap model) {

	
		String path = request.getSession().getServletContext()
				.getRealPath("upload");

		String fileName = file.getOriginalFilename();
		String hash = file.hashCode() + fileName;
		File targetFile = new File(path, hash);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		TbUser user = null;
		try {
			user = (TbUser) session.getAttribute("USERONLINE");
		} catch (Exception e) {

		}
		if (user == null) {
			return JSON.toJSONString("notLogin");
		}
		// 保存
		try {
			file.transferTo(targetFile);
			TbFile re = new TbFile();
			//re.setCreatedate(new Date());
			re.setFileName(fileName);
			re.setFileNewPath("upload/" + hash);
			re.setUserId(user.getUserId());

			resourceService.addResource_re(re);
		} catch (Exception e) {
			e.printStackTrace();
			return JSON.toJSONString("err");
		}

		return JSON.toJSONString("success");
	}
}
