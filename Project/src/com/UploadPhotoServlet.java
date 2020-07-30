package com;

import DAO.PictureDAO;
import DaoImpl.PictureDAOImpl;
import doamin.Picture;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

public class UploadPhotoServlet extends HttpServlet {
    public static String filename = null;
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    public void doGet(HttpServletRequest request,HttpServletResponse response){

    }

    @SuppressWarnings("rawtypes")
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
        PictureDAO pictureDAO = new PictureDAOImpl();
        Map<String,String> map = new HashMap<>();
        int flag = 1;


        long id = pictureDAO.getAllCount() + 1;

        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = formatter.format(calendar.getTime());


        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        factory.setSizeThreshold(1024 * 1024);
        List items = null;
        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }



        Iterator iter = items.iterator();
        while(iter.hasNext()){
            FileItem item = (FileItem) iter.next();
            if(!item.isFormField()){
                // 根据时间戳创建头像文件
                filename = System.currentTimeMillis() + ".jpg";
//                System.out.println(request.getContextPath());
                /*File f = new File(getServletContext().getRealPath("upload"));*/
                File f = new File("C:\\Users\\wangj\\Desktop\\软件工程Lab\\Finally\\web\\UploadImg");
                if (!f.exists()) {
                    f.mkdir();
                }
                String imgsrc = f + "/" + filename;

                // 复制文件
                InputStream is = item.getInputStream();
                FileOutputStream fos = new FileOutputStream(imgsrc);
                byte b[] = new byte[1024 * 1024];
                int length = 0;
                while (-1 != (length = is.read(b))) {
                    fos.write(b, 0, length);
                }
                fos.flush();
                fos.close();

            }else {
                String key = item.getFieldName();
//                System.out.println(key);
                String value = item.getString();
                value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
                if(value == null || value.equals(""))
                    flag = 0;
//                System.out.println(value);
                map.put(key,value);
            }
        }
//        System.out.println(id+"  "+map.get("title")+"  "+map.get("author")+"  "+map.get("theme")+"  "+map.get("description")+"  "+map.get("nation")+"  "+map.get("city")+"  "+filename+"  "+date+"   ");
        Picture picture = new Picture(id, map.get("title"),map.get("author"),map.get("theme"),map.get("description"),map.get("nation"),map.get("city"),filename, date,0);
        pictureDAO.save(picture);

        if(flag == 1)
            request.setAttribute("uploadMessage","success");
        request.getRequestDispatcher("tttt.jsp").forward(request,response);
    }
}