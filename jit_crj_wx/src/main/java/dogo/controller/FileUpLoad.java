package dogo.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping("/fileUploadController/*")
public class FileUpLoad implements ServletContextAware{
	
private ServletContext servletContext;
	
	public void setServletContext(ServletContext context) {
		this.servletContext  = context;
	}

	//单文件上传
	@RequestMapping(value="/uploadImg.do", method = RequestMethod.POST)
	@ResponseBody
	public String handleUploadData(@RequestParam("file")CommonsMultipartFile file,HttpServletRequest request){
		if (!file.isEmpty()) {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String dateStr = sdf.format(date);
			String path = this.servletContext.getRealPath("/attached/image/"+dateStr+"/"); // 获取本地存储路径
			File file3 = new File(path);//判断文件夹是否存在
			if(!file3 .exists()){
				file3 .mkdirs();    
			}
			String fileName = file.getOriginalFilename();
			String fileType = fileName.substring(fileName.lastIndexOf("."));
			// System.out.println(fileType);
			String name = new Date().getTime() + fileType;
			File file2 = new File(path, name); // 新建一个文件
			try {
				file.getFileItem().write(file2); // 将上传的文件写入新建的文件中
			} catch (Exception e) {
				e.printStackTrace();
				return "fail";
			}
			return "/attached/image/"+dateStr+"/"+name;
		}else{
			// return "redirect:upload_error.jsp";
			return "fail";
		}
	}
}
