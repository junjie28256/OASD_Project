package Servlet;

import DAO.PictureDAO;
import DaoImpl.PictureDAOImpl;
import doamin.Picture;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//@WebServlet(name = "SearchServlet2")
public class SearchServlet2 extends HttpServlet {

    public int rowsPerPage;  //每页显示的行数
    public int curPage;  //当前页页码
    public int maxPage;  //总共页数
    public PictureDAO pictureDAO = new PictureDAOImpl();
//    DBHelper db = new DBHelper();
    public SearchServlet2(){
        rowsPerPage = 6;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String m, k, s;

        m = request.getParameter("model");
        k = request.getParameter("search");
        s = request.getParameter("sort");
        if(k != null){
            Cookie cookie = new Cookie("SEARCH_MODEL",m);
            Cookie cookie1 = new Cookie("SEARCH_KEY", k);
            Cookie cookie2 = new Cookie("SEARCH_SORT",s);
            response.addCookie(cookie);
            response.addCookie(cookie1);
            response.addCookie(cookie2);
            System.out.println("①KMS分别为："+k+"---"+m+"---"+s);
        }else {

            Cookie[] cookies = request.getCookies();
            if(cookies != null && cookies.length > 0){
                String name;
                for (Cookie cookie:cookies){
                    name = cookie.getName();
                    if(name.equals("SEARCH_MODEL")){
                        m = cookie.getValue();
                    }else if(name.equals("SEARCH_KEY")){
                        k = cookie.getValue();
                    }else if(name.equals("SEARCH_SORT")){
                        s = cookie.getValue();
                    }
                }
            }

            System.out.println("②KMS分别为："+k+"---"+m+"---"+s);

            if(k == null){
                m = "title";
                k = "";
                s = "time";
                Cookie cookie = new Cookie("SEARCH_MODEL","title");
                Cookie cookie1 = new Cookie("SEARCH_KEY", "");
                Cookie cookie2 = new Cookie("SEARCH_SORT","time");
                response.addCookie(cookie);
                response.addCookie(cookie1);
                response.addCookie(cookie2);
            }



            System.out.println("③KMS分别为："+k+"---"+m+"---"+s);
        }





//        if(k != null){
//            Cookie cookie = new Cookie("SEARCH_MODEL",m);
//            Cookie cookie1 = new Cookie("SEARCH_KEY", k);
//            Cookie cookie2 = new Cookie("SEARCH_SORT",s);
//            response.addCookie(cookie);
//            response.addCookie(cookie1);
//            response.addCookie(cookie2);
//        }
//
//        System.out.println("①KMS分别为："+k+"---"+m+"---"+s);
//
//        Cookie[] cookies = request.getCookies();
//        if(cookies != null && cookies.length > 0){
//            String name;
//            for (Cookie cookie:cookies){
//                name = cookie.getName();
//                if(name.equals("SEARCH_MODEL")){
//                    m = cookie.getValue();
//                }else if(name.equals("SEARCH_KEY")){
//                    k = cookie.getValue();
//                }else if(name.equals("SEARCH_SORT")){
//                    s = cookie.getValue();
//                }
//            }
//        }
//
//        System.out.println("②KMS分别为："+k+"---"+m+"---"+s);
//
//        if(k == null){
//            m = "title";
//            k = "";
//            s = "time";
//            Cookie cookie = new Cookie("SEARCH_MODEL","title");
//            Cookie cookie1 = new Cookie("SEARCH_KEY", "");
//            Cookie cookie2 = new Cookie("SEARCH_SORT","time");
//            response.addCookie(cookie);
//            response.addCookie(cookie1);
//            response.addCookie(cookie2);
//        }
//
//
//
//        System.out.println("③KMS分别为："+k+"---"+m+"---"+s);


//
//        String key = request.getParameter("search");
//        String model = request.getParameter("model");
//        String sort = request.getParameter("sort");



        String curPage1 = request.getParameter("page");  //获取当前页页码
        if (curPage1 == null){
            curPage = 1;
            request.setAttribute("curPage",curPage);  //设置curPage对象
            System.out.println("curpage"+curPage);
        }else {
            curPage = Integer.parseInt(curPage1);
            if (curPage < 1){
                curPage = 1;
            }
            request.setAttribute("curPage",curPage);
            System.out.println("curpage"+curPage);
        }


//
//        if(model == null || model.equals(""))
//            model = "title";
//        if(key == null || key.equals(""))
//            key = "";
//        if(sort == null || sort.equals(""))
//            sort = "id";


        List<Picture> dataList;
        dataList = pictureDAO.getData(m,k,s,(curPage-1)*rowsPerPage,rowsPerPage);  //获取当前页的数据
        maxPage = (int) pictureDAO.getMaxPage(m,k,s,rowsPerPage);  //获取总页数
        request.setAttribute("dataList",dataList);
        request.setAttribute("maxPage", maxPage);
        System.out.println("datalist"+dataList);
        System.out.println("maxpage"+maxPage);


//        request.setAttribute("model",model);
//        request.setAttribute("key",key);
//        request.setAttribute("sort",sort);

        RequestDispatcher rd = request.getRequestDispatcher("Search.jsp");  //将请求转发到pagemain.jsp页面
        rd.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
