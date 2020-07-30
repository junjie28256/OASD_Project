package Servlet;

import DAO.PictureDAO;
import DaoImpl.PictureDAOImpl;
import doamin.Picture;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//@WebServlet(name = "FrontServlet")
public class FrontServlet extends HttpServlet {
    PictureDAO pictureDAO = new PictureDAOImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("this is post");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Picture> Hottest = pictureDAO.getHottest();
        List<Picture> Latest = pictureDAO.getLatest();
        request.setAttribute("hottest",Hottest);
        request.setAttribute("latest",Latest);
        System.out.println("this is get");
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
