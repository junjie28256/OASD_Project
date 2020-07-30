package Servlet;

import DAO.PictureDAO;
import DaoImpl.PictureDAOImpl;
import doamin.Picture;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
//        if(request.getParameter("model") == )

//
//        String model = (String) request.getAttribute("model");
//        String key = (String) request.getAttribute("key");
//        String sort = (String) request.getAttribute("sort");



        String key = request.getParameter("search");
        String model = request.getParameter("model");
        String sort = request.getParameter("sort");



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



        if(model == null || model.equals(""))
            model = "title";
        if(key == null || key.equals(""))
            key = "";
        if(sort == null || sort.equals(""))
            sort = "id";


        List<Picture> dataList;
        dataList = pictureDAO.getData(model,key,sort,(curPage-1)*rowsPerPage,rowsPerPage);  //获取当前页的数据
        maxPage = (int) pictureDAO.getMaxPage(model,key,sort,rowsPerPage);  //获取总页数
        request.setAttribute("dataList",dataList);
        request.setAttribute("maxPage", maxPage);
        System.out.println("datalist"+dataList);
        System.out.println("maxpage"+maxPage);


        request.setAttribute("model",model);
        request.setAttribute("key",key);
        request.setAttribute("sort",sort);

        RequestDispatcher rd = request.getRequestDispatcher("Search.jsp");  //将请求转发到pagemain.jsp页面
        rd.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
