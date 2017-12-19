package com.xq.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by joy12 on 2017/11/5.
 */
public class FileUpload {
    public static int number=0;//多个照片上传时 容易导致 处理过快  在“同一时刻”生成 即 文件名的时间戳一样

    public static final String COMMENT_TEACHER_ROOT_PATH = "img/comment/teacher/";
    public static final String COMMENT_ORGANIZATION_ROOT_PATH = "img/comment/organization/";
    public static final String ICON_TEACHER_ROOT_PATH = "img/info/teacher/";
    public static final String ICON_PARENT_ROOT_PATH = "img/info/parent/";

    //    路径规范 images/2012/9/25/1343287394783.jpg  按照时间戳+随机数来生成
    public static String uploadFile(MultipartFile file, HttpServletRequest request,String rp) throws IOException {
        String root_path="";

        root_path = request.getSession().getServletContext().getRealPath(rp);

        Calendar now = Calendar.getInstance();
        String path=root_path+"/"+now.get(Calendar.YEAR)+"/"+(now.get(Calendar.MONTH) + 1)+"/"+now.get(Calendar.DAY_OF_MONTH)+"/";
        File tempFile = new File(path, new Date().getTime()+number+".jpg");
        if (!tempFile.getParentFile().exists()) {
            System.out.println(tempFile.getParentFile());
            tempFile.getParentFile().mkdirs();
        }
        if (!tempFile.exists()) {
            tempFile.createNewFile();
        }
        file.transferTo(tempFile);

        number++;
        if(number==10){
            number=0;
        }
        return tempFile.getAbsolutePath();
    }
}
