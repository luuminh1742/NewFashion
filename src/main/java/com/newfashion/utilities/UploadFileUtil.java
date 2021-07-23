package com.newfashion.utilities;

import org.apache.commons.lang.StringUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class UploadFileUtil {

    //private static final String root ="/usr/var/upload/";
    private static String root ="D:/Sources/JavaWeb/MyWeb/NewFashion/NewFashion/src/main/webapp/fileupload/";

    public static void writeOrUpdateFile(byte[] bytes,String path) {
        // Tao file
        File file = new File(StringUtils.substringBeforeLast(root+path, "/"));
        // Kiem tra folder da ton tai hay chua
        if(!file.exists()) {
            // Neu folder chua ton tai thi tao folder moi
            file.mkdir();// Day la ham tao folder
        }
        // Giao quyen dong output stream cho try trong java 8
        // Khong phai dung khoi finally de dong output stream
        try(FileOutputStream fileOutputStream = new FileOutputStream(new File(root+path))){
            fileOutputStream.write(bytes);
        }catch(IOException e) {
            e.printStackTrace();
        }
    }
}
