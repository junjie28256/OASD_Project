package BeiFen;

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
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

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
                System.out.println(request.getContextPath());
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
                System.out.println(item.getFieldName());
                String value = item.getString();
                value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
                System.out.println(value);
            }
        }
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String theme = request.getParameter("theme");
        String description = request.getParameter("description");
        String nation = request.getParameter("nation");
        String city = request.getParameter("city");
        String url = filename;
        long id = pictureDAO.getAllCount() + 1;
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = formatter.format(calendar.getTime());
        System.out.println(id+"  "+title+"  "+author+"  "+theme+"  "+description+"  "+nation+"  "+city+"  "+url+"  "+date);
        Picture picture = new Picture(id, title,author,theme,description,nation,city,url,date,0);
        pictureDAO.save(picture);





        //request.setAttribute("filename", filename);
        //request.getRequestDispatcher("/showPhoto").forward(request, response);
        response.sendRedirect("showPhoto?filename="+filename);
    }
}