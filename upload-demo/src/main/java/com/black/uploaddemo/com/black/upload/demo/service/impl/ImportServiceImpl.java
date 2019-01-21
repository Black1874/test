package com.black.uploaddemo.com.black.upload.demo.service.impl;

import com.black.uploaddemo.com.black.upload.demo.service.ImportService;
import com.black.uploaddemo.com.black.upload.demo.utils.LargeExcelFileReadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSourceUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;


@Service
public class ImportServiceImpl implements ImportService {

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;


    @Override
    public void importFile(MultipartFile[] files) {
        //解析数据
        long start = System.currentTimeMillis();

        LargeExcelFileReadUtil example = new LargeExcelFileReadUtil();

        try {
            example.processOneSheet("E:\\file\\4.主账号广莲（伙伴客户）后付费1.xlsx");
        } catch (Exception e) {
            e.printStackTrace();
        }

        LinkedHashMap<String, String> rowContents = example.getRowContents();

        Set<Map.Entry<String, String>> entries = rowContents.entrySet();
        Iterator<Map.Entry<String, String>> iterator = entries.iterator();

        ArrayList<Object[]> records = new ArrayList<>();
        int count = 0;
        Object[] objects = new Object[6];
        while (iterator.hasNext()) {
            Map.Entry<String, String> next = iterator.next();
            count++;
            objects[count] = next.getValue();
            if (count % 5 == 0) {
                objects = new Object[6];
                count = 0;
                records.add(objects);
            }

            String sql = "insert into consumer_table(consumerTime,productId, programCode, price, status, creator) values(?,?,?,?,?,?)";
            SqlParameterSource[] sqlParameterSources = SqlParameterSourceUtils.createBatch(records.toArray());
            namedParameterJdbcTemplate.batchUpdate(sql, sqlParameterSources);


            //打印执行时间
            Long end = System.currentTimeMillis();
            System.out.println("执行时间 : " + (end - start) + "执行总数 : " + count);
        }
    }


}
