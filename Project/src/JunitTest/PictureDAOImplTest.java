package JunitTest;

import DaoImpl.PictureDAOImpl;
//import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;
import doamin.Picture;
import org.junit.jupiter.api.Test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

class PictureDAOImplTest {
    PictureDAOImpl pictureDAO = new PictureDAOImpl();

    @Test
    void save() {
        Picture picture = new Picture(3,"5qqq","zyx","efe3","wefwng","China","anhui","9.jpg","2020-4-8 18:20:20", 0);
        pictureDAO.save(picture);
    }

    @Test
    void delete() {
        pictureDAO.delete(25);
    }

    @Test
    void get() {
        System.out.println(pictureDAO.get(2).toString());
    }

    @Test
    void getAll() {
        List<Picture> l = pictureDAO.getAll();
        for(Picture picture:l){
            System.out.println(picture.toString());
        }
    }

    @Test
    void getAllCount() {
        long count = pictureDAO.getAllCount();
        System.out.println(count);
    }

    @Test
    void getHottest() {
        List<Picture> list = pictureDAO.getHottest();
        for (Picture picture : list){
            System.out.println(picture.getHeat());
        }
    }

    @Test
    void getLatest() {
        List<Picture> list = pictureDAO.getLatest();
        for (Picture picture : list){
            System.out.println(picture.getId());
        }
    }
    @Test
    void data(){
//        SimpleDateFormat formatter= new SimpleDateFormat("YYYY-MM-DD HH:MM:SS");
//        Date date = new Date(System.currentTimeMillis());
//        System.out.println(formatter.format(date));

//        Date date = new Date();
//        SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:MM:SS");
//        System.out.println(formatter.format(date));

        Calendar calendar = Calendar.getInstance();

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

//        Date date = formatter.format(calendar.getTime());
        System.out.println(formatter.format(calendar.getTime()));


    }
    @Test
    void cast(){
        int num1 = 1;
        int num2 = (int) num1;
        System.out.println(num2);
    }

    @Test
    void getlikelist(){
        List<Picture> list = pictureDAO.getLikeList("title","wwwe","id");
        for(Picture picture:list){
            System.out.println(picture.toString());
        }
    }

    @Test
    void getData(){
        List<Picture> list = pictureDAO.getData("title","wwwe","heat",2,2);
        for(Picture picture:list){
            System.out.println(picture.toString());
        }
    }
    @Test
    void getMaxPage(){
        long page = pictureDAO.getMaxPage("title","wwwe","id",3);
        System.out.println(page);
    }

    @Test
    void getMine(){
        List<Picture> l = pictureDAO.getMine("2",0,2);
        for (Picture picture:l){
            System.out.println(picture.toString());
        }
    }

    @Test
    void getMinePage(){
        long count = pictureDAO.getMinePage("2",2);
        System.out.println(count);
    }
    @Test
    void testLenth(){
        String str = "wwee汪dd";
        System.out.println(str.length());
    }

    @Test
    void testAddHeat(){
        pictureDAO.AddHeat(45);
    }

}