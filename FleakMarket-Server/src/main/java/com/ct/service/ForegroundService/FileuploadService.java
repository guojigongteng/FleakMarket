package com.ct.service.ForegroundService;

import com.ct.utils.UploadPathResolver;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class FileuploadService {

    //绑定文件上传路径到uploadPath
    @Value("${web.upload-path}")
    private String uploadPath;

    @Value("${web.server-url:http://localhost:1024}")
    private String serverUrl;

    //本地文件上传

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");

    public List<String> imgUpload(MultipartFile[] files) {
        List<String> result = new ArrayList<>();
        File uploadRoot = UploadPathResolver.resolve(uploadPath);
        if (!uploadRoot.exists() && !uploadRoot.mkdirs()) {
            throw new IllegalStateException("无法创建图片上传目录: " + uploadRoot.getAbsolutePath());
        }

        for (MultipartFile uploadFile : files) {

            //创建修改日期路径
            String format = sdf.format(new Date());
            File folder = new File(uploadRoot, format);

            if(!folder.isDirectory() && !folder.mkdirs()){
                throw new IllegalStateException("无法创建图片日期目录: " + folder.getAbsolutePath());
            }

            //时间戳+文件本名作为新文件名
            String fileName =  System.currentTimeMillis() + "-" + uploadFile.getOriginalFilename();
            try {
                File targetFile = new File(folder, fileName).getAbsoluteFile();
                uploadFile.transferTo(targetFile);
                //静态资源访问地址返回
                result.add(serverUrl.replaceAll("/+$", "") + "/images/" + format + fileName);
            } catch (IOException e){
                System.err.println(e.getMessage());
            }
        }
        return result;
    }

    //阿里OSS文件上传
    /*public List<String> imgUpload(MultipartFile[] files) {
        List<String> result = new ArrayList<>();
        for (MultipartFile uploadFile : files) {
            String filePath = ossFileUploadUtil.uploadFile(uploadFile);
            if(StringUtils.isNotBlank(filePath)){
                result.add(filePath);
            }
        }
        return result;
    }*/
}
