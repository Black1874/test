package com.black.uploaddemo.com.black.upload.demo.controller;

import com.black.uploaddemo.com.black.upload.demo.service.ImportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
public class UploadController {

    @Autowired
    private ImportService importService;

    @RequestMapping(value="/file")
    public String getIndex(){
        return "file";
    }


    @PostMapping(value="/upload",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String fileUpload(MultipartFile[] files){
        if(files != null){
            for (MultipartFile file : files) {
                String originalFilename = file.getOriginalFilename();

                //文件保存
                String path = "E:\\Code\\GitHub\\test" ;
                File fileDst = new File(path + "\\" + originalFilename);
                try {
                    file.transferTo(fileDst);
                } catch (IOException e) {
                    e.printStackTrace();
                }

                //文件解析
                importService.importFile(files);



            }

            return "上传成功!";
        }


        return "上传失败!";
    }


}
