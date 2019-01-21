package com.black.uploaddemo.com.black.upload.demo.utils;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;

public class MyExcelParseUtils {
    public static void parseExcel(MultipartFile[] files) {
        if (files == null) {
            System.out.println("文件为空!");
        }
        //创建工作簿
        Workbook wb = null;
        Row row = null;
        Cell cell = null;
        ArrayList<Object[]> objectList = new ArrayList<>();
        Object[] objects = null;

        try {
//                for (MultipartFile file : files) {
//                    //解析文件,将文件转成list对象
//                    if (isExcel2007(file.getOriginalFilename())) {
//                        wb = new XSSFWorkbook(file.getInputStream());
//                    } else {
//                        wb = new HSSFWorkbook(file.getInputStream());
//                    }
//                }
            FileInputStream fileInputStream = new FileInputStream(new File("E:\\Code\\GitHub\\test\\4.主账号广莲（伙伴客户）后付费.xlsx"));
            if (isExcel2007("E:\\Code\\GitHub\\test\\4.主账号广莲（伙伴客户）后付费.xlsx")) {
                wb = new XSSFWorkbook(fileInputStream);
            } else {
                wb = new HSSFWorkbook(fileInputStream);
            }
        } catch (Exception e) {
            System.out.println("格式不正确");
            return;
        }


        Sheet sheet = wb.getSheetAt(0);

        int rowNum = sheet.getPhysicalNumberOfRows();

        for (int x = 0; x < 10; x++) {
            row = sheet.getRow(x);
            int cellNum = row.getPhysicalNumberOfCells();
            for (int i = 0; i < cellNum; i++) {
                cell = row.getCell(i);

                //将单元格数据存储在object中  ,每一行就是一个object[]
                if (cell.getCellTypeEnum().equals(CellType.NUMERIC)) {
                    objects[i] = (int) cell.getNumericCellValue();
                }
                if (cell.getCellTypeEnum().equals(CellType.STRING)) {
                    objects[i] = cell.getStringCellValue();
                }
                if (cell.getCellTypeEnum().equals(CellType.BOOLEAN)) {
                    objects[i] = cell.getBooleanCellValue();
                }
                if (cell.getCellTypeEnum().equals(CellType.ERROR)) {
                    objects[i] = cell.getErrorCellValue();
                }

                //将一行存储在objectList中
                objectList.add(objects);


                System.out.println(objectList);


            }
        }


    }

    public static boolean isExcel2003(String filePath) {
        return filePath.matches("^.+\\.(?i)(xls)$");
    }

    public static boolean isExcel2007(String filePath) {
        return filePath.matches("^.+\\.(?i)(xlsx)$");
    }

}




