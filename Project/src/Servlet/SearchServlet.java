package Servlet;

import DAO.PictureDAO;
import DaoImpl.PictureDAOImpl;
import doamin.Picture;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//@WebServlet(name = "SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PictureDAO pictureDAO = new PictureDAOImpl();
        String key = request.getParameter("search");
        String model = request.getParameter("model");
        String sort = request.getParameter("sort");

        List<Picture> list = pictureDAO.getLikeList(model,key,sort);
        for(Picture picture:list){
            System.out.println(picture.toString());
        }
        request.setAttribute("list",list);
        request.getRequestDispatcher("Search.jsp").forward(request,response);
//        System.out.println(key);
//        System.out.println(model);
//        System.out.println(sort);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("Search.jsp");
    }
}
