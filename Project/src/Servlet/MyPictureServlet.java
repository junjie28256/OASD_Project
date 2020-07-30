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

//@WebServlet(name = "MyUploadServlet")
public class MyPictureServlet extends HttpServlet {

    public int rowsPerPage;  //每页显示的行数
    public int curPage;  //当前页页码
    public int maxPage;  //总共页数
    public PictureDAO pictureDAO = new PictureDAOImpl();
    //    DBHelper db = new DBHelper();
    public MyPictureServlet(){
        rowsPerPage = 6;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        List<Picture> dataList;
        dataList = pictureDAO.getMine("2",(curPage-1)*rowsPerPage,rowsPerPage);  //获取当前页的数据
        maxPage = (int) pictureDAO.getMinePage("2",rowsPerPage);  //获取总页数
        request.setAttribute("dataList",dataList);
        request.setAttribute("maxPage", maxPage);
        System.out.println("datalist"+dataList);
        System.out.println("maxpage"+maxPage);

        RequestDispatcher rd = request.getRequestDispatcher("MyUpload.jsp");  //将请求转发到pagemain.jsp页面
        rd.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
