package com.black.uploaddemo.com.black.upload.demo.service.impl;

import com.black.uploaddemo.com.black.upload.demo.service.ImportService;
import com.black.uploaddemo.com.black.upload.demo.utils.BigDataParseExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


@Service
public class ImportServiceImpl implements ImportService {



    @Autowired
    private JdbcTemplate jdbcTemplate;


    @Override
    public void importFile(MultipartFile[] files) {




        long start = System.currentTimeMillis();

        BigDataParseExcelUtil xlx = new BigDataParseExcelUtil() {
            ArrayList<Object[]> arrayList = new ArrayList<>();
            Long count = 0L;
            Long sum = 0L;
            String sql = "insert into consumer_table(consumer_time,product_id, product,program_code, price, status, creator) values(?,?,?,?,?,?,?)";

            @Override
            public void optRows(int sheetIndex, int curRow, List<String> rowlist,List excelList)
                    throws SQLException {
                //不解析第一张表
                if(sheetIndex == 0){
                    return;
                }

                //第一行不存
                if(curRow == 0){
                    return;
                }

                count ++ ;
                Object[] objects = new Object[7];
                objects[0] = rowlist.get(0);
                objects[1] = rowlist.get(1);
                objects[2] = rowlist.get(2);
                objects[3] = rowlist.get(3);
                objects[4] = Double.parseDouble(rowlist.get(4));
                objects[5] = rowlist.get(5);
                objects[6] = rowlist.get(6);
                arrayList.add(objects);

                if(count == 10000){
                    jdbcTemplate.batchUpdate(sql, arrayList);
                    arrayList = new ArrayList<>();
                    count = 0L;
                }
                if(curRow == 499500){
                    jdbcTemplate.batchUpdate(sql, arrayList);
                }
            }
        };

        try {
//            xlx.process("E:\\Code\\GitHub\\test\\4.主账号广莲（伙伴客户）后付费.xlsx");
            xlx.process("E:\\mylearning\\4.主账号广莲（伙伴客户）后付费.xlsx");
        } catch (Exception e) {
            e.printStackTrace();
        }
        long end = System.currentTimeMillis();
        System.out.println((end - start) / 1000);
    }



}
