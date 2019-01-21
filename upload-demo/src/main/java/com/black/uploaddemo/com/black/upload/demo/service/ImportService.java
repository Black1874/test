package com.black.uploaddemo.com.black.upload.demo.service;

import org.springframework.web.multipart.MultipartFile;

public interface ImportService {

    /**
     * 处理导入文件
     * @param files
     */
    void importFile(MultipartFile[] files);
}
